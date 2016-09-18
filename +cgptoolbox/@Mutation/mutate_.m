function newValue = mutate_(this, sizes, structure, gene, parameters, shouldBeLastNode)
    % mutate_ mutate one gene
    %
    %   Find the type of gene to be mutated:
    %       output gene
    %       connection gene
    %       parameter gene
    %       function gene
    %
    %   According to the type, mutate the gene value.
    %
    %   Input:
    %       this {Mutation} instante of the class
    %           genes_ {array} array of genes of the genotype
    %       sizes             {struct} sizes related struct constant
    %       structure        {Structure} struct constant with genes split into sections
    %       gene             {integer} gene to be mutated
    %       parameters       {Array} array of parameters of the genotype
    %       shouldBeLastNode {bool}  if the output is the last node
    %
    %   Examples:
    %       mutation.mutate_(sizes, structure, gene, parameters, shouldBeLastNode);

    % mutate output
    if (any(gene == structure.outputs))
        newValue = cgptoolbox.Output(sizes.inputs, sizes.nodes, shouldBeLastNode).get();
        %gene = gene - 1;
        return;
    end

    % mutate connection
    if (any(gene == [structure.connections{1}, structure.connections{2}]))
        newValue = cgptoolbox.Connection(sizes, gene).get();
        return;
    end

    % mutate parameter
    if sizes.parameters > 0 && any(gene == structure.parameters)
        for i = 1:sizes.parameters
            if any(gene == structure.parameters_order(i,:))
                newValue = parameters{i}.mutate(this.genes_(gene));
                return;
            end
        end
    end

    % mutate function
    newValue = cgptoolbox.Function(sizes.functions, 1).get();
end
