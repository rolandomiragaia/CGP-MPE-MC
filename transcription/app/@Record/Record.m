classdef Record < handle

    properties
        audio_
    end

    methods

        function this = Record (config, action)
            if  strcmp(action, 'train')
                this.audio_ = this.train_(config);
            elseif strcmp(action, 'music')
                this.audio_ = this.music_();
            elseif strcmp(action, 'test-negative')
                this.audio_ = this.test_(config, 'all', 'negative');
            elseif strcmp(action, 'test-positive')
                this.audio_ = this.test_(config, config.pitch, 'positive');
            end
        end

    end

end
