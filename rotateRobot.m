function [] = rotateRobot( m1, m2, direction, power, angle )

%check direction
if(strcmp(direction, 'right'))
    m1.power = power;
else
    m1.power = -power;
end

%motors always rotate opposite to each other
m2.power = -m1.power;

m1.resetTachoCount();
m2.resetTachoCount();

%set the limitvalue (rotation of motor)
m1.limitValue = angle * 3;
m2.limitValue = angle * 3;


m1.start();
m2.start();
m1.waitFor();
m2.waitFor();
m1.stop();
m2.stop();


end

