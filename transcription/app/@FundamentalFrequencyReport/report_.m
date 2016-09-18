function report_(this)

    if ~exist([this.runsDirectory_, '/inputs'], 'dir')
        mkdir([this.runsDirectory_, '/inputs']);
    end

    fig = figure('Visible','off');
    plot(this.baseSignal_);
    print(fig, [this.runsDirectory_, '/inputs/f0-', num2str(this.fundamentalFrequency_), 'hz.png'],'-dpng');
end