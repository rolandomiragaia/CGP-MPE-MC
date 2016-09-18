classdef Offsprings
    % Offsprings Class
    %   Create initial offsprings of solutions
    %
    %   Initialize one genotype, and assign as the best fit.
    %   Iterate through the offsprings sizes to create new genotypes.
    %   If one genotype has better fitness than the current fittest,
    %   replace the former.
    %
    %   Offsprings Properties:
    %       solutions_  {Array}    array of solutions
    %       fittest_    {Genotype} fittest solution of the offsprings
    %
    %   Offsprings Methods:
    %       solutions {public} get all the solutions in the offsprings
    %       fittest   {public} get the fittest solution of the offsprings

    properties (Access = private)
        solutions_
        fittest_
    end

    methods (Access = public)

        function this = Offsprings( ...
            config,                 ...
            sizes,                   ...
            structure,              ...
            inputs,                 ...
            functions,              ...
            parameters              ...
        )
            % Offsprings Constructor
            %
            %   Generate n solutions according to the offsprings sizes.
            %   Choose the fittest.
            %
            %   Input:
            %       config     {struct} struct constant with configuration values
            %       sizes       {struct} sizes related struct constant
            %       structure  {Structure} struct constant with genes split into sections
            %       inputs     {Array} inputs to the CGP
            %       functions  {Array} array of functions of the function-set
            %       parameters {Array} parameters to the genotype
            %
            %   Examples:
            %       Genotype(config, sizes, structure, inputs, functions, parametes)

            % create one genotype
            this.fittest_ = cgptoolbox.Genotype(config, sizes, structure, inputs, functions, parameters);

            % create the rest of the genotypes
            for i = 1:sizes.offsprings - 1
                this.solutions_{i} = cgptoolbox.Genotype(config, sizes, structure, inputs, functions, parameters);

                absolute_value = this.solutions_{i}.fitness();
                fitness_solution = this.fittest_.fitness();
                switch config.fitness_operator
                    case '>='
                        if absolute_value >= fitness_solution
                            this.fittest_ = this.solutions_{i};
                        end
                    case '<='
                        if absolute_value <= fitness_solution
                            this.fittest_ = this.solutions_{i};
                        end
                    case '>'
                        if absolute_value > fitness_solution
                            this.fittest_ = this.solutions_{i};
                        end
                    case '<'
                        if absolute_value < fitness_solution
                            this.fittest_ = this.solutions_{i};
                        end
                    otherwise
                        if absolute_value >= fitness_solution
                            this.fittest_ = this.solutions_{i};
                        end
                end
            end
        end

    end
end
