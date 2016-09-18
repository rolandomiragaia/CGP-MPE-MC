classdef FMeasure < handle

    properties
        fitness_
    end

    methods

        function this = FMeasure(truePositives, trueNegatives, falsePositives, falseNegatives)
            precision_ = this.precision_(truePositives, falsePositives);
            recall_ = this.recall_(truePositives, falseNegatives);

            if precision_ == 0 && recall_ == 0
                this.fitness_ = 0;
            else
                this.fitness_ = 2 * ((precision_ * recall_) / (precision_ + recall_));
            end
        end

    end
end
