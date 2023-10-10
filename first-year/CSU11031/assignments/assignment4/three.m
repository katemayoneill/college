t = (1:0.01:2); 
y = square(2*pi*t);
kappas = [1,3,5,10,50,500];
amplitudes = zeros(1,500);
position = 1;
counter = 0; 
for i = 1:2:1000
    counter = counter + 1; 
    f = (4/pi) * (sin(2*pi*i*t)) / i;
    amplitudes(counter) = max(f);
    for k = 1:1:6
        if kappas(k) == counter
            subplot(3,2,k);
            ylim([0 1.5])
            hold on;
            plot_amps = zeros(1,counter);
            for j = 1:1:counter
                plot_amps(j) = amplitudes(j);
            end
            exes = 1:1:counter;
            stem(exes,plot_amps,'blue');
            title("Approximation with " + num2str(counter) + " sine functions"); 
        end
    end
end