function setupOutputs_(this, inputs, genes, genes_per_node, connection_nodes)
    % setupOutputs_ Setup the output genes array
    %
    %   Input:
    %       this    {Structure} instante of the class
    %       inputs            {integer} number of CGP inputs
    %       genes             {integer} number of genes in the genotype
    %       genes_per_node    {integer} number of genes per node
    %       connection_nodes  {integer} number of nodes (without inputs and outputs)
    %
    %   Examples:
    %       structure.setupOutputs_(4)
    %       structure.setupOutputs_(2)

    this.outputs = genes - (genes - (inputs + (genes_per_node * connection_nodes)) - 1):genes;
end
