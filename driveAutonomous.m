function [ ] = driveAutonomous(distanceSensor , motorRotateSensor, motorRight, motorLeft, minDistance, error )

    try
        freeAngle = getFreeLocation(motorRotateSensor, distanceSensor, minDistance + error, 5);
    catch
        freeAngle = 0;
    end
    freeAngle = freeAngle + error; %account for error

    if(freeAngle > 180)
        rotationDirection = 'left';
        freeAngle = 360 - freeAngle;
    else
        rotationDirection = 'right';
    end

    rotateRobot(motorRight, motorLeft, rotationDirection, 20, freeAngle);

    moveRobot(motorRight, motorLeft, 'forward', 50);

    while(distanceSensor.value > minDistance)
    end

    stopRobot(motorRight, motorLeft); 
end

