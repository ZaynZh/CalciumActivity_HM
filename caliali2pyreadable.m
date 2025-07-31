neuron = load('/Volumes/Hiroshi Makino/User/Zeyuan/Data/caliali_data/30-May_HL0023-LR.mat').neuron;
calcium_traces_test1 = neuron.C(:,1:13897);
calcium_traces_test2 = neuron.C(:,13898:26684);
calcium_traces_test3 = neuron.C(:,26685:36311);
calcium_traces_test4 = neuron.C(:,36312:45519);

spikes_test1 = neuron.S(:,1:13897);
spikes_test2 = neuron.S(:,13898:26684);
spikes_test3 = neuron.S(:,26685:36311);
spikes_test4 = neuron.S(:,36312:45519);

% save calcium trace to local
save('/Users/fgs/HMLworkplace/Arena_analysis/Data/caliali_data/HL0023-LR_20250109_C.mat',"calcium_traces_test1");
save('/Users/fgs/HMLworkplace/Arena_analysis/Data/caliali_data/HL0023-LR_20250110_C.mat',"calcium_traces_test2");
save('/Users/fgs/HMLworkplace/Arena_analysis/Data/caliali_data/HL0023-LR_20250127_C.mat',"calcium_traces_test3");
save('/Users/fgs/HMLworkplace/Arena_analysis/Data/caliali_data/HL0023-LR_20250128_C.mat',"calcium_traces_test4");

% save spike to local
save('/Users/fgs/HMLworkplace/Arena_analysis/Data/caliali_data/HL0023-LR_20250109_S.mat',"spikes_test1");
save('/Users/fgs/HMLworkplace/Arena_analysis/Data/caliali_data/HL0023-LR_20250110_S.mat',"spikes_test2");
save('/Users/fgs/HMLworkplace/Arena_analysis/Data/caliali_data/HL0023-LR_20250127_S.mat',"spikes_test3");
save('/Users/fgs/HMLworkplace/Arena_analysis/Data/caliali_data/HL0023-LR_20250128_S.mat',"spikes_test4");

% save calcium trace to drive
save('/Volumes/Hiroshi Makino/User/Zeyuan/Data/caliali_data/HL0023-LR_20250109_C.mat',"calcium_traces_test1");
save('/Volumes/Hiroshi Makino/User/Zeyuan/Data/caliali_data/HL0023-LR_20250110_C.mat',"calcium_traces_test2");
save('/Volumes/Hiroshi Makino/User/Zeyuan/Data/caliali_data/HL0023-LR_20250127_C.mat',"calcium_traces_test3");
save('/Volumes/Hiroshi Makino/User/Zeyuan/Data/caliali_data/HL0023-LR_20250128_C.mat',"calcium_traces_test4");


% save spike to drive
save('/Volumes/Hiroshi Makino/User/Zeyuan/Data/caliali_data/HL0023-LR_20250109_S.mat',"spikes_test1");
save('/Volumes/Hiroshi Makino/User/Zeyuan/Data/caliali_data/HL0023-LR_20250110_S.mat',"spikes_test2");
save('/Volumes/Hiroshi Makino/User/Zeyuan/Data/caliali_data/HL0023-LR_20250127_S.mat',"spikes_test3");
save('/Volumes/Hiroshi Makino/User/Zeyuan/Data/caliali_data/HL0023-LR_20250128_S.mat',"spikes_test4");


