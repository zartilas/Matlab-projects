clc
clear

dt = 0.001;
t_min = -10 ;
t_max = 10;
t = (t_min:dt:t_max);

x1 = cos(100*pi*t);
x2 = cos(200*pi*t);
x3 = sin(500*pi*t);
x = x1+x2+x3;

Ts1 = 0.002;
t1 = (t_min : Ts1 : t_max);
Nmax1 = t_max/Ts1;
h1 = (-Nmax1 : 1 : Nmax1);
Xs1 = cos(100*pi*h1*Ts1) + cos(200*pi*h1*Ts1) + sin(500*pi*h1*Ts1);
r1 = zeros(1,length(t));

for k=1:1:length(t)
    r1(k)=Xs1 * sinc((t(k) - h1*Ts1)/Ts1)';
end

    figure ('Name','Reconstructed Signal for Ts1=0.002 sec');
   
    plot(t ,x, '-r', 'LineWidth', 1.5, 'Color', [0.4940, 0.1840, 0.5560]);
    hold on
    plot(t, r1, '*b', 'LineWidth', 1.5, 'Color', [0.8500, 0.3250, 0.0980]);
   
    xlabel('-10 \leq t \leq +10');
    ylabel('r1(t)');
    grid on 