for oo = 1:5
I = imread(['walkingaway_person1_',num2str(oo),'.png']);
Ired = double(I(:,:,1));
Igreen = double(I(:,:,2));
Iblue = double(I(:,:,3)); %show color image%
Igrey = (Ired+Igreen+Iblue)/3;% find the grey scale%
Igrey = uint8(Igrey);
%figure,imshow(Igrey);

%%
I = double(Igrey);% double the size%
[m,n] = size(I);

Ithreshold = zeros(m-99,n-159);
for i = 41:m-59
    for j = 93:n-67
        if I(i,j) < 145     % if the pixel is brighter than 100, white      
            Ithreshold(i-40,j-92) = 0;
        else
            Ithreshold(i-40,j-92) = 255;
        end
    end
end

Ithreshold = uint8(Ithreshold);% change to 8-bit
Ithreshold = Ithreshold(30:515,30:674);
%figure,imshow(Ithreshold)
%title('threshold');



%%
%Ithreshold = double(Ithreshold);
%Ifiltered = zeros(m-105,n-165);
%for i = 4:m-102
%    for j = 4:n-162
%        cc = mean([Ithreshold(i-3,j-3),Ithreshold(i-3,j-2),Ithreshold(i-3,j-1),Ithreshold(i-3,j),Ithreshold(i-3,j+1),Ithreshold(i-3,j+2),Ithreshold(i-3,j+3), Ithreshold(i-2,j-3),Ithreshold(i-2,j-2),Ithreshold(i-2,j-1),Ithreshold(i-2,j),Ithreshold(i-2,j+1),Ithreshold(i-2,j+2),Ithreshold(i-2,j+3),Ithreshold(i-1,j-3),Ithreshold(i-1,j-2),Ithreshold(i-1,j-1),Ithreshold(i-1,j),Ithreshold(i-1,j+1),Ithreshold(i-1,j+2),Ithreshold(i-1,j+3),Ithreshold(i,j-3),Ithreshold(i,j-2),Ithreshold(i,j-1),Ithreshold(i,j),Ithreshold(i,j+1),Ithreshold(i,j+2),Ithreshold(i,j+3)...
%            ,Ithreshold(i+1,j-3),Ithreshold(i+1,j-2),Ithreshold(i+1,j-1),Ithreshold(i+1,j),Ithreshold(i+1,j+1),Ithreshold(i+1,j+2),Ithreshold(i+1,j+3),Ithreshold(i+2,j-3),Ithreshold(i+2,j-2),Ithreshold(i+2,j-1),Ithreshold(i+2,j),Ithreshold(i+2,j+1),Ithreshold(i+2,j+2),Ithreshold(i+2,j+3),Ithreshold(i+3,j-3),Ithreshold(i+3,j-2),Ithreshold(i+3,j-1),Ithreshold(i+3,j),Ithreshold(i+3,j+1),Ithreshold(i+3,j+2),Ithreshold(i+3,j+3)]);
%        if cc <= 130
%            Ifiltered(i-3,j-3) = 0;
%        else
%            Ifiltered(i-3,j-3) = 255;
%        end
%    end
%end
%Ifiltered = Ifiltered(30:515,30:674);
%figure, imshow(Ifiltered);
%title('Filtered');
%%
%Ifiltered1 = zeros(m-109,n-169);
%for i = 3:m-107
%    for j = 3:n-167
%        cc = mean([Ifiltered(i+2,j+2),Ifiltered(i+2,j+1),Ifiltered(i+2,j),Ifiltered(i+2,j-2),Ifiltered(i+2,j-1)...
%            ,Ifiltered(i+1,j+2),Ifiltered(i+1,j+1),Ifiltered(i+1,j),Ifiltered(i+1,j-2),Ifiltered(i+1,j-1),Ifiltered(i,j+2),Ifiltered(i,j+1),Ifiltered(i,j)...
%            Ifiltered(i,j-1),Ifiltered(i,j-2),Ifiltered(i-1,j+2),Ifiltered(i-1,j+1),Ifiltered(i-1,j),Ifiltered(i-1,j-1),Ifiltered(i-1,j-2),Ifiltered(i-2,j+2)...
%            ,Ifiltered(i-2,j+1),Ifiltered(i-2,j),Ifiltered(i-2,j-1),Ifiltered(i-2,j-2)]);
%    if cc < 130
%        Ifiltered1(i-2,j-2) = 0;
%    else
%        Ifiltered1(i-2,j-2) = 255;
%    end
%    end
%end
%Ifiltered1 = Ifiltered1(30:515,30:674);

%figure,imshow(Ifiltered1)
%title('filtered1');


%%
%Ifiltered2 = zeros(m-111,n-171);
%for i = 2:m-110
%    for j = 2:n-170
%        cc = mean([Ifiltered1(i-1,j-1),Ifiltered1(i-1,j),Ifiltered1(i-1,j+1),Ifiltered1(i,j-1),Ifiltered1(i,j),Ifiltered1(i,j+1)...
%            ,Ifiltered1(i+1,j-1),Ifiltered1(i+1,j),Ifiltered1(i+1,j+1)]);
%    if cc < 130
%        Ifiltered2(i-1,j-1) = 0;
%    else
%        Ifiltered2(i-1,j-1) = 255;
%    end
%    end
%end


%Ifiltered2 = Ifiltered2(30:515,30:674);
%figure,imshow(Ifiltered2)
%title('filtered2');

%%
mid = zeros(1,length(Ithreshold));
peak = zeros(1,length(Ithreshold));
bot = zeros(1,length(Ithreshold));
for j = 1:length(Ithreshold)
    count = 0;
    pos = 0;
    bo = 0;
    pe = length(Ithreshold);
    for i = 1:length(Ithreshold(:,1))
        if Ithreshold(i,j) ==255
            count = count+1;
            pos = pos + i;
            if i < pe
                pe = i;
            end
            if i > bo
                bo = i;
            end
        end
    end
    mc = pos/count;
    mid(j) = mc;
    peak(j) = pe;
    bot(j) = bo;
end

    
%%
save(['walkingaway_person1_data_',num2str(oo),'.mat'],'peak','mid','bot');
end
    
            
    

            
            
