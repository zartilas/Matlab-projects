clc
clear

asc = 0:30:330;
dec = [408 89 -66 10 338 807 1238 1511 1583 1462 1183 804];
plot(asc,dec,'ro','Linewidth',2);
xlim([0 360])
xlabel('Degrees');
ylabel('Minutes');
title('{\bf Position Of Smt}');
grid on
% use of fft
d = fft(dec);
m = length(dec);
M = floor((m+1)/2);
a0 = d(1)/m;
an = 2*real(d(2:M))/m;
a6 = d(M+1)/m;
bn = -2*imag(d(2:M))/m; 
% Plot the interpolant with the data
hold on
x = 0:0.01:360;
n = 1: length(an);
y = a0 + an*cos(2*pi*n'*x/360) + bn*sin(2*pi*n'*x/360) + a6*cos(2*pi*6'*x/360);
 
plot(x, y,'Linewidth',2);
legend('Data','DFT','Location','NW');