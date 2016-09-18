function output = binaryFitness_(this, inputVector)
    if this.config_.signal.base_signal*(inputVector') > this.threshold_
        output = 1;
     else
        output = 0;
    end
end
