clear;
% 
handle = EV3();
handle.connect('bt', 'serPort', '/dev/rfcomm1');
% 

minDistanceDrive = 40;

error = 10;

distanceSensor = handle.sensor4;
motorRotateSensor = handle.motorC;
motorRight = handle.motorD;
motorLeft = handle.motorA;
soundSensor = handle.sensor3;


%MODES:
% 0 or 1 clap = stop;
% 2 claps = autonomous driving
% 3 claps = park
% 4 exit

currentMode = 0;


% set mode to dB
soundSensor.mode = DeviceMode.NXTSound.DB;

% clap detection threshold
clapThreshold = 30;
numSamples = 12;

% initialize sample array and state of lamps
values = zeros(numSamples, 1);
changes = zeros(numSamples - 1, 1);

iterations = 0;
AnzahlderKlatscher = 0;

changedClaps = false;
lastChanged = 0;
tic;

while 1
    % start loop
    iterations = iterations + 1;
        
    % throw away oldest sample and add the new one at the end
    values = values(2:end);
    try
        values(end+1) = soundSensor.value; 
    catch
        values(end+1) = 0;
    end
    
	changes = diff(values);
    
	NewNumberOfClaps = length(find(changes > clapThreshold == 1));

    
	if(NewNumberOfClaps > AnzahlderKlatscher)
        changedClaps = true;
        AnzahlderKlatscher = NewNumberOfClaps;
        lastChanged = toc;
    end

    if(toc - lastChanged > 0.5  && changedClaps)
        currentMode = AnzahlderKlatscher;
        changedClaps = false;
    end  
   
    
    if(NewNumberOfClaps == 0)
        AnzahlderKlatscher = 0;
    end
    
    display(num2str(currentMode));
    
    %changing the mode
    if(currentMode == 1)
    elseif(currentMode == 2)
        try
        	driveAutonomous(distanceSensor , motorRotateSensor, motorRight, motorLeft, minDistanceDrive, error );
        catch
        end
    elseif(currentMode == 3)
        try
            parkRobot(handle, distanceSensor , motorRotateSensor, motorRight, motorLeft );
        catch
        end
        currentMode = 0;
    elseif(currentMode == 4)
        break;
    end
    
    pause(0.05);
end

handle.disconnect();
