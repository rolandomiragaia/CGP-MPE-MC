function result = SPThreshold(x, y, parameters)
    result = x;
    
    % normalize signal between 0 and 1
    % parameters(6) is a threshold between 0 and 1
    maxOfValues = max(result);
    if maxOfValues ~= 0
        normalizedSignal = x/maxOfValues;
    else
        normalizedSignal = x;
    end
    
    % find all values to be set to zero
    normalizedSignal(normalizedSignal < parameters(1)) = 0;

    % take the original signal, and set all values that should be zero
    result(normalizedSignal == 0) = 0;
end