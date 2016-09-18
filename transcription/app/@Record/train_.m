function audio = train_(~, config)
    if strcmp(config.polyphony, 'chords')
        positive = dir(['transcription/dataset/chords/train/positive/', config.pitch, '/*.wav']);
        negative = dir(['transcription/dataset/chords/train/negative/', config.pitch, '/*.wav']);
    else
        positive = dir(['transcription/dataset/single/train/', config.pitch, '/*.wav']);
        negative = dir(['transcription/dataset/single/train/all/*.wav']);
    end


    audio(config.test_cases, config.samples) = zeros();

    for k = 1:config.test_cases/2
        if strcmp(config.polyphony, 'chords')
            signal = audioread(['transcription/dataset/chords/train/positive/', config.pitch, '/', positive(k).name]);
        else
            signal = audioread(['transcription/dataset/single/train/', config.pitch, '/', positive(k).name]);
        end
        signal = signal(:,1) + signal(:,2);
        [a, b] = max(signal);
        audio(k,:) = signal(b : b + config.samples - 1);
        % audio(k,:) = signal(a(1):a(1) + config.samples - 1);
    end

    k = 1;
    for i = (config.test_cases/2) + 1:config.test_cases
        if isempty(strfind(negative(k).name, config.pitch))
            if strcmp(config.polyphony, 'chords')
                signal = audioread(['transcription/dataset/chords/train/negative/', config.pitch, '/', negative(k).name]);
            else
                signal = audioread(['transcription/dataset/single/train/all/', negative(k).name]);
            end
            signal = signal(:,1) + signal(:,2);
            [a, b] = max(signal);
            audio(i,:) = signal(b : b + config.samples - 1);
            % audio(i,:) = signal(a(1):a(1) + config.samples - 1);
        end
        k = k + 1;
    end
end

