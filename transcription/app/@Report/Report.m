classdef Report < handle
    %REPORT Summary of this class goes here
    %   Detailed explanation goes here

    properties
        config_
        classes_
        fitness_
        files_
        state_
        store_
        functionSet_
        directory_
        generationDirectory_
        base_configuration_
        print_figures_
    end

    methods

        function this = Report(config, fitness, inputs)
            this.fitness_ = fitness;
            this.store_.inputs = inputs;
            this.store_.configuration = config;

            this.init(config);
            this.createDirectories_();
            this.fitness_.setReportDirectory(this.config_.runs_directory);
        end

    end
end
