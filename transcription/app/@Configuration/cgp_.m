function cgp_ = cgp_(~, configuration, default)

    if isfield(configuration, 'rows')
        rows = str2double(configuration.rows);
    else
        rows = str2double(default.rows);
    end

    if isfield(configuration, 'columns')
        columns = str2double(configuration.columns);
    else
        columns = str2double(default.columns);
    end

    if isfield(configuration, 'levels_back')
        levels_back = str2double(configuration.levels_back);
    else
        levels_back = str2double(default.levels_back);
    end

    if isfield(configuration, 'runs')
        runs = str2double(configuration.runs);
    else
        runs = str2double(default.runs);
    end

    if isfield(configuration, 'outputs')
        outputs = str2double(configuration.outputs);
    else
        outputs = str2double(default.outputs);
    end

    if isfield(configuration, 'generations')
        generations = str2double(configuration.generations);
    else
        generations = str2double(default.generations);
    end

    if isfield(configuration, 'mutation')
        mutation = str2double(configuration.mutation);
    else
        mutation = str2double(default.mutation);
    end

    if isfield(configuration, 'offspring')
        offspring = str2double(configuration.offspring);
    else
        offspring = str2double(default.offspring);
    end

    if isfield(configuration, 'fitness_solution')
        fitness_solution = str2double(configuration.fitness_solution);
    else
        fitness_solution = str2double(default.fitness_solution);
    end

    if isfield(configuration, 'fitness_operator')
        fitness_operator = char(configuration.fitness_operator);
    else
        fitness_operator = char(default.fitness_operator);
    end

    if isfield(configuration, 'output_type')
        if strcmp(configuration.output_type, 'last')
            output_type = 'last';
        else
            output_type = 'random';
        end
    else
        if strcmp(default.output_type, 'last')
            output_type = 'last';
        else
            output_type = 'random';
        end
    end

    cgp_ = struct( ...
        'rows', rows, ...
        'columns', columns, ...
        'levels_back', levels_back, ...
        'output_type', output_type, ...
        'runs', runs, ...
        'outputs', outputs, ...
        'generations', generations, ...
        'offspring', offspring, ...
        'mutation', mutation, ...
        'fitness_solution', fitness_solution, ...
        'fitness_operator', fitness_operator ...
    );
end
