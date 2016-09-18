function createDirectories_(this)
    if ~exist(this.config_.runs_directory, 'dir')
        mkdir(this.config_.runs_directory);
    end
end
