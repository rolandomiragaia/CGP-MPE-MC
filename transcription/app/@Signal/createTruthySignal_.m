function signal = createTruthySignal_(this, fundamental_frequency, sampling_frequency, samples, type)
    % between fundamental_frequency - 1 and fundamental_frequency + 1
    frequency = fundamental_frequency + 1.*rand(1,1);
    signal = this.createSignalByFrequency(frequency, sampling_frequency, samples, type);
    signal = add_awgn(signal, randi([5 15]));
end
