% clear
% 
% handle = EV3();
% handle.connect('bt', 'serPort', '/dev/rfcomm0');
% 
% handle.disconnect();

x = [5 10 20 30 40 50 70 100 150 200 250 300];
y = [5.7  10.1 18.9 28.8 40.3 49 67.7 97.2 144.4 200 250 250];
 
figure;
plot(x, y);


x = [5 10 15 20 25 30];
y = [51.2 52 51.5 100 250 250];
 
figure;
plot(x, y);

