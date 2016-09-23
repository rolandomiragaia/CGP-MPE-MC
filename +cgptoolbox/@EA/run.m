function run(this)

    while (this.configuration_.config.run <= this.configuration_.config.sizes.runs)

        run_ = cgptoolbox.Run(this.configuration_);
        run_.initOffspring();
        run_.initGenerations();
        this.fittestSolution_ = run_.getFittestSolution();

        if isfield(this.configuration_.callbacks, 'NEW_RUN')
            this.configuration_.callbacks.NEW_RUN(struct( ...
                'name', 'NEW_RUN', ...
                'config', this.configuration_.config, ...
                'programInputs', this.configuration_.programInputs, ...
                'run', this.configuration_.config.run, ...
                'fitness', this.fittestSolution_.getFitness(), ...
                'genes', this.fittestSolution_.getGenes(), ...
                'activeNodes', this.fittestSolution_.getActiveNodes() ...
            ));
        end

        this.updateSolutions_(this.configuration_.functionSet, this.configuration_.config.run)

        this.configuration_.config.run = this.configuration_.config.run + 1;
    end

end