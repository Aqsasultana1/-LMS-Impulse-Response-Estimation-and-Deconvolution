
clear all
close all
clc

%% Part 4 - Design Tasks
%% Problem 1
%Plotting white noise
figure(1);
subplot(221)
[x,fs] = audioread('WhiteNoise_Pure.wav');
%sound(x,fs)
plot(x(1:5000));
xlabel('$$n$$ 5000 Samples', 'interpreter','latex');
ylabel('$$x[n]$$', 'interpreter','latex');
title('White Noise x[n]', 'interpreter','latex');
xlim([1 5000]);

%fft of white noise
subplot(222)
w = linspace(-pi, pi, 4096);
X = abs(fftshift(fft(x, 4096)));
plot(w, X);
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|X(e^{j\omega})|$$','interpreter','latex');
title('$$|X(e^{j\omega})|$$ - White Noise','interpreter','latex');

%plotting white noise chaneel
figure(1);
subplot(223)
[y,fs] = audioread('WhiteNoise_Channel.wav');
%sound(y,fs)
plot(y(1:5000));
xlabel('$$n$$ 5000 Samples', 'interpreter','latex');
ylabel('$$y[n]$$', 'interpreter','latex');
title('White Noise Channel y[n]', 'interpreter','latex');
xlim([1 5000]);

%fft of white noise channel
subplot(224)
w = linspace(-pi, pi, 4096);
Y = abs(fftshift(fft(y, 4096)));
plot(w, Y);
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|Y(e^{j\omega})|$$','interpreter','latex');
title('$$|Y(e^{j\omega})|$$ -  White Noise Channel','interpreter','latex');
%%
%Plotting Song
figure(2);
subplot(221)
[x,fs] = audioread('Song_Pure.wav');
%sound(x,fs)
plot(x(1:5000));
xlabel('$$n$$ 5000 Samples', 'interpreter','latex');
ylabel('$$x[n]$$', 'interpreter','latex');
title('Song x[n]', 'interpreter','latex');
xlim([1 5000]);
%sound(x(300000:600000), fs);

%fft of Song
subplot(222)
w = linspace(-pi, pi, 4096);
X = abs(fftshift(fft(x, 4096)));
plot(w, X);
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|X(e^{j\omega})|$$','interpreter','latex');
title('$$|X(e^{j\omega})|$$ -  Song','interpreter','latex');

%plotting Song channel
subplot(223)
[y,fs] = audioread('Song_Channel.wav');
plot(y(1:5000));
xlabel('$$n$$ 5000 Samples', 'interpreter','latex');
ylabel('$$y[n]$$', 'interpreter','latex');
title('Song y[n]', 'interpreter','latex');
xlim([1 5000]);
%sound(y(300000:600000), fs);

%fft of  channel
subplot(224)
w = linspace(-pi, pi, 4096);
Y = abs(fftshift(fft(y, 4096)));
plot(w, Y);
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|Y(e^{j\omega})|$$','interpreter','latex');
title('$$|Y(e^{j\omega})|$$ -  Song Channel','interpreter','latex');

%% Problem 2
%% When P = 5
figure(3);
subplot(231);

%plot h[n]
[x,fs] = audioread('WhiteNoise_Pure.wav');
[y,fs] = audioread('WhiteNoise_Channel.wav');
X1 = (fftshift(fft(x, 4096)));
Y1 = (fftshift(fft(y, 4096)));
P = 5;
[h, X] = FIRls(x,y,P);
stem(h);
xlabel('$$n$$','interpreter','latex');
ylabel('$$h[n]$$','interpreter','latex');
title('$$h[n]$$','interpreter','latex');

% Plot fft
subplot(232)
H = (fftshift(fft(h, 4096)));
plot(w, abs(H));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|H(e^{j\omega})|$$','interpreter','latex');
title('$$|H(e^{j\omega})|$$','interpreter','latex');

% plot phase
subplot(233);
plot(w,angle(H));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$\angle H(e^{j\omega})|$$','interpreter','latex');
title('$$\angle H(e^{j\omega})|$$','interpreter','latex');

% Inverse system response
subplot(234)
n = 1:50;
e = 0.01;
Ha = (fft(h, 2048));
hi1 = Ha + e;
hi2 = 1./hi1;
hi = ifft((hi2));
hi = (1/20)*hi.*(1/((hi(1)*h(1))));
stem(n,hi(1:50));
xlabel('$$n$$','interpreter','latex');
ylabel('$$h_i[n]$$','interpreter','latex');
title('$$h_i[n]$$','interpreter','latex');

