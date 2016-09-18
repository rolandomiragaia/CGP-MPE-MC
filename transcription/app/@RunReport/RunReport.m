classdef RunReport < handle
    
    properties
        runsDirectory_
        fitnessInstance_
        testFunction_
    end
    
    methods
        function this = RunReport (runsDirectory, fitnessInstance)
            this.runsDirectory_ = runsDirectory;
            this.fitnessInstance_ = fitnessInstance;
        end
    end
    
end