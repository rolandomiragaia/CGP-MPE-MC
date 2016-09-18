function active = findActiveNodes_(this, sizes, connections)
    % findActiveNodes_ find the active nodes
    %
    %   To decode a genotype, it must be done from right, to left.
    %   In other words, from the output node, to its connection nodes, and
    %   so on, until we reach the CGP inputs.
    %
    %   Input:
    %       this {Genotype} instante of the class
    %           genes_ {array} array of genes of the genotype
    %       sizes  {struct} struct with sizes related constants
    %       connections {array}  array of connection genes
    %
    %   Examples:
    %       genotype.createParameters_(sizes, connections);

    % instantiate a zero vector with sufficient space
    active = zeros(1, sizes.nodes * 2);

    % add the output nodes as active
    active(1:sizes.outputs) = this.genes_(end - sizes.outputs + 1:end);

    % iterate through all active nodes
    for i = sizes.outputs:sizes.nodes * 2
        % skip input nodes, since they don't have connection nodes
        if active(i) <= sizes.inputs
            continue;
        end

        % if the last nodes to check are all inputs, break the for loop
        % because we already know all the active nodes (including the
        % inputs)
        if all(active(i:end) <=  sizes.inputs)
            break;
        end

        % for the current node being checked:
        %   mark the connection genes as active
        %   each of the connection genes will later be checked for its
        %   connections
        for j = 1:sizes.connection_genes
            active(i + (i * 1) + j - 1) = this.genes_(connections{j}(active(i)));
        end
    end

    % sort the array
    % remove possible duplicates
    % remove zeros
    active = sort(active(active > 0));
    difference  = diff([active,NaN]);
    active = active(difference~=0);
end
