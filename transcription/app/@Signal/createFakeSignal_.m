function signal = createFakeSignal_(this, fundamental_frequency, sampling_frequency, samples, type)

    if rand() > 0.5
        % between 60 and fundamental_frequency - 5hz
        frequency = 60 + ((fundamental_frequency - 5) - 60).*rand(1,1);
    else
        % fundamental_frequency + 5hz and fundamental_frequency + 600hz
        frequency = fundamental_frequency + 5 + 600.*rand(1,1);
    end

    signal = this.createSignalByFrequency(frequency, sampling_frequency, samples, type);
    signal = add_awgn(signal, randi([5 15]));
end
