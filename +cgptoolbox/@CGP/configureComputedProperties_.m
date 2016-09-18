function configureComputedProperties_(this)
    % configureComputedProperties Configure sizes_ and structure_ properties
    %
    %   Configure multiple sizes_ related properties
    %   Instantiates a Structure object
    %   Fire the CONFIGURATION callback
    %
    %   Input:
    %       this {CGP} instante of the class CGP
    %
    %   Examples:
    %       cgp.configureComputedProperties_()

    this.sizes_.connection_nodes = this.sizes_.rows * this.sizes_.columns;

    % configure nodes and genes
    this.sizes_.genes_per_node = this.sizes_.connection_genes + this.sizes_.parameters + 1;
    this.sizes_.genes = this.sizes_.connection_nodes * this.sizes_.genes_per_node + this.sizes_.inputs + this.sizes_.outputs;
    this.sizes_.nodes = this.sizes_.connection_nodes + this.sizes_.inputs;

    % configure genotype
    this.structure_ = cgptoolbox.Structure( ...
        this.sizes_.inputs, ...
        this.sizes_.genes, ...
        this.sizes_.genes_per_node, ...
        this.sizes_.connection_genes, ...
        this.sizes_.connection_nodes, ...
        this.sizes_.parameters ...
    );

    if isfield(this.callbacks_, 'CONFIGURATION')
        this.callbacks_.CONFIGURATION(this.config_, this.sizes_);
    end
end
