function outputVector = normalize_(~, inputVector)
    sumOfValues = max(inputVector);
    if sumOfValues ~= 0
        outputVector = inputVector/sumOfValues;
    else
        outputVector = inputVector;
    end
end
