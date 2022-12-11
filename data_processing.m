% This script opens TI radar data
clear all

numADCSamples = 256; % number of ADC samples per chirp
numADCBits = 16; % number of ADC bits per sample
numRX = 4; % number of receivers

%%
for i = 1:5
 files{i} = fullfile(sprintf('sit_person1_%d.bin', i));
end

for u = 1:5
    
[retVal] = readDCA1000(files{u});

%%


%% Sum the channel

retVal_summed = sum(retVal);

retVal_ch1 = retVal(1,:);


retVal_summed_2D = reshape(retVal_summed,256,40000);
retVal_ch1_2D = reshape(retVal_ch1,256,40000);



%% FFT analysis - To go from Frequency to Range

% Fs = 44100;         % Sampling frequency
% T = 1/Fs;           % Sampling period
% t = -0.5:T:0.5;     % Time vector
% L = length(t);      % Signal length

Y_summed = fft(retVal_summed_2D);
Y_ch1 = fft(retVal_ch1_2D);




%%

Y_summed_cut  = Y_summed(25:100,7000:20000);
Y_summed_cut_sum = sum(Y_summed_cut);

MD_window = 256;
MD_overlap = floor(MD_window/2);

[Micro_Dop_data] = fftshift(spectrogram(Y_summed_cut_sum,MD_window,MD_overlap),1);
h = [1 -2 1];
Micro_Dop_data_filtered = filter(h,1,Micro_Dop_data,[],2);


save(['E:\3rdYearProject\radardata\sit_person1_',num2str(u),'.mat'],'Micro_Dop_data_filtered');


 figure
 imagesc(10*log10(abs(Micro_Dop_data_filtered)),([50 60]));
 xlabel('time/ 32.5ms');
 title('Doppler time');




%%

end
%%
saveas(1,'E:\3rdYearProject\radardata\sit_person1_1.png');
saveas(2,'E:\3rdYearProject\radardata\sit_person1_2.png');
saveas(3,'E:\3rdYearProject\radardata\sit_person1_3.png');
saveas(4,'E:\3rdYearProject\radardata\sit_person1_4.png');
saveas(5,'E:\3rdYearProject\radardata\sit_person1_5.png');






