function createConnections_(this, sizes)
    % createConnections_ create connections for a given node
    %
    %   Randomly select possible node connections, for a given node.
    %
    %   Input:
    %       this {Genotype} instante of the class
    %           genes_ {array} array of genes of the genotype
    %
    %       sizes {struct} structure with sizes related constants
    %           'inputs'           {integer} - the number of CGP inputs
    %           'connection_genes' {integer} - the number of connection genes for each node
    %           'genes_per_node'   {integer} - the number of genes per node
    %           'outputs'          {integer} - the number of CGP outputs
    %
    %   Examples:
    %       genotype.createConnections_(struct(
    %           'inputs', 4,
    %           'connection_genes', 2,
    %           'genes_per_node', 6,
    %           'outputs', 1
    %       ))
    %
    %       genotype.createConnections_(struct(
    %           'inputs', 2,
    %           'connection_genes', 3,
    %           'genes_per_node', 8,
    %           'outputs', 2
    %       ))

    for i = sizes.inputs + 1:sizes.genes_per_node:sizes.genes - sizes.outputs
        for j = 1:sizes.connection_genes
            this.genes_(i + j) = cgptoolbox.Connection(sizes, i).get();
        end
    end
end
