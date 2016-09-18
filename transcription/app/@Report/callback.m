function fn = callback(this, method)
    switch method
        case 'FUNDAMENTAL_FREQUENCY'
            this.initFundamentalFrequencyClass_();
            fn = this.classes_.fundamental_frequency.handler();
        case 'INPUTS'
            this.initInputsClass_();
            fn = this.classes_.inputs.handler();
        case 'CONFIGURATION'
            this.initConfigurationClass_();
            fn = this.classes_.configuration.handler();
        case 'NEW_RUN'
            this.initRunClass_();
            fn = this.classes_.run.handler();
        case 'FIGURES'
            this.config_.print_figures = 1;
            fn = @()(2 + 2);
        case 'NEW_GENERATION'
            this.initGenerationClass_();
            fn = this.classes_.generation.handler();
        case 'NEW_SOLUTION_IN_GENERATION'
            fn = this.fitness_.callback('NEW_SOLUTION_IN_GENERATION');
        case 'FITTEST_SOLUTION_OF_GENERATION'
            fn = this.fitness_.callback('FITTEST_SOLUTION_OF_GENERATION');
        case 'FITTEST_SOLUTION'
            this.initGenerationClass_();
            fn = this.classes_.generation.handler();
        case 'GENOTYPE'
            fn = @this.genotype;
        case 'GENOTYPE_MUTATED'
            fn = @this.genotypeMutated;
    end
end
