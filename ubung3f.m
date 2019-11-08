clear;
% 
handle = EV3();
handle.connect('bt', 'serPort', '/dev/rfcomm1');
% 

rotations = 360*5;

s1 = handle.sensor4;
m3 = handle.motorC;
m3.power= 3;

m3.resetTachoCount();
m3.limitValue = rotations;



%vectors to save data
distance = zeros(rotations, 1);
m3.stop();
m3.start();

while(m3.tachoCount < rotations)
   distance(m3.tachoCount) =  s1.value;
end

m3.stop();
m3.power= -m3.power;
m3.start();
m3.waitFor();

distance(distance==0) = [];

numberOfAngles = 360;
result = interp1( linspace(0,1,numel(distance)), distance, linspace(0,1,numberOfAngles) );


theta = 1:1:360;

figure(1),clf(1)
polarplot(deg2rad(theta),result)

handle.disconnect();




