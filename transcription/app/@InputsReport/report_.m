function report_(this)

    if ~exist([this.config_.runs_directory, '/inputs'], 'dir')
        mkdir([this.config_.runs_directory, '/inputs']);
    end

    mkdir(this.config_.input_real_directory);
    mkdir(this.config_.input_imaginary_directory);
    mkdir(this.config_.input_phase_directory);
    mkdir(this.config_.input_absolute_directory);

    for j = 1:size(this.inputs_.real, 1)
        fig = figure('Visible','off');
        plot(this.inputs_.real(j,:));
        print(fig, [this.config_.input_real_directory, '/', num2str(j, '%02d'), '.png'],'-dpng');

        fig = figure('Visible','off');
        plot(this.inputs_.imaginary(j,:));
        print(fig, [this.config_.input_imaginary_directory, '/', num2str(j, '%02d'), '.png'],'-dpng');

        fig = figure('Visible','off');
        plot(this.inputs_.absolute(j,:));
        print(fig, [this.config_.input_absolute_directory, '/', num2str(j, '%02d'), '.png'],'-dpng');

        fig = figure('Visible','off');
        plot(this.inputs_.phase(j,:));
        print(fig, [this.config_.input_phase_directory, '/', num2str(j, '%02d'), '.png'],'-dpng');
    end
end
