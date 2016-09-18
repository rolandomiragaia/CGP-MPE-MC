function outputVector = normalize_(~, inputVector)

    inputVector(inputVector < 0) = 0;
    
    sumOfValues = max(inputVector);

    if sumOfValues ~= 0
        outputVector = inputVector/sumOfValues;
    else
        outputVector = inputVector;
    end
end