classdef GenerationReport < handle

    properties
        config_
        state_
        store_
    end

    methods
        function this = GenerationReport(config, fitnessInstance)
            this.config_ = config;

            this.state_.run = 0;
            this.state_.generation = 0;

            this.store_.fitnessInstance = fitnessInstance;
            this.store_.files = struct();

            this.store_.testCases.positive = dir(['transcription/dataset/single/train/', config.pitch, '/*.wav']);
            this.store_.testCases.negative = dir('transcription/dataset/single/train/all/*.wav');

            indexes = [];
            for i = 1:size(this.store_.testCases.negative, 1)
                if ~isempty(strfind(this.store_.testCases.negative(i).name, config.pitch))
                    indexes = [indexes, i];
                end
            end

            this.store_.testCases.negative(indexes) = [];
        end
    end
end
