function output_ = train(this)
    % train Run the algorithm
    %
    %   Configure a few properties to run the algorithm
    %   Run the evolutionary algorithm
    %
    %   Input:
    %       this {CGP} instante of the class CGP
    %
    %   Examples:
    %   cgp.train()

    this.configureComputedProperties_();

    ea_ = cgptoolbox.EA ( ...
        this.config_, ...
        this.sizes_, ...
        this.structure_, ...
        this.inputs_, ...
        this.functions_, ...
        this.parameters_, ...
        this.callbacks_ ...
    );

    output_ = ea_.output();
end
