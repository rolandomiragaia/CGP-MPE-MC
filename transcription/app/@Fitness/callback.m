function fn = callback(this, method)
    switch method
        case 'NEW_SOLUTION_IN_GENERATION'
            fn = @this.mutateThreshold_;
        case 'FITTEST_SOLUTION_OF_GENERATION'
            fn = @this.setFittestThreshold_;
    end
end
