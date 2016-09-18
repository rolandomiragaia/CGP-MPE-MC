function [ rm ] = mutationNormal( r,sd )
%calcula o novo parametro resultante da mutação rm
% apartir do parametro anterior r.
%o novo parametro vai ser uma variavel aleatória normal de media r e desvio
%padrao sd
%   Detailed explanation goes here
rm=0;
while(rm<=0 || rm>=1)
rm=normrnd(r,sd);
end
end

