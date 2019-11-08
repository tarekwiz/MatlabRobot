clear;
% 
handle = EV3();
handle.connect('bt', 'serPort', '/dev/rfcomm1');
% 
m1 = handle.motorA;
m2 = handle.motorD;
s1 = handle.sensor4;

m1.power = -80;
m1.brakeMode = 'Coast';

m1.syncedStart(m2, 'turnRatio', 0);

%Wait for distance to be less than 40cm + 7cm(construction)

while(s1.value > 40 )
end

m1.syncedStop();

display(s1.value);

handle.disconnect();




