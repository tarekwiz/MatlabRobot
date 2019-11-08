function [ ] = parkRobot(handle, distanceSensor , motorRotateSensor, motorRight, motorLeft)

    [ parkingLocation, distanceToObstacles] = checkParkingLocation( distanceSensor, motorRotateSensor, 20 );
    
    rotateSensor(motorRotateSensor, 90, parkingLocation, 100);
    
    moveRobot(motorRight, motorLeft, 'forward', 20);

    while(getRoundedDistance(distanceSensor) == distanceToObstacles) %wait till robot is away from first obstacle;
    end
    
    while(getRoundedDistance(distanceSensor) > distanceToObstacles ) %wait till robot passes the free space
    end
        
    stopRobot(motorRight, motorLeft); 
    
    rotateSensor(motorRotateSensor, 90, parkingLocation, 100); %look backwards
    
    moveRobot(motorRight, motorLeft, 'backward', 20); %start driving backwards a little
    handle.beep();
    
    pause(1);
    stopRobot(motorRight, motorLeft); %stop.
    
    rotateRobot(motorRight, motorLeft, parkingLocation, -50, 65); %rotate a bit towards the driving lot
    
    moveRobot(motorRight, motorLeft, 'backward', 20); %start driving backwards
    
    while(distanceSensor.value > 10 ) %wait till robot is 10cm away from wall
        handle.beep();
        pause(0.1);
    end
      
    stopRobot(motorRight, motorLeft); 
    
    rotateRobot(motorRight, motorLeft, parkingLocation, 50, 65); %rotate a bit towards the driving lot
    
    moveRobot(motorRight, motorLeft, 'backward', 20); %start driving backwards
    
    while(distanceSensor.value > 10 ) %wait till robot is 10cm away from wall
        handle.beep();
        pause(0.1);
    end
    
    
    stopRobot(motorRight, motorLeft);
    
    rotateSensor(motorRotateSensor, 180, parkingLocation, -100);
    
   
end

