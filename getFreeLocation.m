function [ angle ] = getFreeLocation( m1, s1, minDistance, motorFactor )
m1.power= 10;

m1.resetTachoCount();
m1.limitValue = 360 * motorFactor;
m1.brakeMode = 'brake';

m1.start();

while(s1.value < minDistance)
    pause(0.1);
end

m1.stop();

angle = m1.tachoCount / motorFactor;

if(m1.power > 0)
    m1.power = -100;
else
    m1.power = 100;
end

m1.limitValue = m1.tachoCount;
m1.start();
m1.waitFor();


end

