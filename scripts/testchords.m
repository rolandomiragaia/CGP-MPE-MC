function test(varargin)

    classifiers = Classifiers(varargin).get();

    for i = 1:size(classifiers, 2)

        tn = [];
        fp = [];
        tp = [];
        fn = [];
        current_classifier = classifiers(i).classifier_;

        config = Configuration(current_classifier.pitch);
        config = config.config_;
        config.signal.threshold = current_classifier.threshold;
        config.signal.pitch = current_classifier.pitch;
        %config.signal.type = 'record';
        config.signal.polyphony = 'chords';
        fitness = Fitness(config);

        % test with different set
        inputs = Inputs(config.signal, 'test-negative').get();
        fields_ = fieldnames(inputs);
        if strcmp(config.signal.polyphony, 'chords')
            negativeTC = dir(['transcription/dataset/chords/test/negative/', config.signal.pitch, '/*.wav']);
        else
            negativeTC = dir('transcription/dataset/single/test/all/*.wav');
            indexes = [];
            for k = 1:size(negativeTC, 1)
                if ~isempty(strfind(negativeTC(k).name, current_classifier.pitch))
                    indexes = [indexes, k];
                end
            end
            negativeTC(indexes) = [];
        end

        for k = 1:size(inputs.(fields_{1}), 1)
            inp_ = struct();

            for l = 1:size(config.signal.inputs, 2)
                i_ = inputs.(fields_{l});
                inp_.(fields_{l}) = i_(k, :);
            end

            if isfield(current_classifier, 'SIZE')
                if isempty(current_classifier.STRUCTURE.connectionGenes)
                    current_classifier.STRUCTURE = cgptoolbox.Structure(struct(...
                        'genes', current_classifier.SIZE.GENES, ...
                        'genes_per_node', current_classifier.SIZE.GENES_PER_NODE, ...
                        'inputs', current_classifier.SIZE.INPUTS, ...
                        'connection_genes', current_classifier.SIZE.CONNECTION_GENES, ...
                        'parameters', current_classifier.SIZE.PARAMETERS, ...
                        'computational_nodes', current_classifier.SIZE.CONNECTION_NODES ...
                    ));
                end
                score = fitness.testCompute( ...
                    current_classifier.SIZE, ...
                    current_classifier.STRUCTURE, ...
                    current_classifier.genes, ...
                    current_classifier.active, ...
                    inp_, ...
                    current_classifier.functions ...
                );
            else
                score = fitness.testCompute( ...
                    current_classifier.sizes, ...
                    current_classifier.structure, ...
                    current_classifier.genes, ...
                    current_classifier.active, ...
                    inp_, ...
                    current_classifier.functions ...
                );
            end

            if score == 0
                tn = [tn, k];
            else
                fp = [fp, k];
            end
        end

        inputs = Inputs(config.signal, 'test-positive').get();
        fields_ = fieldnames(inputs);
        if strcmp(config.signal.polyphony, 'chords')
            positiveTC = dir(['transcription/dataset/chords/test/positive/', config.signal.pitch, '/*.wav']);
        else
            positiveTC = dir(['transcription/dataset/single/test/', config.signal.pitch, '/*.wav']);
        end

        for k = 1:size(inputs.(fields_{1}), 1)
            inp_ = struct();

            for l = 1:size(config.signal.inputs, 2)
                i_ = inputs.(fields_{l});
                inp_.(fields_{l}) = i_(k, :);
            end
            if isfield(current_classifier, 'SIZE')
                score = fitness.testCompute( ...
                    current_classifier.SIZE, ...
                    current_classifier.STRUCTURE, ...
                    current_classifier.genes, ...
                    current_classifier.active, ...
                    inp_, ...
                    current_classifier.functions ...
                );
            else
                score = fitness.testCompute( ...
                    current_classifier.sizes, ...
                    current_classifier.structure, ...
                    current_classifier.genes, ...
                    current_classifier.active, ...
                    inp_, ...
                    current_classifier.functions ...
                );
            end

            if score == 1
                tp = [tp, k];
            else
                fn = [fn, k];
            end
        end

        score_ = FMeasure(size(tp, 2), size(tn, 2), size(fp, 2), size(fn, 2)).get();

        testing_file = fopen(['transcription/classifiers/', current_classifier.pitch, '/', current_classifier.run_directory, '/', num2str(i), '-chords.txt'], 'w');

        fprintf( ...
            testing_file, ...
            'test score:%.16f\ntrue positives: %d\ntrue negatives: %d\nfalse positives: %d\nfalse negatives: %d\n', ...
            score_, ...
            size(tp, 2), size(tn, 2), size(fp, 2), size(fn, 2) ...
        );

        % if size(tp, 2) > 0
        %    fprintf(testing_file, '\ntrue positives:\n');
        %    fprintf(testing_file, '%s\n', positiveTC(tp).name);
        %end

        %if size(tn, 2) > 0
        %    fprintf(testing_file, '\ntrue negatives:\n');
        %    fprintf(testing_file, '%s\n', negativeTC(tn).name);
        %end

        if size(fp, 2) > 0
            %fprintf(testing_file, '\nfalse positives: \n');
            %fprintf(testing_file, '%s\n', negativeTC(fp).name);
        end

        if size(fn, 2) > 0
            %fprintf(testing_file, '\nfalse negatives: \n');
            %fprintf(testing_file, '%s\n', positiveTC(fn).name);
        end
    end
end
