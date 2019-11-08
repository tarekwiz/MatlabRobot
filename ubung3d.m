clear;
power= [80 70 60 50 40 30 20];
sensor= [7.4 7 6.4 5.8 5.3 4.3 3.9];

pfit = polyfit(power, sensor, 2);

figure;
plot(power,sensor);
hold on;
plot(power, polyval(pfit, power));

meanOfSensor = mean(sensor);


% 
handle = EV3();
handle.connect('bt', 'serPort', '/dev/rfcomm1');
% 
m1 = handle.motorA;
m2 = handle.motorD;
s1 = handle.sensor4;

m1.power = -85;
m1.brakeMode = 'Coast';

m1.syncedStart(m2, 'turnRatio', 0);

%Wait for distance to be less than 40cm + 7cm(construction)

while(s1.value > 40 + polyval(pfit, m1.power * -1))
end

m1.syncedStop();

display(s1.value);

handle.disconnect();




