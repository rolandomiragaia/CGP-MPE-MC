function test(varargin)

    classifiers = Classifiers(varargin).get();

    for i = 1:size(classifiers, 2)

        tn = [];
        fp = [];
        tp = [];
        fn = [];
        current_classifier = classifiers(i).classifier_;

        CONFIG = Configuration(current_classifier.pitch);
        CONFIG = CONFIG.CONFIG_;
        CONFIG.signal.threshold = current_classifier.threshold;
        CONFIG.signal.pitch = current_classifier.pitch;

        fitness = Fitness(CONFIG);

        % test with different set
        inputs = Inputs(CONFIG.signal, 'test-negative').get();
        fields_ = fieldnames(inputs);
        if strcmp(CONFIG.signal.polyphony, 'chords')
            negativeTC = dir(['transcription/dataset/chords/test/negative/', CONFIG.signal.pitch, '/*.wav']);
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
            
            for l = 1:size(CONFIG.signal.inputs, 2)
                i_ = inputs.(fields_{l});
                inp_.(fields_{l}) = i_(k, :);
            end
            score = fitness.testCompute( ...
                current_classifier.SIZE, ...
                current_classifier.STRUCTURE, ...
                current_classifier.genes, ...
                current_classifier.active, ...
                inp_, ...
                current_classifier.functions ...
            );

            if score == 0
                tn = [tn, k];
            else
                fp = [fp, k];
            end
        end

        inputs = Inputs(CONFIG.signal, 'test-positive').get();
        fields_ = fieldnames(inputs);
        if strcmp(CONFIG.signal.polyphony, 'chords')
            positiveTC = dir(['transcription/dataset/chords/test/positive/', CONFIG.signal.pitch, '/*.wav']);
        else
            positiveTC = dir(['transcription/dataset/single/test/', CONFIG.signal.pitch, '/*.wav']);
        end

        for k = 1:size(inputs.(fields_{1}), 1)
            inp_ = struct();
            
            for l = 1:size(CONFIG.signal.inputs, 2)
                i_ = inputs.(fields_{l});
                inp_.(fields_{l}) = i_(k, :);
            end
            score = fitness.testCompute( ...
                current_classifier.SIZE, ...
                current_classifier.STRUCTURE, ...
                current_classifier.genes, ...
                current_classifier.active, ...
                inp_, ...
                current_classifier.functions ...
            );

            if score == 1
                tp = [tp, k];
            else
                fn = [fn, k];
            end
        end

        score_ = FMeasure(size(tp, 2), size(tn, 2), size(fp, 2), size(fn, 2)).get();

        testing_file = fopen(['transcription/classifiers/', current_classifier.pitch, '/', current_classifier.run_directory, '/', num2str(i), '.txt'], 'w');

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
            fprintf(testing_file, '\nfalse positives: \n');
            fprintf(testing_file, '%s\n', negativeTC(fp).name);
        end

        if size(fn, 2) > 0
            fprintf(testing_file, '\nfalse negatives: \n');
            fprintf(testing_file, '%s\n', positiveTC(fn).name);
        end
    end
end
