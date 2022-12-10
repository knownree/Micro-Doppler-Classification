load('walkingaway_person1_5.mat');

%%
x1 = 1:length(mid);
maindoppler = mean(mid);
figure, plot(x1,peak);
hold on
plot(x1,bot,'r')
plot(x1,mid,'g')

%%
midr = [];
peakr = [];
botr = [];
len = length(mid);
nc = 0;
for i = 11:20:len-10
    nc = nc+1;
    sum = 0;
    sup = 0;
    sub = 0;
    for j = i-10:i+10
        sum = sum+mid(i);
        sup = sup + peak(i);
        sub = sub + bot(i);
    end
    mcm = sum/21;
    mcp = sup/21;
    mcb = sub/21;
    midr(nc) = mcm;
    peakr(nc) = mcp;
    botr(nc)= mcb;
end




%%
x2 = 1:length(midr);
figure, plot(x2,peakr);
hold on
plot(x2,botr,'r')
plot(x2,midr,'g')