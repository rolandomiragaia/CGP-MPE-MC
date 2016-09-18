function validateCGP_(~, configuration)
    % validateCGP_ Validate the CGP configuration
    %
    %   Validate if the CGP was instantiated with one parameter
    %   Validate if the CGP was instantiated with one structure
    %   Validate if the struct has 10 fields
    %   Validate if the struct has a field named 'rows'
    %   Validate if the struct has a field named 'columns'
    %   Validate if the struct has a field named 'levels_back'
    %   Validate if the struct has a field named 'outputs'
    %   Validate if the struct has a field named 'last-node-outputs'
    %   Validate if the struct has a field named 'runs'
    %   Validate if the struct has a field named 'generations'
    %   Validate if the struct has a field named 'offsprings'
    %   Validate if the struct has a field named 'fitness_solution'
    %   Validate if the struct has a field named 'fitness_operator'
    %   Validate if the struct has a field named 'mutation'
    %   Validate if the name field is a string
    %   Validate if the rows field is a positive integer
    %   Validate if the columns field is a positive integer
    %   Validate if the levels_back field is a positive integer
    %   Validate if the outputs field is a positive integer
    %   Validate if the runs field is a positive integer
    %   Validate if the generations field is a positive integer
    %   Validate if the offsprings field is a positive integer
    %   Validate if the fitness_solution field is a positive float
    %   Validate if the fitness_operator is a char
    %   Validate if the mutation field is a positive float
    %
    %   Input:
    %       this   {CGP} instante of the class CGP
    %       inputs {struct} struct with CGP configuration
    %           'rows'             {integer} number of rows
    %           'columns'          {integer} number of columns
    %           'levels_back'      {integer} number of levels back
    %           'outputs'          {integer} number of outputs for the problem
    %           'last_node_output' {bool} if the outputs are the last nodes
    %
    %   Examples:
    %       cgp.validateCGP_(struct(
    %           'rows', 4,
    %           'columns', 10,
    %           'levels_back', 5,
    %           'outputs', 10
    %           'last_node_output', true,
    %           'runs', 5,
    %           'generations', 1000,
    %           'offsprings', 4,
    %           'fitness_value', 0.01,
    %           'fitness_operator', '<=',
    %           'mutation', 0.1
    %       ))
    %
    %       cgp.validateCGP_(struct(
    %           'rows', 1,
    %           'columns', 16,
    %           'levels_back', 16,
    %           'outputs', 1,
    %           'last-node-output', true,
    %           'runs', 5,
    %           'generations', 1000,
    %           'offsprings', 4,
    %           'fitness_solution', 0.01,
    %           'fitness_operator', '>',
    %           'mutation', 0.1
    %       ))



    if length(configuration) ~= 1
        error('CGP:CGP:CGPOnlyTakesOneInputStructure', 'CGP only takes one input structure.');
    end

    if ~isstruct(configuration{1})
        error('CGP:CGP:InputMustBeAStructure', 'Input must be a structure.');
    end

    inputs = configuration{1};

    if length(fieldnames(inputs)) ~= 11
        error( ...
            'CGP:CGP:InvalidSizeOfStructure', ...
            '\nPlease configure your CGP with:\n\n\t%s\n\t%s\n\t%s\n\t%s\n\t%s\n\t%s\n', ...
            'problem name: type string', ...
            'number of rows: type int', ...
            'number of columns: type int', ...
            'number of levels_back: type int', ...
            'number of outputs: type int' ...
            );
    end

    if ~isfield(inputs, 'output_type')
        error( ...
            'CGP:CGP:MissingLastNodeOutputInStructureInput', ...
            '\nPlease provide the node output option.' ...
        );
    end

    if ~isfield(inputs, 'rows')
        error( ...
            'CGP:CGP:MissingRowsInStructureInput', ...
            '\nPlease provide a number of rows.' ...
        );
    end

    if ~isfield(inputs, 'columns')
        error( ...
            'CGP:CGP:MissingColumnsInStructureInput', ...
            '\nPlease provide a number of columns.' ...
        );
    end

    if ~isfield(inputs, 'levels_back')
        error( ...
            'CGP:CGP:MissingLevelsBackInStructureInput', ...
            '\nPlease provide a number of levels back.' ...
        );
    end

    if ~isfield(inputs, 'outputs')
        error( ...
            'CGP:CGP:MissingOutputsInStructureInput', ...
            '\nPlease provide a number of outputs' ...
        );
    end

    % validate rows
    if (~isa(inputs.rows, 'double') && ~isa(inputs.rows, 'integer')) || round(inputs.rows) ~= inputs.rows
        error( ...
            'CGP:CGP:RowsMustBeAnInteger', ...
            '\nRows must be an integer.' ...
        );
    end

    if inputs.rows < 1
        error( ...
            'CGP:CGP:RowsMustBePositive', ...
            '\nRows must be positive.' ...
        );
    end

    % validate columns
    if (~isa(inputs.columns, 'double') && ~isa(inputs.columns, 'integer')) || round(inputs.columns) ~= inputs.columns
        error( ...
            'CGP:CGP:ColumnsMustBeAnInteger', ...
            '\nColumns must be an integer.' ...
        );
    end

    if inputs.columns < 1
        error( ...
            'CGP:CGP:ColumnsMustBePositive', ...
            '\nColumns must be positive.' ...
        );
    end

    % validate levels_back
    if (~isa(inputs.levels_back, 'double') && ~isa(inputs.levels_back, 'integer')) || round(inputs.levels_back) ~= inputs.levels_back
        error( ...
            'CGP:CGP:LevelsBackMustBeAnInteger', ...
            '\nLevels Back must be an integer.' ...
        );
    end

    if inputs.levels_back < 1
        error( ...
            'CGP:CGP:LevelsBackMustBePositive', ...
            '\nLevelsBack must be positive.' ...
        );
    end

        % validate outputs
    if (~isa(inputs.outputs, 'double') && ~isa(inputs.outputs, 'integer')) || round(inputs.outputs) ~= inputs.outputs
        error( ...
            'CGP:CGP:OutputsMustBeAnInteger', ...
            '\nOutputs must be an integer.' ...
        );
    end

    if inputs.outputs < 1
        error( ...
            'CGP:CGP:OutputsMustBePositive', ...
            '\nOutputs must be positive.' ...
        );
    end

    if ~isfield(inputs, 'runs')
        error( ...
            'CGP:Configure:MissingRunsInStructureInput', ...
            '\nPlease provide the number of runs.' ...
        );
    end

    if ~isfield(inputs, 'generations')
        error( ...
            'CGP:Configure:MissingGenerationsInStructureInput', ...
            '\nPlease provide the number of generations.' ...
        );
    end

    if ~isfield(inputs, 'offsprings')
        error( ...
            'CGP:Configure:MissingOffspringsInStructureInput', ...
            '\nPlease provide the offsprings size.' ...
        );
    end

    if ~isfield(inputs, 'mutation')
        error( ...
            'CGP:Configure:MissingMutationInStructureInput', ...
            '\nPlease provide the percentage of mutation for each generation.' ...
        );
    end

    if ~isfield(inputs, 'fitness_solution')
        error( ...
            'CGP:Configure:MissingMinimumFitnessInStructureInput', ...
            '\nPlease provide the threshold for a valid solution.' ...
        );
    end

    if ~isfield(inputs, 'fitness_operator')
        error( ...
            'CGP:Configure:MissingGoalFitnessInStructureInput', ...
            '\nPlease provide the operator to be used for comparison with the fitness solution.' ...
        );
    end

    % validate runs
    if (~isa(inputs.runs, 'double') && ~isa(inputs.runs, 'integer')) || round(inputs.runs) ~= inputs.runs
        error( ...
            'CGP:Configure:RunsMustBeAnInteger', ...
            '\nRuns must be an integer.' ...
        );
    end

    if inputs.runs < 1
        error( ...
            'CGP:Configure:RunsMustBePositive', ...
            '\nPlease provide a positive number of runs.' ...
        );
    end

    % validate generations
    if (~isa(inputs.generations, 'double') && ~isa(inputs.generations, 'integer')) || round(inputs.generations) ~= inputs.generations
        error( ...
            'CGP:Configure:GenerationsMustBeAnInteger', ...
            '\nGenerations must be an integer.' ...
        );
    end

    if inputs.generations < 1
        error( ...
            'CGP:Configure:GenerationsMustBePositive', ...
            '\nPlease provide a positive number of generations.' ...
        );
    end

    % validate offsprings
    if (~isa(inputs.offsprings, 'double') && ~isa(inputs.offsprings, 'integer')) || round(inputs.offsprings) ~= inputs.offsprings
        error( ...
            'CGP:Configure:OffspringsMustBeAnInteger', ...
            '\nOffsprings must be an integer.' ...
        );
    end

    if inputs.offsprings < 1
        error( ...
            'CGP:Configure:OffspringsMustBePositive', ...
            '\nPlease provide a positive number of offsprings.' ...
        );
    end

    % validate mutation
    if ~isnumeric(inputs.mutation)
        error( ...
            'CGP:Configure:MutationMustBeANumber', ...
            '\nMutation must be number.' ...
        );
    end

    if inputs.mutation <= 0
        error( ...
            'CGP:Configure:MutationMustBePositive', ...
            '\nPlease provide a positive number for mutation.' ...
        );
    end

    % validate MinFitness
    if ~isnumeric(inputs.fitness_solution)
        error( ...
            'CGP:Configure:MinFitnessMustBeANumber', ...
            '\nFitness Solution must be number.' ...
        );
    end

    % validate GoalFitness
    if ~ischar(inputs.fitness_operator)
        error( ...
            'CGP:Configure:FitnessOperatorMustBeAChar', ...
            '\nGoal Fitness Operator must be a char.' ...
        );
    end

    if inputs.fitness_solution <= 0
        error( ...
            'CGP:Configure:MinFitnessMustBePositive', ...
            '\nPlease provide a positive fitness value.' ...
        );
    end
end