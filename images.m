figure
plot(abs(retVal(1,1:numADCSamples)),'r-')
hold on
plot(abs(retVal(2,1:numADCSamples)),'b-')
plot(abs(retVal(3,1:numADCSamples)),'k-')
plot(abs(retVal(4,1:numADCSamples)),'m-')
figure
plot(abs(retVal_summed(1,1:5*numADCSamples)),'r-')
figure
imagesc(10*log10(abs(Y_summed)))
figure
imagesc(10*log10(abs(Y_ch1)))
figure
imagesc(10*log10(abs(Micro_Dop_data)));