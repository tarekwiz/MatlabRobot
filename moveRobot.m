function [] = moveRobot( m1, m2, direction, power )

%check direction
if(strcmp(direction, 'forward'))
    m1.power = -power;
else
    m1.power = power;
end

%motors always rotate opposite to each other
m2.power = m1.power;

m1.limitValue = 0;
m2.limitValue = 0;
m1.brakeMode = 'Brake';
m2.brakeMode = 'Brake';
m1.syncedStart(m2);

end

