function audio = music_(~)
    path_ = 'transcription/dataset/music/isol/';
    music = dir([path_, '*.wav']);
    signal = audioread([path_, music(1).name]);
    % 30s = 1323009
    % 10s =
    seconds = 20;
    audio = signal(1:seconds*44100);
end
