classdef Test

    properties
    end

    methods

        function this = Test(config, fitness, report)

            dir_ = dir(['transcription/classifiers/', config.signal.pitch, '/*.mat']);

            for i = 1:size(dir_, 1)
                %file_ = ['transcription/classifiers/', config.signal.pitch, '/', config.signal.pitch, '.fitter.mat'];
                classifierObject = load(dir_(i).name);
                % classifierObject(1).current_classifier.pitch = folders(i).name;
                classifierObject.classifier_.name = dir_(i).name;
                classifiers(i) = classifierObject.classifier_;
            end



            for i = 1:size(classifiers, 2)

                testing_file = fopen([report.config_.runs_directory, 'test-', classifiers(i).name(1:end-4), '.txt'], 'a');
                tn = [];
                fp = [];
                tp = [];
                fn = [];
                predicted = [];
                expected = [];
                current_classifier = classifiers(i);
                config.signal.pitch = classifiers(i).pitch;

                % test with different set
                inputs = Inputs(config.signal, 'test-negative').get();
                negativeTC = dir('transcription/dataset/single/test/all/*.wav');
                indexes = [];
                for k = 1:size(negativeTC, 1)
                    if ~isempty(strfind(negativeTC(k).name, classifiers(i).pitch))
                        indexes = [indexes, k];
                    end
                end

                negativeTC(indexes) = [];

                current_classifier = classifiers(i);
                for k = 1:size(inputs.real, 1)
                    score = fitness.testCompute( ...
                        current_classifier.sizes, ...
                        current_classifier.structure, ...
                        current_classifier.genes, ...
                        current_classifier.active, ...
                        struct( ...
                            'real', inputs.real(k,:), ...
                            'absolute', inputs.absolute(k,:), ...
                            'imaginary', inputs.imaginary(k,:), ...
                            'phase', inputs.phase(k,:) ...
                        ), ...
                        current_classifier.functions ...
                    );

                    predicted = [predicted, score];
                    expected = [expected, 0];
                    if score == 0
                        tn = [tn, k];
                    else
                        fp = [fp, k];
                    end
                end

                inputs = Inputs(config.signal, 'test-positive').get();
                positiveTC = dir(['transcription/dataset/single/test/', config.signal.pitch, '/*.wav']);

                for k = 1:size(inputs.real, 1)
                    score = fitness.testCompute( ...
                        current_classifier.sizes, ...
                        current_classifier.structure, ...
                        current_classifier.genes, ...
                        current_classifier.active, ...
                        struct( ...
                            'real', inputs.real(k,:), ...
                            'absolute', inputs.absolute(k,:), ...
                            'imaginary', inputs.imaginary(k,:), ...
                            'phase', inputs.phase(k,:) ...
                        ), ...
                        current_classifier.functions ...
                    );

                    predicted = [predicted, score];
                    expected = [expected, 1];
                    if score == 1
                        tp = [tp, k];
                    else
                        fn = [fn, k];
                    end
                end

                score_ = FMeasure(size(tp, 2), size(tn, 2), size(fp, 2), size(fn, 2)).get();

                fprintf( ...
                    testing_file, ...
                    'test score:%.16f\ntrue positives: %d\ntrue negatives: %d\nfalse positives: %d\nfalse negatives: %d\n', ...
                    score_, ...
                    size(tp, 2), size(tn, 2), size(fp, 2), size(fn, 2) ...
                );

                if size(tp, 2) > 0
                    fprintf(testing_file, '\ntrue positives:\n');
                    fprintf(testing_file, '%s\n', positiveTC(tp).name);
                end

                if size(tn, 2) > 0
                    fprintf(testing_file, '\ntrue negatives:\n');
                    fprintf(testing_file, '%s\n', negativeTC(tn).name);
                end

                if size(fp, 2) > 0
                    fprintf(testing_file, '\nfalse positives: \n');
                    fprintf(testing_file, '%s\n', negativeTC(fp).name);
                end

                if size(fn, 2) > 0
                    fprintf(testing_file, '\nfalse negatives: \n');
                    fprintf(testing_file, '%s\n', positiveTC(fn).name);
                end

                fclose(testing_file);
            end

        end
    end
end
