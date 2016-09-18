function table_ = createTable_(~, sizes)
    genes_ = zeros(sizes.columns + 1, sizes.genes_per_node);
    node_ = 0:sizes.columns;

    for i = 1:sizes.inputs
        genes_(1, i) = i;
    end

    index = sizes.inputs + 1;

    for i = 2:sizes.columns + 1
        for j = 1:sizes.genes_per_node
            genes_(i,j) = index;
            index = index + 1;
        end
    end

    table_ = table(node_(:), genes_, 'VariableNames', {'Node', 'Genes'});
end
