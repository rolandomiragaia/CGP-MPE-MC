function signal = createSignalByFrequency(~, fundamentalFrequency, samplingFrequency, samples, type)

    time = (0:samples - 1) * (1/samplingFrequency);
    % f = [0:samples-1] * samplingFrequency/samples;
    % plot(f, abs(fft(signal)))

    switch type
        case 'triangular'
            signal = sawtooth(2 * pi * fundamentalFrequency * time); % sin(2*pi*f*t)
        case 'square'
            signal = square(2 * pi * fundamentalFrequency * time); % sin(2*pi*f*t)
        otherwise % sinusoid
            signal = sin(2 * pi * fundamentalFrequency * time); % sin(2*pi*f*t)
    end
end