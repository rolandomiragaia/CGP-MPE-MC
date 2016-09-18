function createParameters_(this, sizes, parameters)
    % createParameters_ create the CGP parameters
    %
    %   If the CGP was configured with parameters,
    %   one must add them to each node of the genotype.
    %   So, each node should have:
    %       function gene
    %       connection genes
    %       parameters genes
    %   One should get the parameter value from the function handle
    %   provided at configuration time.
    %
    %   Input:
    %       this {Genotype} instante of the class
    %           genes_ {array} array of genes of the genotype
    %       sizes {struct} struct with sizes related constants
    %       parameters {array} array of structs with 3 fields each:
    %           'name'       {string} the name of the parameter
    %           'initialize' {Handle} function handle which returns the parameter value
    %           'mutate'     {Handle} function handle to mutate the parameter value
    %
    %   Examples:
    %       genotype.createParameters_(struct(
    %           'inputs', 4,
    %           'genes', 101,
    %           'genes_per_node', 6,
    %           'parameters', 3
    %       ));
    %
    %       genotype.createParameters_(struct(
    %           'inputs', 2,
    %           'genes', 80,
    %           'genes_per_node', 4,
    %           'parameters', 1
    %       ));

    if sizes.parameters > 0
        for i = sizes.inputs + 4:sizes.genes_per_node:sizes.genes
            for indexOfParameter = 1:sizes.parameters
                this.genes_(i + indexOfParameter - 1) = parameters{indexOfParameter}.initialize();
            end
        end
    end
end
