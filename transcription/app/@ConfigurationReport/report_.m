function report_(this, vararg)
    if ~exist(this.configurationDirectory_, 'dir')
        mkdir(this.configurationDirectory_);
    end

    this.files_.signal = [this.configurationDirectory_, '/signal.cfg.csv'];
    this.files_.report = [this.configurationDirectory_, '/report.cfg.csv'];
    this.files_.cgp = [this.configurationDirectory_, '/cgp.cfg.csv'];
    this.files_.sizes = [this.configurationDirectory_, '/size.cfg.csv'];
    this.files_.referenceTable = [this.configurationDirectory_, '/reference-table.csv'];

    writetable(struct2table(this.configuration_.signal), this.files_.signal);
    writetable(struct2table(this.configuration_.report), this.files_.report);
    writetable(struct2table(this.configuration_.cgp), this.files_.cgp);
    writetable(struct2table(vararg.config.sizes), this.files_.sizes);
    writetable(this.createTable_(vararg.config.sizes), this.files_.referenceTable);
end
