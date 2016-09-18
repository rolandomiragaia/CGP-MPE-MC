function mutateThreshold_(this, callback, solution)
    addOrSubtract = rand();

    % if first generation, store the previous generation fittest solution threshold
    if solution == 1
        this.threshold_ = this.thresholdMutated_;
    end

    this.fittestThreshold_ = this.threshold_;

    if addOrSubtract > 0.5
        this.fittestThreshold_ = this.fittestThreshold_ + this.config_.signal.threshold_increment;
    elseif this.fittestThreshold_ > 0
        this.fittestThreshold_ = this.fittestThreshold_ - this.config_.signal.threshold_increment;
    end
end
