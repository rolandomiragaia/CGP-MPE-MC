classdef MCC < handle

    properties
        fitness_
    end

    methods

        function this = MCC(truePositives, trueNegatives, falsePositives, falseNegatives)
            numerator = (truePositives * trueNegatives) - (falsePositives * falseNegatives);
            denominator = sqrt( ...
                (truePositives + falsePositives) * ...
                (truePositives + falseNegatives) * ...
                (trueNegatives + falsePositives) * ...
                (trueNegatives + falseNegatives)   ...
            );

            if denominator == 0
                denominator = 1;
            end

            this.fitness_ = numerator / denominator;

            if this.fitness_ < 0
                this.fitness_ = 0;
            end
        end

    end
end
