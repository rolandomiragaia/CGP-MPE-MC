 function createInputs_(this, inputs)
    % createInputs_ create the CGP input genes in the genotype
    %
    %   The first genes, are the input CGP genes. If we have 4 inputs
    %   the genotype will look like this:
    %       1, 2, 3, 4...
    %   In the decoding process, the gene number 1, will refer to the first
    %   input provided in the CGP, the gene number 2, will refer to the
    %   second one, etc.
    %   After those, the node genes are appended, so the next gene,
    %   will be a function gene.
    %
    %   Input:
    %       this {Genotype} instante of the class
    %           genes_ {array} array of genes of the genotype
    %       inputs {integer} the number of CGP inputs
    %
    %   Examples:
    %       genotype.createInputs_(4);
    %       genotype.createInputs_(2);

    this.genes_ = 1:inputs;
end