% fft of hi
subplot(235)
Hi = fftshift(fft(hi, 4096));
plot(w,abs(Hi));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|H_i(e^{j\omega})|$$','interpreter','latex');
title('$$|H_i(e^{j\omega})|$$','interpreter','latex');

% phase
subplot(236);
plot(w,angle(Hi));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$\angle H_i(e^{j\omega})|$$','interpreter','latex');
title('$$\angle H_i(e^{j\omega})|$$','interpreter','latex');

%% When P = 9
figure(4);
subplot(231);
P = 9;
[h, X] = FIRls(x,y,P);
stem(h);
xlabel('$$n$$','interpreter','latex');
ylabel('$$h[n]$$','interpreter','latex');
title('$$h[n]$$','interpreter','latex');

% Plot fft
subplot(232)
H = (fftshift(fft(h, 4096)));
plot(w, abs(H));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|H(e^{j\omega})|$$','interpreter','latex');
title('$$|H(e^{j\omega})|$$','interpreter','latex');

% plot phase
subplot(233);
plot(w,angle(H));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$\angle H(e^{j\omega})|$$','interpreter','latex');
title('$$\angle H(e^{j\omega})|$$','interpreter','latex');

% Inverse system response
subplot(234)
n = 1:50;
Ha = (fft(h, 2048));
hi1 = Ha + e;
hi2 = 1./hi1;
hi = ifft((hi2));
hi = (1/20)*hi.*(1/((hi(1)*h(1))));
stem(n,hi(1:50));
xlabel('$$n$$','interpreter','latex');
ylabel('$$h_i[n]$$','interpreter','latex');
title('$$h_i[n]$$','interpreter','latex');

% fft of hi
subplot(235)
Hi = fftshift(fft(hi, 4096));
plot(w,abs(Hi));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|H_i(e^{j\omega})|$$','interpreter','latex');
title('$$|H_i(e^{j\omega})|$$','interpreter','latex');

% phase
subplot(236);
plot(w,angle(Hi));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$\angle H_i(e^{j\omega})|$$','interpreter','latex');
title('$$\angle H_i(e^{j\omega})|$$','interpreter','latex');

%% When P = 25
figure(5);
subplot(231);
P = 25;
[h, X] = FIRls(x,y,P);
stem(h);
xlabel('$$n$$','interpreter','latex');
ylabel('$$h[n]$$','interpreter','latex');
title('$$h[n]$$','interpreter','latex');

% Plot fft
subplot(232)
H = (fftshift(fft(h, 4096)));
plot(w, abs(H));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|H(e^{j\omega})|$$','interpreter','latex');
title('$$|H(e^{j\omega})|$$','interpreter','latex');

% plot phase
subplot(233);
plot(w,angle(H));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$\angle H(e^{j\omega})|$$','interpreter','latex');
title('$$\angle H(e^{j\omega})|$$','interpreter','latex');

% Inverse system response
subplot(234)
n = 1:50;
Ha = (fft(h, 2048));
hi1 = Ha + e;
hi2 = 1./hi1;
hi = ifft((hi2));
hi = (1/20)*hi.*(1/((hi(1)*h(1))));
stem(n,hi(1:50));
xlabel('$$n$$','interpreter','latex');
ylabel('$$h_i[n]$$','interpreter','latex');
title('$$h_i[n]$$','interpreter','latex');

% fft of hi
subplot(235)
Hi = fftshift(fft(hi, 4096));
plot(w,abs(Hi));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|H_i(e^{j\omega})|$$','interpreter','latex');
title('$$|H_i(e^{j\omega})|$$','interpreter','latex');

% phase
subplot(236);
plot(w,angle(Hi));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$\angle H_i(e^{j\omega})|$$','interpreter','latex');
title('$$\angle H_i(e^{j\omega})|$$','interpreter','latex');

%% When P = 51
figure(6)
subplot(231);
P = 51;
[h, X] = FIRls(x,y,P);
stem(h);
xlabel('$$n$$','interpreter','latex');
ylabel('$$h[n]$$','interpreter','latex');
title('$$h[n]$$','interpreter','latex');

% Plot fft
subplot(232)
H = (fftshift(fft(h, 4096)));
plot(w, abs(H));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|H(e^{j\omega})|$$','interpreter','latex');
title('$$|H(e^{j\omega})|$$','interpreter','latex');

% plot phase
subplot(233);
plot(w,angle(H));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$\angle H(e^{j\omega})|$$','interpreter','latex');
title('$$\angle H(e^{j\omega})|$$','interpreter','latex');

