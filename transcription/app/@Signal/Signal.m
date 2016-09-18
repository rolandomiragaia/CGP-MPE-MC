classdef Signal < handle

    properties
        audio_
    end

    methods
        function this = Signal(config, action)
            switch action
                case 'train'
                    this.audio_ = this.train_(config);
                case 'test'
                    this.audio_ = this.test_(config);
                otherwise
                    this.audio_ = this.createSignalByFrequency( ...
                        config.fundamental_frequency, ...
                        config.sampling_frequency, ...
                        config.samples, ...
                        'sinusoid' ...
                    );
            end
        end
    end

end

