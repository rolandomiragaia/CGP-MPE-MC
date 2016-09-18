classdef InputsReport

    properties
        config_
        inputs_
    end

    methods

        function this = InputsReport (config, inputs)
            this.config_ = config;
            this.inputs_ = inputs;
        end
    end

end
