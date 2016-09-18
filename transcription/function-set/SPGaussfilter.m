function result = SPGaussfilter(firstInput, secondInput, parameters)
    % sigma is a parameter that could evolve between 0 and 10
    % size is a parameter that could evolve
    % firstInput is the vector which the filter is applied
    sigma = round(parameters(1) * 10);
    size = 50;
    x = linspace(-size / 2, size / 2, size);
    gaussFilter = exp(-x .^ 2 / (2 * sigma ^ 2));
    gaussFilter = gaussFilter / sum (gaussFilter); % normalize

    result = filter(gaussFilter,1, firstInput);
end