t = (0:0.01:1); 
y = square(2*pi*t);
y2 = 0;
kappas = [1,3,5,10,50,500];
position = 1;
counter = 0;
for i = 1:2:1000
    counter = counter + 1;
    f = (4/pi) * (sin(2*pi*i*t)) / i;
    y2 = y2 + f;
    for k = 1:1:6
        if kappas(k) == counter
            subplot(3,2,k);
            plot(t,y,'r');
            ylim([-2 2]) 
            hold on;
            plot(t,y2,'blue'); 
            title("Approximation with " + num2str(counter) + " sine functions"); 
        end
    end
end
