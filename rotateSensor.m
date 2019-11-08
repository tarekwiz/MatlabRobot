function [ ] = rotateSensor( rotatingMotor, angle, direction, power )
m1 = rotatingMotor;
if(strcmp(direction, 'right'))
    m1.power= power;
else
    m1.power = -power;
end

m1.resetTachoCount();
m1.limitValue = angle * 5;
m1.brakeMode = 'brake';

m1.stop();
m1.start();
m1.waitFor();
m1.stop();

end

