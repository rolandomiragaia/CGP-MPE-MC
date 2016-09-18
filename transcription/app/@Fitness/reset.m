function reset(this)
    this.threshold_ = this.config_.signal.threshold;
    this.store_.fitness = 0;
    this.store_.results = zeros();
    this.store_.tp = struct();
    this.store_.tn = struct();
    this.store_.fp = struct();
    this.store_.fn = struct();
    this.store_.tp.total = 0;
    this.store_.tn.total = 0;
    this.store_.fp.total = 0;
    this.store_.fn.total = 0;
    this.config_.datestr = datestr(now, 'HH-MM-ss-dd-mm');
end
