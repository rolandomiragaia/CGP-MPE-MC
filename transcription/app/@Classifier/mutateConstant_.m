function rm = mutateConstant_(this, r)
    %Fun??o que faz a muta??o do parametro r que est? contido num intervalo de
    %normalizado de [0;1]
    %gera novo parametro mutado rm contido no mesmo intervalo
    %i pode ser configuravel e representa o intervalo em torno de r para se
    %gerar novo parametro rm ----- i<0.5

    i = this.config_.signal.constant_mutation_range;

    %protec??o contra os extremos dos intervalos
    if r - i < -10
        mini = -10;
    else
        mini = r - i;
    end

    if r + i > 10
        maxi = 10;
    else
        maxi = r + i;
    end

    rm = mini + (maxi - mini)*rand(1);
end
