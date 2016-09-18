function setupGenerationDirAndFile_(this, fitness)
    if ~exist(this.getRunDir_(), 'dir')
        mkdir(this.getRunDir_());
    end

    if ~exist(this.getGenerationDir_(), 'dir')
        mkdir(this.getGenerationDir_());
    end

    if this.config_.print_figures
        if ~exist([this.getGenerationDir_(), 'figures/'], 'dir')
            mkdir([this.getGenerationDir_(), 'figures/']);
        end
    end

    this.store_.files.generation = fopen([this.getGenerationDir_(), num2str(fitness), '.txt'], 'wt');

    this.store_.files.tp = fopen([this.getGenerationDir_(), '/tp.txt'], 'wt');
    this.store_.files.tn = fopen([this.getGenerationDir_(), '/tn.txt'], 'wt');
    this.store_.files.fp = fopen([this.getGenerationDir_(), '/fp.txt'], 'wt');
    this.store_.files.fn = fopen([this.getGenerationDir_(), '/fn.txt'], 'wt');
end
