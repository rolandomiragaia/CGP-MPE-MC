function store = train_(this, sizes, structure, genes, active, inputs, functions)

    % for each test case, calculate fitness_
    [nodesResult, params, store] = this.setupFitnessProperties_(sizes);

    fields_ = fieldnames(inputs);
    for k = 1:size(inputs.(fields_{1}), 1)
        nodesResult = this.decodeNodes_( ...
            sizes, ...
            structure, ...
            genes, ...
            active, ...
            nodesResult, ...
            functions, ...
            inputs, ...
            k, ...
            params ...
        );

        outputNormalized = this.normalize_(nodesResult(end,:));

        store.results(k, :) = outputNormalized;

        % if testing a truthy frequency
        if k <= this.config_.signal.test_cases / 2
            if this.binaryFitness_(outputNormalized)
                store.tp.total = store.tp.total + 1;
                store.tp.values(k) = k;
            else
                store.fn.total = store.fn.total + 1;
                store.fn.values(k) = k;
            end
        % if testing a falsy frequency
        else
            if this.binaryFitness_(outputNormalized)
                store.fp.total = store.fp.total + 1;
                store.fp.values(k) = k;
            else
                store.tn.total = store.tn.total + 1;
                store.tn.values(k) = k;
            end
        end
    end
end

