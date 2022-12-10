clear all

i = 1;
dir = 'E:\3rdYearProject\radardata\';
load(strcat(dir,'stepping_person1_',num2str(i),'.mat'));


%%
figure
imagesc(20*log10(abs(Micro_Dop_data_filtered)))

%% cutting data
[Dopbins,timebins] =size(Micro_Dop_data_filtered);

number_of_slices = 4;
timebins_slices = timebins/number_of_slices;

for cut= 1:number_of_slices
    index_start = (cut-1)*timebins_slices+1;
    index_stop  = cut*timebins_slices;
    x(:,:,cut) = Micro_Dop_data_filtered(:,index_start:index_stop);
end



%% Extract Features

feature_table = [];

for j = 1:number_of_slices
    current_slice = x(:,:,j);
feature_table(j,1) = mean(abs(current_slice(:)))
feature_table(j,2) = var(abs(current_slice(:)))
feature_table(j,3) = max(abs(current_slice(:)))
end

%%

figure
plot(feature_table(:,1),feature_table(:,2),'r*')

