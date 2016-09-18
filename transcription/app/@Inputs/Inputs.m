classdef Inputs

    properties (Access = private)
        inputs_
    end

    methods (Access = public)

        function this = Inputs (config, action)
            switch config.type
                case 'record'
                    audio = Record(config, action).get();
                case 'signal'
                    audio = Signal(config, action).get();
                otherwise
                    audio = action;
            end

            inputs = this.initializeInputs_(config, size(audio, 1));

            this.inputs_ = struct();

            for i = 1:size(audio, 1)
                sig_ = this.hanningWindow_(config.samples, audio(i, :));
                fft_ = fft(sig_);
                for j=1:size(config.inputs, 2)
                    func_ = str2func(config.inputs(j).type);
                    if strfind(config.inputs(j).type, 'ceps')
                        inputs(j, i, :) = this.normalize_(func_(sig_(1:config.fft_samples)));
                    else
                        inputs(j, i, :) = this.normalize_(func_(fft_(1:config.fft_samples)));
                    end
                end
                %real_(i,:) = this.normalize_(real(fft_(1:config.fft_samples)));
                %imaginary_(i,:) = this.normalize_(imag(fft_(1:config.fft_samples)));
                %cceps_(i,:) = this.normalize_(cceps(sig_(1:config.fft_samples)));
                %rceps_(i,:) = this.normalize_(rceps(sig_(1:config.fft_samples)));
                %absolute_(i,:) = this.normalize_(abs(fft_(1:config.fft_samples)));
                %phase_(i,:) = this.normalize_(angle(fft_(1:config.fft_samples)));
            end

            for j=1:size(config.inputs, 2)
                this.inputs_.(config.inputs(j).type) = squeeze(inputs(j, :, :));
            end
        end
    end

end
