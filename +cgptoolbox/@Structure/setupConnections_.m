function setupConnections_(this, inputs, genes, genes_per_node, connection_genes)
    % setupConnections_ Setup the connection genes array
    %
    %   Input:
    %       this              {Structure} instante of the class
    %       inputs            {integer} number of CGP inputs
    %       genes             {integer} number of genes in the genotype
    %       genes_per_node    {integer} number of genes per node
    %       connection_genes  {integer} number of connection genes per node
    %       connection_nodes  {integer} number of nodes (without inputs and outputs)
    %       parameters        {integer} number of CGP parameters
    %
    %   Examples:
    %       structure.setupConnections_(2, 60, 6, 2)
    %       structure.setupConnections_(4, 60, 3, 2)

    this.connections = cell(connection_genes, 1);

    for i = 1:connection_genes
        this.connections{i} = sort([ ...
            this.inputs, ...
            inputs + i + 1 : ...
            genes_per_node : ...
            genes ...
        ]);
    end
end
