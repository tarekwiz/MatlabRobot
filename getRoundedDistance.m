function [ distance ] = getRoundedDistance( sensor )
    distance = round( sensor.value / 5 ) * 5;
end