% Inverse system response
subplot(234)
n = 1:50;
Ha = (fft(h, 2048));
hi1 = Ha + e;
hi2 = 1./hi1;
hi = ifft((hi2));
hi = (1/20)*hi.*(1/((hi(1)*h(1))));
stem(n,hi(1:50));
xlabel('$$n$$','interpreter','latex');
ylabel('$$h_i[n]$$','interpreter','latex');
title('$$h_i[n]$$','interpreter','latex');

% fft of hi
subplot(235)
Hi = fftshift(fft(hi, 4096));
plot(w,abs(Hi));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|H_i(e^{j\omega})|$$','interpreter','latex');
title('$$|H_i(e^{j\omega})|$$','interpreter','latex');

% phase
subplot(236);
plot(w,angle(Hi));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$\angle H_i(e^{j\omega})|$$','interpreter','latex');
title('$$\angle H_i(e^{j\omega})|$$','interpreter','latex');

%% Problem 3
%% When P = 5
figure(7)
subplot(221);
[x,fs] = audioread('Song_Pure.wav');
[y,fs] = audioread('Song_Channel.wav');
plot(x(1:5000));
xlabel('$$n$$ 5000 Samples', 'interpreter','latex');
ylabel('$$x[n]$$', 'interpreter','latex');
title('Song x[n]', 'interpreter','latex');
xlim([1 5000]);
subplot(222)
w = linspace(-pi, pi, 4096);
X = (fftshift(fft(x, 4096)));
plot(w, abs(X));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|X(e^{j\omega})|$$','interpreter','latex');
title('$$|X(e^{j\omega})|$$ -  Song','interpreter','latex');

% When P = 5
P = 5;
[x,fs] = audioread('WhiteNoise_Pure.wav');
[y,fs] = audioread('WhiteNoise_Channel.wav');

h = FIRls(x,y,P);
n = 1:50;
Ha = (fft(h, 2048));
hi1 = Ha + e;
hi2 = 1./hi1;
hi = ifft((hi2));
hi = (1/20)*hi.*(1/((hi(1)*h(1))));
[x,fs] = audioread('Song_Pure.wav');
[y,fs] = audioread('Song_Channel.wav');     
xest5 = conv(y(:,1), hi, 'same');
xest = xest5;
%sound(xest(300000:600000), fs);

subplot(223);

plot(xest(1:5000));
xlabel('$$n$$ 5000 Samples', 'interpreter','latex');
ylabel('$$\hat{x}[n]$$', 'interpreter','latex');
title('Song $$\hat{x}[n]$$ - Processed', 'interpreter','latex');
xlim([1 5000]);
XEST = fftshift(fft(xest, 4096));
subplot(224);
plot(w,abs(XEST));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|\hat{X}(e^{j\omega})|$$','interpreter','latex');
title('$$|\hat{X}(e^{j\omega})|$$   ','interpreter','latex');

%% When P = 9
figure(8)
subplot(221);
[x,fs] = audioread('Song_Pure.wav');
[y,fs] = audioread('Song_Channel.wav');
%sound(y,fs)
plot(x(1:5000));
xlabel('$$n$$ 5000 Samples', 'interpreter','latex');
ylabel('$$x[n]$$', 'interpreter','latex');
title('Song x[n]', 'interpreter','latex');
xlim([1 5000]);
subplot(222)
w = linspace(-pi, pi, 4096);
X = (fftshift(fft(x, 4096)));
plot(w, abs(X));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|X(e^{j\omega})|$$','interpreter','latex');
title('$$|X(e^{j\omega})|$$ -  Song','interpreter','latex');

% When P = 9
P = 9;
[x,fs] = audioread('WhiteNoise_Pure.wav');
[y,fs] = audioread('WhiteNoise_Channel.wav');

h = FIRls(x,y,P);
n = 1:50;
Ha = (fft(h, 2048));
hi1 = Ha + e;
hi2 = 1./hi1;
hi = ifft((hi2));
hi = (1/20)*hi.*(1/((hi(1)*h(1))));
[x,fs] = audioread('Song_Pure.wav');
[y,fs] = audioread('Song_Channel.wav');     
xest9 = conv(y(:,1), hi, 'same');
xest = xest9;
%sound(xest(300000:600000), fs);

subplot(223);

plot(xest(1:5000));
xlabel('$$n$$ 5000 Samples', 'interpreter','latex');
ylabel('$$\hat{x}[n]$$', 'interpreter','latex');
title('Song $$\hat{x}[n]$$ - Processed', 'interpreter','latex');
xlim([1 5000]);
XEST = fftshift(fft(xest, 4096));
subplot(224);
plot(w,abs(XEST));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|\hat{X}(e^{j\omega})|$$','interpreter','latex');
title('$$|\hat{X}(e^{j\omega})|$$   ','interpreter','latex');

