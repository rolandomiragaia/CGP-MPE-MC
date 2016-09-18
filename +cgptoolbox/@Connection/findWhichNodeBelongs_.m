function node = findWhichNodeBelongs_(~, sizes, gene)
    % findWhichNodeBelongs_ Find the node which a given gene belongs to
    %
    %   Given a specific gene, find which node belongs to
    %   Since the gene contains the CGP inputs plus the genotype genes,
    %   one must find first the node which belongs to in the genotype, and
    %   add the CGP node inputs.
    %
    %   Input:
    %       ~    {void} skip the Connection class instance
    %       sizes {struct} struct with sizes related constants
    %           'inputs'         { integer} number of CGP inputs
    %           'genes_per_node' { integer} number of genes per node (connection genes + function gene + parameters)
    %       gene {integer} gene which needs to be checked
    %
    %   Examples:
    %       cgp.findWhichNodeBelongs_(struct(
    %           'inputs', 2,
    %           'genes_per_node', 5
    %       ), 10)
    %
    %       cgp.findWhichNodeBelongs_(struct(
    %           'inputs', 4,
    %           'genes_per_node', 3
    %       ), 5)

    node = ceil((gene - sizes.inputs) / sizes.genes_per_node) + sizes.inputs;
end
