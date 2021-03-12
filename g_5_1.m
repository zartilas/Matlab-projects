function [blurring] = g_5_1(~,a)
 I=imread('img_g_5.png');
 I=double(I/255);
 [rows,columns,colors]=size(I);
 IF=zeros(rows,columns,colors);
    for c=1:1:colors
        Ic=I(:,:,c);
        Fc=fft2(Ic);
        Cc=sqrt(Fc.*conj(Fc));
        F=reshape(Fc,1,rows*columns);
        C=reshape(Cc,1,rows*columns);
        [~,IC]=sort(C, 'ascend');
        L=length(C);
        Na=round(L*a);
        Is=1;
        If=Na;
        Izeros=IC([Is:If]);
        F(Izeros)=0;
        F=reshape(F,rows, columns);
        IFc=ifft2(F);
        IFc=real(IFc);
        IF(:,:,c)=IFc;
    end
blurring =uint8(IF*255);
imshow(blurring);
end
%function call: blurring = g_5_1('img_g_5.png', 0.99);