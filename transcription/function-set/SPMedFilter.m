function result = SPMedFilter(x, y, parameters)
    % parameters(5) parametro a evoluir... que pode ir de 3 at? 10% do tamanho do sinal a filtrar
    % result saida
    % x entrada
    percentage = round(3 + (10 - 3)*parameters(1)) * 0.01;
    windowSize = ceil(size(x, 2) * percentage);
    result = filter(ones(1, windowSize)/windowSize, 1, x);
end