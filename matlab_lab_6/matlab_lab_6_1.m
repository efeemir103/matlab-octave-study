R = 100; L=0.13; C = 0.25e-9; % Constants
f = -1e5:1e2:1e7;
I=120*exp(1j*0)./(R+1j*2*pi.*f*L-1j.*(1./(2*pi.*f*C)));

figure
plot(f, abs(I));
title('The magnitude of the current on a linear scale');
xlabel('f (Hz)');
ylabel('I_m (A)');
grid on;
figure
plot(log10(f), abs(I));
title('The phase of the current on a log scale');
xlabel('f (*10^x Hz)');
ylabel('I_m (A)');
grid on;

figure
plot(f, angle(I)*180/pi);
title('The phase angle of the current on a linear scale');
xlabel('f (Hz)');
ylabel('\theta (Degrees)');
grid on;

figure
plot(log10(f), angle(I)*180/pi);
title('The phase angle of the current on a log scale');
xlabel('f (*10^x Hz)');
ylabel('I_m (A)');
grid on;

figure
subplot(2, 1, 1);
plot(log10(f), abs(I));
title('The phase of the current on a log scale');
xlabel('f (*10^x Hz)');
ylabel('I_m (A)');
grid on;
subplot(2,1,2);
plot(log10(f), angle(I)*180/pi);
title('The phase angle of the current on a log scale');
xlabel('f (*10^x Hz)');
ylabel('I_m (A)');
grid on;
