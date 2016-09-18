function signal_ = signal_(this, configuration, default)

    if isfield(configuration, 'sampling_frequency')
        sampling_frequency = str2double(configuration.sampling_frequency);
    else
        sampling_frequency = str2double(default.sampling_frequency);
    end

    if isfield(configuration, 'pitch')
        fundamental_frequency = this.getFrequencyByPitch_(configuration.pitch);
        pitch = configuration.pitch;
    else
        fundamental_frequency = 261; % c4
        pitch = '60';
    end

    if isfield(configuration, 'threshold')
        threshold = str2double(configuration.threshold);
    else
        threshold = str2double(default.threshold);
    end

    if isfield(configuration, 'threshold_increment')
        threshold_increment = str2double(configuration.threshold_increment);
    else
        threshold_increment = str2double(default.threshold_increment);
    end

    if isfield(configuration, 'interval_standard_deviation')
        interval_standard_deviation = str2double(configuration.interval_standard_deviation);
    else
        interval_standard_deviation = str2double(default.interval_standard_deviation);
    end

    if isfield(configuration, 'constant_standard_deviation')
        constant_standard_deviation = str2double(configuration.constant_standard_deviation);
    else
        constant_standard_deviation = str2double(default.constant_standard_deviation);
    end

    if isfield(configuration, 'type')
        type = configuration.type;
    else
        type = default.type;
    end
    
    if isfield(configuration, 'polyphony')
        polyphony = configuration.polyphony;
    else
        polyphony = default.polyphony;
    end

    if isfield(configuration, 'samples')
        samples = str2double(configuration.samples);
    else
        samples = str2double(default.samples);
    end

    if isfield(configuration, 'triangular_signal')
        triangular_signal = str2num(configuration.triangular_signal);
    else
        triangular_signal = str2double(default.triangular_signal);
    end

    if isfield(configuration, 'triangular_signal_2')
        triangular_signal_2 = str2num(configuration.triangular_signal_2);
    else
        triangular_signal_2 = str2num(default.triangular_signal_2);
    end

    if isfield(configuration, 'second_harmonic')
        second_harmonic = str2double(configuration.second_harmonic);
    else
        second_harmonic = str2double(default.second_harmonic);
    end

    % only used for created simple signals like sine waves, triangular
    % waves and saw waves. In real recordins, this value is assume to be
    % the size of the dataset.
    if isfield(configuration, 'test_cases')
        test_cases = str2num(configuration.test_cases);
    else
        test_cases = str2double(default.test_cases);
    end

    if strcmp(type, 'record')
        test_cases = (size(dir(['transcription/dataset/single/train/all/*.wav']), 1) - 1) * 2;
    end

    if isfield(configuration, 'function_set')
        function_set = configuration.function_set;
    else
        function_set = default.function_set;
    end

    if isfield(configuration, 'fitness_function')
        fitness_function = configuration.fitness_function;
    else
        fitness_function = default.fitness_function;
    end

    if isfield(configuration, 'fft_samples')
        if strcmp(configuration.fft_samples, 'all')
            fft_samples = samples;
        else
            fft_samples = samples/2;
        end
    else
        fft_samples = samples/2;
    end
    
    if isfield(configuration, 'inputs')
        inputs = strsplit(configuration.inputs, ',');
    else
        inputs = strsplit(default.inputs, ',');
    end

    if second_harmonic
        first_base_signal = Signal ( ...
            struct( ...
                'fundamental_frequency', fundamental_frequency, ...
                'sampling_frequency', sampling_frequency, ...
                'samples', samples ...
            ), ...
            'fundamental_frequency' ...
        ).get();

        base_signal_fft = abs(fft(this.hanningWindow_(samples, first_base_signal)));

        first_base_signal = base_signal_fft(1:fft_samples);

        [Y,I] = max(first_base_signal);

        first_base_signal(first_base_signal < Y) = 0;
        first_base_signal(I) = 1;
        first_base_signal_ = first_base_signal;
        first_base_signal = conv( ...
            first_base_signal, ...
            triangular_signal, ...
            'same' ...
        );

        second_base_signal = Signal ( ...
            struct( ...
                'fundamental_frequency', fundamental_frequency * 2, ...
                'sampling_frequency', sampling_frequency, ...
                'samples', samples ...
            ), ...
            'fundamental_frequency' ...
        ).get();

        base_signal_fft = abs(fft(this.hanningWindow_(samples, second_base_signal)));

        second_base_signal = base_signal_fft(1:fft_samples);

        [Y,I] = max(second_base_signal);

        second_base_signal(second_base_signal < Y) = 0;
        second_base_signal(I) = 1;
        second_base_signal_ = second_base_signal;
        
        second_base_signal = conv( ...
            second_base_signal, ...
            triangular_signal_2, ...
            'same' ...
        );
    
        third_base_signal = conv( ...
            first_base_signal_, ...
            triangular_signal_2, ...
            'same' ...
        );
    
        fourth_base_signal = conv( ...
            second_base_signal_, ...
            triangular_signal, ...
            'same' ...
        );

        base_signal = first_base_signal + second_base_signal;
    else
        first_base_signal = 0;
        second_base_signal = 0;
        third_base_signal = 0;
        fourth_base_signal = 0;
        base_signal = Signal ( ...
            struct( ...
                'fundamental_frequency', fundamental_frequency, ...
                'sampling_frequency', sampling_frequency, ...
                'samples', samples ...
            ), ...
            'fundamental_frequency' ...
        ).get();

        base_signal_fft = abs(fft(this.hanningWindow_(samples, base_signal)));

        base_signal = base_signal_fft(1:fft_samples);

        [Y,I] = max(base_signal);

        base_signal(base_signal < Y) = 0;
        base_signal(I) = 1;

        base_signal = this.normalize_(conv( ...
            base_signal, ...
            triangular_signal, ...
            'same' ...
        ));
    
    end

    if ~exist(['transcription/classifiers/', pitch], 'dir')
        mkdir(['transcription/classifiers/', pitch]);
    end

    signal_ = struct( ...
        'sampling_frequency', sampling_frequency, ...
        'samples', samples, ...
        'fft_samples', fft_samples, ...
        'fundamental_frequency', fundamental_frequency, ...
        'interval_standard_deviation', interval_standard_deviation, ...
        'constant_standard_deviation', constant_standard_deviation, ...
        'second_harmonic', second_harmonic, ...
        'pitch', pitch, ...
        'threshold', threshold, ...
        'threshold_increment', threshold_increment, ...
        'type', type, ...
        'triangular_signal', triangular_signal, ...
        'triangular_signal_2', triangular_signal_2, ...
        'base_signal', base_signal, ...
        'function_set', function_set, ...
        'test_cases', test_cases, ...
        'fitness_function', fitness_function, ...
        'first_base_signal', first_base_signal, ...
        'second_base_signal', second_base_signal, ...
        'third_base_signal', third_base_signal, ...
        'fourth_base_signal', fourth_base_signal, ...
        'polyphony', polyphony, ...
        'inputs', struct('type', inputs) ...
    );
end
