classdef CGP < handle
    % CGP Class
    %   Provides access to an API to encode a program under a CGP
    %   algorithm
    %
    %   The CGP constructor takes a struct as argumment
    %   Instantiating a CGP object lets the user configure a few CGP
    %   parameters, add the inputs for the CGP program, add callbacks to be
    %   executed in each section for report, provide a fitness function, add
    %   multiple functions to the function set, add parameters to the
    %   genotype, and execute the algorithm.
    %
    %   Inheritance:
    %       handle class
    %
    %   CGP Properties:
    %       config_     - struct of configuration constants
    %       sizes_       - struct of size related constants
    %       structure_  - struct of constant genes
    %       callbacks_  - struct of callbacks to be executed at each correspondent time
    %       functions_  - array of functions which belong to the function set
    %       inputs_     - array of cgp inputs
    %       parameters_ - array of cgp parameters
    %
    %   CGP Methods:
    %       addCallbacks         - add callbacks to the program
    %       addFitnessFunction   - add function handle to be used as the fitness function
    %       addFunctionsFromPath - add path of the function set
    %       addInputs            - add inputs to the problem
    %       addParameters        - add parameters to the genotype
    %       train                - start the trainning process

    properties (Access = private)
        config_
        sizes_
        structure_
        callbacks_
        functions_
        inputs_
        parameters_
    end

    methods (Access = public)

        function this = CGP(varargin)
            % CGP Constructor
            %
            %   Validate the configuration provided
            %   Initialize the parameters_ to an empty structure
            %   Define values for multiple properties of the constant structs sizes_ and config_
            %
            %   Input:
            %       varargin {struct} struct with 10 fields
            %           'rows'           {integer} number of rows
            %           'columns'        {integer} number of columns
            %           'levels_back'     {integer} number of levels back
            %           'outputs'        {integer} number of outputs for the problem
            %           'last_node_output' {bool}    if the outputs are the
            %           last nodes of the genotype or are nodes randomly
            %           selected
            %           'runs'             {integer} number of runs
            %           'generations'      {integer} number of generations
            %           'offsprings'       {integer} offsprings size
            %           'fitness_solution' {integer} minimum fitness for a valid solution
            %           'fitness_operator' {string} operator to be used for comparision with the solution_fitness
            %           'mutation'         {integer} probability of mutation
            %
            %   Examples:
            %       CGP(struct( ...
            %           'rows', 1,
            %           'columns', 16,
            %           'levels_back', 16,
            %           'outputs', 1,
            %           'last_node_output', true,
            %           'rows', 4,
            %           'columns', 10,
            %           'levels_back', 5,
            %           'outputs', 10
            %           'fitness_solution', 1,
            %           'fitness_operator', '>='
            %       ))

            this.validateCGP_(varargin);

            this.parameters_ = struct.empty;

            this.sizes_.connection_genes = 2;
            this.config_.generation = 1;
            this.config_.iteration = 1;
            this.config_.run = 1;

            params = varargin{1};
            this.sizes_.rows = params.rows;
            this.sizes_.columns = params.columns;
            this.sizes_.levels_back = params.levels_back;
            this.sizes_.outputs = params.outputs;
            this.sizes_.runs = params.runs;
            this.sizes_.generations = params.generations;
            this.sizes_.offsprings = params.offsprings;
            this.sizes_.mutation = params.mutation;
            if strcmp(params.output_type, 'last')
                this.config_.last_node_output = true;
            else
                this.config_.last_node_output = false;
            end
            this.config_.fitness_solution = params.fitness_solution;
            this.config_.fitness_operator = params.fitness_operator;
            this.sizes_.parameters = 0;
        end
    end
end
