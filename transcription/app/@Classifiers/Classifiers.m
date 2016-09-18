classdef Classifiers < handle

    properties (Access = private)
        path_classifiers_ = 'transcription/classifiers/'
        classifiers_
    end

    methods (Access = public)

        function this = Classifiers(varargin)


           for i = 1:size(varargin{1}, 2)
               pitch = varargin{1}(i);
                dir_ = dir(['transcription/classifiers/', num2str(pitch{1}), '/*-*']);
                for j = 1:size(dir_, 1)
                    mat_ = dir(['transcription/classifiers/', num2str(pitch{1}), '/', dir_(j).name, '/*.mat']);
                    for e = 1:size(mat_, 1)
                        classifierObject = load(['transcription/classifiers/', num2str(pitch{1}), '/', dir_(j).name, '/', mat_(e).name]);
                        classifierObject(1).classifier_.pitch = num2str(pitch{1});
                        classifierObject(1).classifier_.run_directory = dir_(j).name;
                        this.classifiers_ = [this.classifiers_, classifierObject];
                    end
                end
           end
        end
    end
end
