function output = mutateIntervalByNormal_(this, r)
    %calcula o novo parametro resultante da muta??o rm
    % apartir do parametro anterior r.
    %o novo parametro vai ser uma variavel aleat?ria normal de media r e desvio
    %padrao sd
    %   Detailed explanation goes here
    output = 0;
    while(output <= 0 || output >= 1)
        output = normrnd(r, this.config_.signal.interval_standard_deviation);
    end
end
