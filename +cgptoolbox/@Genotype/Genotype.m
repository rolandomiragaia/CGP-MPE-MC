classdef Genotype < handle
    % Genotype Class
    %   Instatiate a genotype
    %
    %   Create the input genes
    %   Create the function genes
    %   Create the connection genes
    %   Create the parameter genes
    %   Create the output genes
    %   Find which nodes are active and calculate the fitness of this genotype/solution.
    %
    %   Genotype Properties:
    %       active_  {array} arary of active nodes
    %       genes_   {array} array of genes
    %       fitness_ {Number} fitness value
    %
    %   Genotype Methods:
    %       active  {public} get the active genes
    %       fitness {public} get the fitness value
    %       genes   {public} get the genotype genes
    %
    %       createConnections_ {private} create the connection genes
    %       createFunctions_   {private} create the function genes
    %       createInputs_      {private} create the input genes
    %       createOutputs_     {private} create the output genes
    %       findActiveNodes_   {private} find which nodes are active

    properties (Access = private)
        active_
        genes_
    end

    properties (Access = public)
        fitness_
    end

    methods (Access = public)

        function this = Genotype(config, sizes, structure, inputs, functions, parameters)
            % Genotype Constructor
            %
            %   Input:
            %       config     {struct} struct constant with configuration values
            %       sizes       {struct} sizes related struct constant
            %       structure  {Structure} struct constant with genes split into sections
            %       inputs     {Array} array of cgp inputs
            %       functions  {Array} array of functions from the function-set
            %       parameters {Array} array of parameters of the genotype
            %
            %   Examples:
            %       Genotype(config, sizes, structure, inputs, functions, parameters)

            this.genes_ = zeros(1, sizes.genes);

            this.createInputs_(sizes.inputs);
            this.createFunctions_(sizes.inputs, sizes.genes, sizes.genes_per_node, sizes.functions);
            this.createConnections_(sizes);
            this.createParameters_(sizes, parameters);
            this.createOutputs_(sizes.inputs, sizes.genes, sizes.outputs, sizes.nodes, config.last_node_output);

            this.active_ = this.findActiveNodes_(sizes, structure.connections);

            this.fitness_ = cgptoolbox.Fitness(config, sizes, structure, this.genes_, this.active_, inputs, functions);
        end
    end
end
