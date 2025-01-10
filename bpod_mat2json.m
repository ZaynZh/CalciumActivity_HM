%% Export bpod data as .JSON
animal_path = "/Users/fgs/HMLworkplace/Bpod_data/ZZ0024-L";
animal_path = '/Volumes/Hiroshi Makino/User/KinOn/Data/diversity_training/bpod/ZZ0024';
output_path = "/Users/fgs/HMLworkplace/Arena_analysis/Data/bpod_data";
sess_list = dir(animal_path);
sess_list = sess_list(~ismember({sess_list.name}, {'.', '..','.DS_Store'}));
for j = 1:length(sess_list)
    sess_path = fullfile(animal_path, sess_list(j).name, "Session Data");
    bpod_data_list = dir(sess_path);
    bpod_data_list = bpod_data_list(~ismember({bpod_data_list.name}, {'.', '..','.DS_Store'}));
    for i = 1:length(bpod_data_list)
        bpod_data = load(fullfile(bpod_data_list(i).folder, bpod_data_list(i).name));
        bpod_data = jsonencode(bpod_data);
        output_filename = strrep(bpod_data_list(i).name, 'mat', 'json');
        fid = fopen(fullfile(output_path, output_filename),'w');
        fprintf(fid,'%s',bpod_data);
        fclose(fid);
    end
end