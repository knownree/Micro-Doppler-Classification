walkingaway= load('walkingaway_person1_features.mat');
walkingtoward = load('walkingtoward_person1_features.mat');
stickaway = load('stickaway_person1_features.mat');
sticktoward = load('sticktoward_person1_features.mat');
stepping = load('stepping_person1_features.mat');
sit = load('sit_person1_features.mat');
figure,plot(walkingaway.dif1,walkingaway.maindop1, 'r*');
hold on
plot(walkingtoward.dif1,walkingtoward.maindop1, 'b*');
plot(stickaway.dif1,stickaway.maindop1, 'g*');
plot(sticktoward.dif1,sticktoward.maindop1, 'y*');
plot(sit.dif1,sit.maindop1, 'm*');
plot(stepping.dif1,stepping.maindop1, 'k*');
legend('walkingaway','walkingtoward','stickaway','sticktoward','sit','stepping');
xlabel('difference between peak point and bot point');
ylabel('mean Doppler shift of the wave');
title('4 slides');

figure,plot(walkingaway.dif2,walkingaway.maindop2, 'r*');
hold on
plot(walkingtoward.dif2,walkingtoward.maindop2, 'b*');
plot(stickaway.dif2,stickaway.maindop2, 'g*');
plot(sticktoward.dif2,sticktoward.maindop2, 'y*');
plot(sit.dif2,sit.maindop2, 'm*');
plot(stepping.dif2,stepping.maindop2, 'k*');
legend('walkingaway','walkingtoward','stickaway','sticktoward','sit','stepping');
xlabel('difference between peak point and bot point');
ylabel('mean Doppler shift of the wave');
title('1 slide');