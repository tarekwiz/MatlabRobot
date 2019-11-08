clear;
% 
handle = EV3();
handle.connect('bt', 'serPort', '/dev/rfcomm1');
% 

minDistance = 40;

error = 10;

distanceSensor = handle.sensor4;
motorRotateSensor = handle.motorC;
motorRight = handle.motorD;
motorLeft = handle.motorA;


while (1)
 	driveAutonomous(distanceSensor , motorRotateSensor, motorRight, motorLeft, minDistance, error );
end

handle.disconnect();




