function report_ (this, vararg)
    ['run: ', num2str(vararg.run)]

    run_file = fopen([this.runsDirectory_, 'training.txt'], 'a');

    % print generation
    fprintf(run_file, 'run:%d - score:%.16f - generation %.16f\n', vararg.run, vararg.fitness, vararg.generation);

    % reset stored fitness properties
    this.fitnessInstance_.reset();
end
