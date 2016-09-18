classdef ConfigurationReport
    
    properties
        files_
        configurationDirectory_
        configuration_
    end
    
    methods
        function this = ConfigurationReport(configurationDirectory_, configuration)
            this.configurationDirectory_ = configurationDirectory_;
            this.configuration_ = configuration;
        end
    end
    
end

