classdef Configuration

    properties
        config_
    end

    methods
        function this = Configuration(configurationFile)

            configuration_ = this.getCustomConfiguration_(configurationFile);
            default_ = this.getCustomConfiguration_();

            if ~isfield(configuration_, 'signal')
                configuration_.signal = struct();
            end

            if ~isfield(configuration_, 'cgp')
                configuration_.cgp = struct();
            end

            if ~isfield(configuration_, 'report')
                configuration_.report = struct();
            end

            this.config_.signal = this.signal_(configuration_.signal, default_.signal);
            this.config_.cgp = this.cgp_(configuration_.cgp, default_.cgp);
            this.config_.report = this.report_(configuration_.report, default_.report);
        end
    end
end
