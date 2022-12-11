maindop1 = [];
dif1 = [];
maindop2 = [];
dif2 = [];
for zz = 1:5
load(['stepping_person1_data_',num2str(zz),'.mat']);

for ii = 1:length(mid)
    if isnan(mid(ii)) == 1
        mid(ii) = 0;
    end
    if isnan(peak(ii)) == 1
        peak(ii) = 0;
    end
    if isnan(bot(ii)) == 1
        bot(ii) = 0;
    end
end
%%
x1 = 1:length(mid);
maindoppler = sum(mid);
maindop2(zz) = maindoppler;
dif = peak-bot;
difference = sum(dif);
dif2(zz) = difference;
num_slides = 4;

for i = 1:num_slides
    sca = (i-1)*length(mid)/num_slides+1;
    scb = i*length(mid)/num_slides;
    le = length(maindop1)+1;
    maindop1(le) = 0;
    dif1(le) = 0;
    maindop1(end) = sum(mid(sca:scb));
    dif1(end) = sum(peak(sca:scb)-bot(sca:scb));
end  
%figure, plot(x1,peak);
%hold on
%plot(x1,bot,'r')
%plot(x1,mid,'g')
end
save('stepping_person1_features.mat','maindop1','dif1','maindop2','dif2');

%%
%midr = [];
%peakr = [];
%botr = [];
%len = length(mid);
%nc = 0;
%for i = 11:20:len-10
%    nc = nc+1;
%    summ = 0;
%    sup = 0;
%    sub = 0;
%    for j = i-10:i+10
%        summ = summ+mid(i);
%        sup = sup + peak(i);
%        sub = sub + bot(i);
%    end
%    mcm = summ/21;
%    mcp = sup/21;
%    mcb = sub/21;
%    midr(nc) = mcm;
%    peakr(nc) = mcp;
%    botr(nc)= mcb;
%end




%%
%x2 = 1:length(midr);
%figure, plot(x2,peakr);
%hold on
%plot(x2,botr,'r')
%plot(x2,midr,'g')