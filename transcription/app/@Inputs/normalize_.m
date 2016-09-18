function result = normalize_(~, inputVector)

    inputVector(inputVector < 0) = 0;

    sumOfValues = max(inputVector);

    if sumOfValues ~= 0
        result = inputVector/sumOfValues;
    else
        result = inputVector;
    end

    if isnan(result) | ~isreal(result) | isinf(result)
        result = inputVector;
    end
end