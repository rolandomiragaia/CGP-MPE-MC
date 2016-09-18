function setupParameters_(this, inputs, genes, genes_per_node, connection_genes, connection_nodes, parameters)
    % setupParameters_ Setup the parameter genes array
    %
    %   Input:
    %       inputs            {integer} number of CGP inputs
    %       genes             {integer} number of genes in the genotype
    %       genes_per_node    {integer} number of genes per node
    %       connection_genes  {integer} number of connection genes per node
    %       connection_nodes  {integer} number of nodes (without inputs and outputs)
    %       parameters        {integer} number of CGP parameters
    %
    %   Examples:
    %       structure.setupParameters_(inputs, genes, genes_per_node, connection_genes, connection_nodes, parameters)

    if parameters < 1
        return
    end

    this.parameters_order = zeros(parameters, parameters * connection_nodes / parameters);
    this.parameters = zeros();

    for j = 1:parameters
        this.parameters = [ ...
            this.parameters, ...
            inputs + connection_genes  + j + 1 : ...
            genes_per_node : ...
            genes ...
        ];

        vector = [ ...
            this.parameters_order(j), ...
            inputs + connection_genes  + j + 1 : ...
            genes_per_node : ...
            genes ...
        ];

        this.parameters_order(j,:) = vector(2:end);
    end

    this.parameters = sort(this.parameters(2:end));
end
