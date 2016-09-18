function report_ (this, callback, run, generation, fitness, genes, active)
    ['run: ', num2str(run)]

    run_file = fopen([this.runsDirectory_, 'training.txt'], 'a');

    % print generation
    fprintf(run_file, 'run:%d - generation:%d - score:%.16f\n', run, generation, fitness);

    % reset stored fitness properties
    this.fitnessInstance_.reset();
end
