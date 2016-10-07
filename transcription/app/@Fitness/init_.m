function init_(this, config)

    this.config_ = config;

    this.reset();

    if strcmp(this.config_.signal.fitness_function, 'mcc')
        this.fitnessFunction_ = @MCC;
    else
        this.fitnessFunction_ = @FMeasure;
    end

    if isfield(this.config_.signal, 'threshold')
        this.threshold_ = this.config_.signal.threshold;
    else
        this.threshold_ = 0.5;
    end

    this.fittestThreshold_ = this.threshold_;
    this.thresholdMutated_ = this.threshold_;

end
