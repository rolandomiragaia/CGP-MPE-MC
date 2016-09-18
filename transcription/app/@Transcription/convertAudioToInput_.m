function inputs_ = convertAudioToInput_(this, samples, fft_samples, audio)
    real_ = zeros(1, fft_samples);
    imaginary_ = zeros(1, fft_samples);
    absolute_ = zeros(1, fft_samples);
    phase_ = zeros(1, fft_samples);

    for i = 1:size(audio, 1)
        fft_ = fft(this.hanningWindow_(samples, audio(i, :)));
        real_(i,:) = this.normalize_(real(fft_(1:fft_samples)));
        imaginary_(i,:) = this.normalize_(imag(fft_(1:fft_samples)));
        absolute_(i,:) = this.normalize_(abs(fft_(1:fft_samples)));
        phase_(i,:) = this.normalize_(angle(fft_(1:fft_samples)));
    end

    inputs_ = struct( ...
        'real', real_, ...
        'imaginary', imaginary_, ...
        'absolute', absolute_, ...
        'phase', phase_ ...
    );
end
