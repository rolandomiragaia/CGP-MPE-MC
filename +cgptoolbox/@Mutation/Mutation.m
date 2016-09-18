classdef Mutation
    % Mutation Class
    %   Mutate a genotype
    %
    %   Mutate a number of genes in the genotype, according to the percentage of mutation.
    %   The `genes_` propertie will be updated at each mutation.
    %   After mutation, assign the fitness value and the new active nodes.
    %   If the GENOTYPE_MUTATED callback is passed, fire up the callback
    %   with the new genotype and the mutated genes.
    %
    %   Mutation Properties:
    %       active_  {array} arary of active nodes
    %       genes_   {array} array of genes
    %       fitness_ {Number} fitness value
    %
    %   Mutation Methods:
    %       active  {public} get the active genes
    %       fitness {public} get the fitness value
    %       genes   {public} get the genotype genes
    %
    %       findActiveNodes_          {private} find which nodes are active
    %       getNumberOfGenesToMutate_ {private} create the input genes
    %       getRandomGene_            {private} create the connection genes
    %       mutate_                   {private} create the function genes

    properties (Access = private)
        active_
        genes_
        fitness_
    end

    methods (Access = public)

        function this = Mutation ( ...
            config,               ...
            structure,            ...
            sizes,                 ...
            fittest,                ...
            inputs,               ...
            functions,            ...
            parameters,           ...
            callbacks             ...
        )
            % Mutation Constructor
            %
            %   Input:
            %       config     {struct} struct constant with configuration values
            %       structure  {Structure} struct constant with genes split into sections
            %       sizes       {struct} sizes related struct constant
            %       fittest    {Genotype} fittest genotype of previous generation
            %       inputs     {Array} array of CGP inputs
            %       functions  {Array} array of functions from the function-set
            %       parameters {Array} array of parameters of the genotype
            %       callbacks  {Array} array of callbacks to be executed at each section
            %
            %   Examples:
            %       Genotype(config, sizes, structure, inputs, functions, parameters)

            % store the initial genotype
            this.genes_ = fittest.genes();

            % initialize empty array for mutated genes
            if isfield(callbacks, 'GENOTYPE_MUTATED')
                genesMutated = 1:sizes.genes;
            end

            for i = sizes.inputs + 1:sizes.genes
                if rand() <= sizes.mutation
                    % store the mutated genes
                    if isfield(callbacks, 'GENOTYPE_MUTATED')
                        genesMutated(i) = i;
                    end

                    % mutate
                    this.genes_(i) = this.mutate_(sizes, structure, i, parameters, config.last_node_output);
                end
            end

            % assign the active nodes
            this.active_ = this.findActiveNodes_(sizes, structure.connections);

            if isequal(this.active_, fittest.active())
                this.fitness_ = fittest.fitness_;
            else
                % assign the fitness for this solution
                this.fitness_ = cgptoolbox.Fitness(config, sizes, structure, this.genes_, this.active_, inputs, functions);
            end

            % fire the GENOTYPE_MUTATED callback
            if isfield(callbacks, 'GENOTYPE_MUTATED')
                callbacks.GENOTYPE_MUTATED(genes, this.genes_, genesMutated);
            end
        end
    end
end
