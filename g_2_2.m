clc
clear
 
n = 100;
x=linspace(-3,3,n);
y=1./((x-0.5).^2+1);
z= fft(y);
padsize = 28/2;
 
if mod(length(z),2)
    zp = ifftshift([zeros(1,padsize) fftshift(z) zeros(1,padsize)]);
else
    zp = fftshift(z);
    zp(1) = zp(1)/2;
    zp(end+1) = zp(1);
    zp = ifftshift ([zeros(1,padsize) zp zeros(1,padsize-1)]);
end
figure ('Name','Function fft()');
xp = linspace (x(1), x(end), length(zp));
yp = ifft(zp)/length(z)*length(zp);
 
plot(xp, yp,'b',x,y,'r');
