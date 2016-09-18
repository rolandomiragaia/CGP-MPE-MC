function setupFunctions_(this, genes, genes_per_node, inputs)
    % setupFunctions_ Setup the function genes array
    %
    %   Input:
    %       this           {Structure} instante of the class
    %       genes          {integer} number of genes in the genotype
    %       genes_per_node {integer} number of genes per node
    %       inputs         {integer} number of CGP parameters
    %
    %   Examples:
    %       structure.setupFunctions_(60, 3, 2)
    %       structure.setupFunctions_(40, 6, 2)

    this.functions = [ ...
        this.inputs, inputs + 1:genes_per_node:genes - 1 ...
    ];
end
