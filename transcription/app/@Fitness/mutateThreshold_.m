function mutateThreshold_(this, vararg)
    addOrSubtract = rand();

    % if first generation, store the previous generation fittest solution threshold
    if vararg.generation == 1
        this.threshold_ = this.thresholdMutated_;
    end

    this.fittestThreshold_ = this.threshold_;
    newThreshold=0;
%muta??o de treshold com distribui??o normal
%sd desvio padrao
sd=0.5;
%nao entra no while
while(newThreshold<=0 || newThreshold>=3)
newThreshold=normrnd(this.fittestThreshold_,sd);

end
this.fittestThreshold_=newThreshold;
%fprintf('TH - %f \n',this.fittestThreshold_);
%disp(newThreshold);
%if addOrSubtract > 0.5
    %    this.fittestThreshold_ = this.fittestThreshold_ + this.CONFIG_.signal.threshold_increment;
    %elseif this.fittestThreshold_ > 0
    %    this.fittestThreshold_ = this.fittestThreshold_ - this.CONFIG_.signal.threshold_increment;
    %end
end
