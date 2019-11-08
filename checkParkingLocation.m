function [ location, distance ] = checkParkingLocation( distanceSensor, rotatingMotor, distanceToObstacle )

rotateSensor(rotatingMotor, 90, 'right', 100);

pause(0.5);

if(distanceSensor.value < distanceToObstacle)
    location = 'right';
else
    location = 'left';
end

distance = getRoundedDistance(distanceSensor);

rotateSensor(rotatingMotor, 90, 'left', 100);

end

