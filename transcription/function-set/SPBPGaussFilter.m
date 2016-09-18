function result = SPBPGaussFilter(x, y, parameters)
    %aplica um filtro de gauss passa banda a um vetor de entrada xin
    %sigma ? um parametro relacionado com a largura da gaussiana
    %- n?o evoluir por agora colocar a 5
    %fc ? a frequ?ncia onde centrar o filtro neste caso desde 0 ao tamanho do
    %vetor de entrada--- este sim deve evoluir
    %sinal filtrado
    %Aten??o----- Estou a supor que os vetores do nosso trabalho s?o linha
    sigma = 5;
    frequency = size(x, 2) * parameters(1);
    gauss = 0:(length(x) - 1);
    BPgaussFilter = gaussmf(gauss, [sigma frequency]);
    result = BPgaussFilter.*x;
end