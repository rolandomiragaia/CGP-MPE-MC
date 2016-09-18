function genotypeMutated(this, genesBeforeMutation, genesAfterMutation, genesMutated)
    before = genesBeforeMutation(genesMutated);
    after = genesAfterMutation(genesMutated);
    dlmwrite(this.files_.genotypeMutated, [genesMutated(:), before(:), after(:)], '-append');
end
