function [h,X] = FIRls(x,y,N)
% h = FIRls(x,y,P)
%
% This function will take an input and output signal and work to estimate
% the unknown impulse response as an N-length FIR system in a least squares
% sense.
%
% x     Input signal to the unkown FIR system of length M
% y     Output signal from the unknown FIR system of length M
% P     Number of taps in the unknown FIR system
% 
% h     Estimated P-length FIR filter.
%
% Note that M>>N.
%
% 
% 7/7/17

M = length(x);

%Ensure that the input and output vectors are the same length
if(length(y)~=M)
    disp('Input and output vectors must be the same length'); return;
end

%Ensure that y is a column vector
if(size(y,1)<size(y,2)) y = y'; end

%Set up X Matrix
X = zeros(M-N+1,N);
for k=0:N-1
    X(:,k+1) = x(N-k:M-k);
end

%Estimate unknown FIR of length P via the least square result
h = (X'*X)^(-1)*X'*y(N:M);