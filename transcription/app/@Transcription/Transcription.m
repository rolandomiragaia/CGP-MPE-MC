classdef Transcription < handle

    properties (Access = private)

    end

    methods (Access = public)

        function this = Transcription(varargin)
            classifiers = Classifiers(varargin{1}).get();
            music = Record(struct(), 'music');
            file_ = fopen('results/transcription.txt', 'w');
            fprintf(file_, 'onset\toffset\tpitch\n');
            onset = '';
            offset = '';
            hasNote = 0;
            % transcription = zeros(1000, 3);

            for j = 1:size(classifiers, 2)
                classifier_ = classifiers(j).classifier_;
                config = load('transcription/classifiers/cfg.mat');
                config = config.config;
                config.signal.threshold = classifier_.threshold;
                config.signal.pitch = classifier_.pitch;

                [maximuns, peaks] = findpeaks(music.audio_, 'MinPeakDistance', 1024);
                %for i = 1:1024:size(music.audio_, 2)
                for i = 1:size(peaks, 2)
                    % if has 4096 samples of audio available to test
                    if size(music.audio_, 2) - peaks(i) >= config.signal.samples

                        fitness_ = Fitness(config);

                        % music.audio_(i:i + config.signal.samples - 1)
                        inputs_ = this.convertAudioToInput_( ...
                            config.signal.samples, ...
                            config.signal.fft_samples, ...
                            music.audio_(peaks(i):peaks(i) + config.signal.samples - 1) ...
                        );

                        result = fitness_.testCompute( ...
                            classifier_.sizes, ...
                            classifier_.structure, ...
                            classifier_.genes, ...
                            classifier_.active, ...
                            inputs_, ...
                            classifier_.functions ...
                        );

                        if result
                            if ~hasNote
                                hasNote = 1;
                                onset = peaks(i)/config.signal.sampling_frequency; % i/config.signal.sampling_frequency;
                            end
                        else
                            if hasNote
                                %offset = (i + config.signal.samples) / config.signal.sampling_frequency;
                                offset = (peaks(i) + config.signal.samples) / config.signal.sampling_frequency;

                                if exist('transcription', 'var')
                                    index = size(transcription, 1) + 1;
                                else
                                    index = 1;
                                end

                                transcription(index, 1) = onset;
                                transcription(index, 2) = offset;
                                transcription(index, 3) = str2double(config.signal.pitch);

                                hasNote = 0;
                            end
                        end
                    end
                end
            end

            transcriptionSorted = sortrows(transcription);
            for k = 1:size(transcriptionSorted, 1)
                fprintf(file_, [num2str(transcriptionSorted(k, 1)), '\t', num2str(transcriptionSorted(k, 2)), '\t', num2str(transcriptionSorted(k, 3)), '\n']);
            end
            fclose('all');
        end
    end
end
