%% Export wavesurfer synchronized miniscope and bpod frames
fs = 20000;

dpath = '/Users/fgs/HMLworkplace/Arena_analysis/Data/ws_data/raw';
dlist = dir(dpath);
dlist = dlist(~ismember({dlist.name}, {'.', '..','.DS_Store'}));

for i = 1:length(dlist)
    recorded_data = ws.loadDataFile(fullfile(dpath,dlist(i).name));
    
    if isfield(recorded_data,'sweep_0001')
        signal_series = recorded_data.sweep_0001.analogScans;
    elseif isfield(recorded_data,'sweep_0002')
        signal_series = recorded_data.sweep_0002.analogScans;
    elseif isfield(recorded_data,'sweep_0003')
        signal_series = recorded_data.sweep_0003.analogScans;
    end
    
    
    ms_signal_seq = signal_series(:,1);
    bpod_signal_seq = signal_series(:,2);
    
    ms_signal_clean = abs(diff(ms_signal_seq));
    test = ms_signal_clean;
    ms_signal_clean(ms_signal_clean <= 1.65) = 0;
    ms_signal_clean(ms_signal_clean > 1.65) = 1;
    

    x = ms_signal_clean;                               % 0 / 1 vector
    idx = find(x);                              % indices of all 1s
    keep = true(size(idx));                     % logical mask

    last = -inf;
    for n = 1:numel(idx)
        if idx(n) - last <= 100                 % within 100 → discard
            keep(n) = false;
        else
            last = idx(n);                      % mark most recent kept 1
        end
    end

    x(idx(~keep)) = 0;
    ms_signal_clean = x;

    ms_frames_samplingstamps = find(ms_signal_clean==1);
    frames_ITI = diff(ms_frames_samplingstamps);
    
    bpod_signal_clean = diff(bpod_signal_seq);
    bpod_signal_clean(bpod_signal_clean <= 2) = 0;
    bpod_signal_clean(bpod_signal_clean > 2) = 1;
    
    bpod_trialstart_samplingstamps = find(bpod_signal_clean == 1);

    output_filename = strrep(dlist(i).name, 'h5', 'mat');
    ms_frames_filename = regexprep(output_filename,'_000(\w+).','_ms.');
    bpod_trialstart_filename = regexprep(output_filename,'_000(\w+).','_bpod.');
    output_path = strrep(dpath, 'raw', 'processed');
    save(fullfile(output_path,ms_frames_filename),'ms_frames_samplingstamps');
    save(fullfile(output_path,bpod_trialstart_filename),'bpod_trialstart_samplingstamps')
end