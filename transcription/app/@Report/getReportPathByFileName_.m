function path = getReportPathByFileName_(this, name, extension)
    path = [this.config_.runs_directory, '/', name, '.', extension];
end
