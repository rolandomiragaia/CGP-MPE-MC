function fitness_ = testCompute(this, sizes, structure, genes, active, inputs, functions)

    % for each test case, calculate fitness_
    [nodesResult, params, store] = this.setupFitnessProperties_(sizes);

    nodesResult = this.decodeNodes_( ...
        sizes, ...
        structure, ...
        genes, ...
        active, ...
        nodesResult, ...
        functions, ...
        inputs, ...
        1, ...
        params ...
    );

    outputNormalized = this.normalize_(nodesResult(end,:));

    if this.binaryFitness_(outputNormalized)
        fitness_ = 1;
    else
        fitness_ = 0;
    end
end
