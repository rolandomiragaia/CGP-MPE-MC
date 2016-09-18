classdef Classifier < handle

    properties (Access = private)
        config_;
        cgp_;
        report_;
        fitness_;
        inputs_;
    end

    methods (Access = public)

        function this = Classifier(configuration_file)
            this.init_(configuration_file);
            this.train_();
            % Test(this.CONFIG_, this.fitness_, this.report_);
        end

    end

end