function notFound = solutionNotFound_(this, fitness_solution, fitness_operator)
    % solutionNotFound_ check if a solution is a valid solution or not
    %
    %   If the absolute value of the fittest's fitness solution is less
    %   then the minimum fitness for a valid solution, returns true.
    %   If the fitness is bigger than the threshold `solution_fitness`,
    %   returns false.
    %
    %   Input:
    %       this             {EA} instance of EA class
    %       fittest_         {Genotype} fittest solution
    %       fitness_value    {integer} fitness of the current solution being evalutated
    %       fitness_operator {string} if the operator to be used is bigger then or less then from the solution fitness
    %
    %   Examples:
    %       ea.solutionNotFound_(0.01, '>=');
    %       ea.solutionNotFound_(0.1, '<');
    
    absolute_value = abs(this.fittest_.fitness());
    switch fitness_operator
        case '>='
            notFound = ~(absolute_value >= fitness_solution);
        case '<='
            notFound = ~(absolute_value <= fitness_solution);
        case '>'
            notFound = ~(absolute_value > fitness_solution);
        case '<'
            notFound = ~(absolute_value < fitness_solution);
        otherwise
            notFound = ~(absolute_value >= fitness_solution);
    end
end
