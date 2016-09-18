function inputs = initializeInputs_(~, config, test_cases)
    inputs = zeros(size(config.inputs, 2), test_cases, config.fft_samples);
end
