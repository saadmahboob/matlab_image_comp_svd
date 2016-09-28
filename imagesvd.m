home;
clear all;

I=imread("Hero_and_Circle_Image.jpg");
I = double(I);
Ir = I(:,:,1);
Ig = I(:,:,2);
Ib = I(:,:,3);

[Ur, Sr, Vr] = svd(Ir,'econ');
[Ug, Sg, Vg] = svd(Ig,'econ');
[Ub, Sb, Vb] = svd(Ib,'econ');

nrows = size(I)(1);
ncols = size(I)(2);

nmodes = 30;

Ur1 = Ur(1:nrows,1:nmodes);
Sr1 = Sr(1:nmodes,1:nmodes);
Vr1 = Vr(1:ncols,1:nmodes);

Ug1 = Ug(1:nrows,1:nmodes);
Sg1 = Sg(1:nmodes,1:nmodes);
Vg1 = Vg(1:ncols,1:nmodes);

Ub1 = Ub(1:nrows,1:nmodes);
Sb1 = Sb(1:nmodes,1:nmodes);
Vb1 = Vb(1:ncols,1:nmodes);


red = Ur1*Sr1*(Vr1');
green = Ug1*Sg1*(Vg1');
blue = Ub1*Sb1*(Vb1');

red = uint8(red);
green = uint8(green);
blue = uint8(blue);

%Isvd = zeros(nrows,ncols,3);
%Isvd(:,:,1) = red;
%Isvd(:,:,2) = green;
%Isvd(:,:,3) = blue;
Isvd = cat(3,red,green,blue);

imwrite(Isvd,"my_output_image.jpg");
