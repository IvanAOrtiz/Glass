clear;
clc;

%% Obtención de Volumenes
f1 = @(x) pi * (((1./x) + 4.5).^2);
g1 = @(x) pi * (((1./x) + 4.2).^2);
a1 = 0.39;
b1 = 1.7;

f2 = @(x) pi * (cos(3*x)./4 + 5).^2;
g2 = @(x) pi * (cos(3*x)./4 + 4.7).^2;
a2 = 1.7;
b2 = 13.1;

f3 = @(x) pi * (((x.^3)./55)/10).^2;
g3 = @(x) pi * ((((x.^3)./55)/10)-0.3).^2;
a3 = 13.1;
b3 = 14.2;

f4 = @(x) (log(x)/log(5)+5).^2;
g4 = @(x) (log(x)/log(5)+4.7).^2;
a4 = 14.2;
b4 = 18;

F1 = integral(f1, a1, b1);
F2 = integral(f2, a2, b2);
F3 = integral(f3, a3, b3);
F4 = integral(f4, a4, b4);

G1 = integral(g1, a1, b1);
G2 = integral(g2, a2, b2);
G3 = integral(g3, a3, b3);
G4 = integral(g4, a4, b4);

F = F1 + F2 + F3 + F4;
G = G1 + G2 + G3 + G4;

disp("Volumen Ecuación F1: " + F1);
disp("Volumen Ecuación F2: " + F2);
disp("Volumen Ecuación F3: " + F3);
disp("Volumen Ecuación F4: " + F4);
disp("Volumen del vaso considerando F: " + F);
disp("****************************");
disp("Volumen Ecuación G1: " + G1);
disp("Volumen Ecuación G2: " + G2);
disp("Volumen Ecuación G3: " + G3);
disp("Volumen Ecuación G4: " + G4);
disp("Volumen del vaso considerando G: " + G);
disp("****************************");
disp("Volumen real del vaso: " + (F - G));


%% Graficar Vaso
x = 0.39:0.001:18;
y = ((1./x)+4.5) .* ((0.4<=x) & (x<1.7)) + ((cos(3*x)./4)+5) .* ((1.7<=x) & (x<13.1)) + (((x.^3)./50+5)/10) .* ((13.1<=x) & (x<14.2)) + (log(x)/log(5)+5) .* ((14.2<=x) & (x<18.1));
y2 = ((1./x)+4.2) .* ((1<=x) & (x<1.7)) + ((cos(3*x)./4)+4.7) .* ((1.7<=x) & (x<13.1)) + ((((x.^3)./50+5)/10)-0.3) .* ((13.1<=x) & (x<14.2)) + (log(x-5)/log(5)+4.7) .* ((14.2<=x) & (x<18.1));
figure(1)
plot(x,y); % Graficar función del vaso en 2D
hold on
plot(x,y2);
figure(2)
cylinder(y); % Graficar función del vaso en 3D
colormap gray;
shading flat;


