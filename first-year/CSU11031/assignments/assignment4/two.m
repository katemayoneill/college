t = (0:0.01:1);
y = square(2 * pi * x);

plot(x,y,'r'); 
hold on;
for j = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
	y = sin(2*pi*k*x);
    y2 = (4/(pi*k))*y;
	plot (x,y);
end