%% When P = 25
figure(9)
subplot(221);
[x,fs] = audioread('Song_Pure.wav');
[y,fs] = audioread('Song_Channel.wav');
%sound(y(300000:600000),fs)
plot(x(1:5000));
xlabel('$$n$$ 5000 Samples', 'interpreter','latex');
ylabel('$$x[n]$$', 'interpreter','latex');
title('Song x[n]', 'interpreter','latex');
xlim([1 5000]);
subplot(222)
w = linspace(-pi, pi, 4096);
X = (fftshift(fft(x, 4096)));
plot(w, abs(X));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|X(e^{j\omega})|$$','interpreter','latex');
title('$$|X(e^{j\omega})|$$ -  Song','interpreter','latex');

% When P = 25
P = 25;
[x,fs] = audioread('WhiteNoise_Pure.wav');
[y,fs] = audioread('WhiteNoise_Channel.wav');

h = FIRls(x,y,P);
n = 1:50;
Ha = (fft(h, 2048));
hi1 = Ha + e;
hi2 = 1./hi1;
hi = ifft((hi2));
hi = (1/20)*hi.*(1/((hi(1)*h(1))));
[x,fs] = audioread('Song_Pure.wav');
[y,fs] = audioread('Song_Channel.wav');     
xest25 = conv(y(:,1), hi, 'same');
xest = xest25;

%sound(xest(300000:600000), fs);

subplot(223);

plot(xest(1:5000));
xlabel('$$n$$ 5000 Samples', 'interpreter','latex');
ylabel('$$\hat{x}[n]$$', 'interpreter','latex');
title('Song $$\hat{x}[n]$$ - Processed', 'interpreter','latex');
xlim([1 5000]);
XEST = fftshift(fft(xest, 4096));
subplot(224);
plot(w,abs(XEST));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|\hat{X}(e^{j\omega})|$$','interpreter','latex');
title('$$|\hat{X}(e^{j\omega})|$$   ','interpreter','latex');

%% When P = 51
figure(10)
subplot(221);
[x,fs] = audioread('Song_Pure.wav');
[y,fs] = audioread('Song_Channel.wav');
%sound(y,fs)
plot(x(1:5000));
xlabel('$$n$$ 5000 Samples', 'interpreter','latex');
ylabel('$$x[n]$$', 'interpreter','latex');
title('Song x[n]', 'interpreter','latex');
xlim([1 5000]);
subplot(222)
w = linspace(-pi, pi, 4096);
X = (fftshift(fft(x, 4096)));
plot(w, abs(X));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|X(e^{j\omega})|$$','interpreter','latex');
title('$$|X(e^{j\omega})|$$ -  Song','interpreter','latex');

% When P = 51
P = 51;
[x,fs] = audioread('WhiteNoise_Pure.wav');
[y,fs] = audioread('WhiteNoise_Channel.wav');

h = FIRls(x,y,P);
n = 1:50;

Ha = (fft(h, 2048));
hi1 = Ha + e;
hi2 = 1./hi1;
hi = ifft((hi2));
hi = (1/20)*hi.*(1/((hi(1)*h(1))));
[x,fs] = audioread('Song_Pure.wav');
[y,fs] = audioread('Song_Channel.wav');     
xest51 = conv(y(:,1), hi, 'same');
xest = xest51;

%sound(xest(300000:600000), fs);

subplot(223);

plot(xest(1:5000));
xlabel('$$n$$ 5000 Samples', 'interpreter','latex');
ylabel('$$\hat{x}[n]$$', 'interpreter','latex');
title('Song $$\hat{x}[n]$$ - Processed', 'interpreter','latex');
xlim([1 5000]);
XEST = fftshift(fft(xest, 4096));
subplot(224);
plot(w,abs(XEST));
xlabel('$$\omega$$ rad/samps','interpreter','latex');
ylabel('$$|\hat{X}(e^{j\omega})|$$','interpreter','latex');
title('$$|\hat{X}(e^{j\omega})|$$   ','interpreter','latex');

%% Play the reconstructed song for e = 0.01
[x,fs] = audioread('Song_Pure.wav');
[y,fs] = audioread('Song_Channel.wav');
%sound(x(300000:600000),fs)
%sound(y(300000:600000),fs)
%sound(xest5(300000:600000), fs);
%sound(xest9(300000:600000), fs);
sound(xest25(300000:600000), fs);
%sound(xest51(300000:600000), fs);

