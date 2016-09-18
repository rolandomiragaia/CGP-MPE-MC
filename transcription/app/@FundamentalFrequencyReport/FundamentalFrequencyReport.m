classdef FundamentalFrequencyReport < handle

    properties
        baseSignal_
        fundamentalFrequency_
        runsDirectory_
    end
    
    methods
        
        function this = FundamentalFrequencyReport(baseSignal, fundamentalFrequency, runsDirectory)
            this.baseSignal_ = baseSignal;
            this.runsDirectory_ = runsDirectory;
            this.fundamentalFrequency_ = fundamentalFrequency;
        end

    end    

end