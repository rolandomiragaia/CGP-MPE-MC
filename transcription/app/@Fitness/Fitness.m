classdef Fitness < handle

    properties (Access = private)
        config_
        threshold_
        fitnessFunction_
        fittestThreshold_
        thresholdMutated_
        store_
    end

    methods (Access = public)

        function this = Fitness(config)
            this.init_(config);
        end

    end
end
