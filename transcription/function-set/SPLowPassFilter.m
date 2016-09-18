function result = SPLowPassFilter(x, y, parameters)
    sizeOfSignal = size(x, 2);
    percentage = 1 + (20 - 1)*parameters(1);
    wc = round(percentage * sizeOfSignal / 100);
    %parametro a evoluir que representa o numero de uns a partir do inicio do vetor
    %este parametro pode ser percentagem do comprimento do vetro e vai de 1 at?
    %20%
    %wc frequencia de corte
    %lpf filtro passa baixo
    %x entrada y saida
    lpf = zeros(1, sizeOfSignal);
    lpf(1:wc) = 1;
    result = x.*lpf;
end