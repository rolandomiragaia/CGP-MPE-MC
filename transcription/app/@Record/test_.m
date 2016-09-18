function audio = test_(~, config, dir_name, action)

    if strcmp(config.polyphony, 'chords')
        testCases = dir(['transcription/dataset/chords/test/', action, '/', config.pitch, '/*.wav']);
    else
        testCases = dir(['transcription/dataset/single/test/', dir_name, '/*.wav']);

        indexes = [];
        if strcmp(dir_name, 'all')
            for k = 1:size(testCases, 1)
                if ~isempty(strfind(testCases(k).name, config.pitch))
                    indexes = [indexes, k];
                end
            end
        end

        testCases(indexes) = [];
    end

    audio(size(testCases, 1), config.samples) = zeros();

    for k = 1:size(testCases, 1)
        if strcmp(config.polyphony, 'chords')
            signal = audioread(['transcription/dataset/chords/test/', action, '/', config.pitch, '/', testCases(k).name]);
        else
            signal = audioread(['transcription/dataset/single/test/', dir_name, '/', testCases(k).name]);
        end
        signal = signal(:,1) + signal(:,2);
        [a, b] = max(signal);
        audio(k,:) = signal(b : b + config.samples - 1);
    end
end
