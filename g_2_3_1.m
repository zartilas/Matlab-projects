clc
clear
%  ASCII P = 80 
asc = 0:80:880;
nums = [400 70 -50 5 290 805 1250 1500 1600 1450 1150 800];
figure ('Name' , 'Periodic Signal Representation FFT');
plot (asc, nums, 'ro', 'LineWidth', 2, 'Color', '[0, 0, 1]');
xlim([0 360]);
xlabel('Degrees');
ylabel('Minutes');
title('{\bf SMT}');
grid on
 
d = fft(nums);
m = length(nums);
M = floor((m+1)/2);
a0 = d(1)/m;
an = 2 * (real(d(2:M))/m);
a6 = d(M+1)/m;
bn = -2*imag(d(2:M))/m;
hold on
x = 0:0.01:880;
n = 1:length(an);
y = a0 + an * cos(2* pi * n' * x/960) + bn * sin(2 * pi * n' * x/960) + a6 * cos(2 * pi * 6' * x/960);
plot(x, y, 'LineWidth', 2, 'Color', '[1, 0, 0]');
legend('Data', 'DFT', 'Location', 'NW');
