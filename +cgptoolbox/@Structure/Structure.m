classdef Structure < handle
    % Structure Class
    %   Class with array of genes structured by type
    %
    %   This class should provide an helper for the CGP program.
    %   Each propertie is identified by the type of genes that it stores.
    %   The genotype is an array of genes, but there are no distinction
    %   between the function genes, or connection genes, etc. This
    %   properties should provided a basic mapping between the gene index
    %   and the propertie that it represents.
    %
    %   Structure Properties:
    %       connections      {array} array of connection genes
    %       parameters       {array} array of parameter genes
    %       parameters_order {array} array of parameters groupped by order
    %       inputs           {array} array of input genes
    %       outputs          {array} array of output genes
    %       functions        {array} array of function genes
    %
    %   Structure Methods:
    %       setupConnections_ {private} create the connection genes array
    %       setupFunctions_   {private} create the function genes array
    %       setupInputs_      {private} create the input genes array
    %       setupOutputs_     {private} create the output genes array
    %       setupParameters_  {private} create the parameter genes array

    properties (Access = public)
        connections
        parameters
        parameters_order
        inputs
        outputs
        functions
    end

    methods (Access = public)

        function this = Structure( ...
            inputs,                ...
            genes,                 ...
            genes_per_node,        ...
            connection_genes,      ...
            connection_nodes,      ...
            parameters             ...
        )
            % Structure Constructor
            %
            %   Create multiples genes arrays according to each type of gene.
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
            %       Genotype(inputs, genes, genes_per_node, connection_genes, connection_nodes, parameters)

            this.setupInputs_(inputs);
            this.setupConnections_(inputs, genes, genes_per_node, connection_genes);
            this.setupParameters_(inputs, genes, genes_per_node, connection_genes, connection_nodes, parameters);
            this.setupFunctions_(genes, genes_per_node, inputs);
            this.setupOutputs_(inputs, genes, genes_per_node, connection_nodes);
        end

    end
end
