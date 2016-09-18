function createOutputs_(this, inputs, genes, outputs, nodes, shouldBeLastNode)
    % createOutputs_ create the CGP output genes in the genotype
    %
    %   After constructing all the connections, inputs, functions, and parameters,
    %   the final genes are reserved to the CGP output genes.
    %   The number of outputs could varie according to the needs
    %   and should be passed in the configuration process of the CGP.
    %
    %   Input:
    %       this {Genotype} instante of the class
    %           genes_ {array} array of genes of the genotype
    %       inputs  {integer} the number of CGP inputs
    %       genes   {integer} the number of all genes in the genotype
    %       outputs {integer} the number of CGP outputs
    %       nodes   {integer} the number of nodes in the genotype
    %
    %   Examples:
    %       genotype.createInputs_(4);
    %       genotype.createInputs_(2);

    for i = genes - outputs + 1:genes
        this.genes_(i) = cgptoolbox.Output(inputs, nodes, shouldBeLastNode).get();
    end
end
