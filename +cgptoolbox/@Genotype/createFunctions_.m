function createFunctions_(this, inputs, genes, genes_per_node, functions)
    % createFunctions_ create function genes for the genotype
    %
    %   Randomly select function genes, for the genotype.
    %
    %   Input:
    %       this {Genotype} instante of the class
    %           genes_ {array} array of genes of the genotype
    %
    %       inputs         {integer} the number of CGP inputs
    %       genes          {integer} the number of genes in the genotype
    %       genes_per_node {integer} the number of genes per node
    %       functions      {integer} the number of functions in the function-set
    %
    %   Examples:
    %       genotype.createFunctions_(4, 100, 6, 10);
    %       genotype.createFunctions_(2, 80, 6, 20);

    functionGenes = inputs + 1:genes_per_node:genes;
    this.genes_(functionGenes) = cgptoolbox.Function(functions, size(functionGenes, 2)).get();
end
