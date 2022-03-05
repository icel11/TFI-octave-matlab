clc; clear all; close all
%pkg install -forge control;

pkg load control;

s = tf('s')


FdeTMotor = 366.5/(s + 2.5);
FdeTHelice = 0.0032;
FdeTEstructura = 18.09/(s^2 + 1.776 * s + 12.05);
GainGradosAVolt = 0.0255;
GainRadAGrad = 57.297;

FdeTla = FdeTMotor * FdeTHelice * FdeTEstructura * GainGradosAVolt * GainRadAGrad;
% 31 / (s^3 + 4.276 * s^2 + 16.49 * s + 30.12)
FdeTlc = feedback(FdeTla);
% 31 / (s^3 + 4.276 * s^2 + 16.49 * s + 61.12)

%fig 6 & 7
%step(FdeTlc)


%fig 8
rlocus(FdeTla)

FdeTlaPIDNoK = FdeTla*(s^2+1.778*s+12.05)/s

%fig 9
%rlocus(FdeTlcPID); hold on;
%sgrid(0.707, 1);
s1 = 1.25 + 1.25*i;
invk = 30.96/(s1*(s1+2.5));
%k = 1/invk;
k = 0.1

FdeTlaPID = k * FdeTlaPIDNoK;
%fig 10
%step(FdeTlc, 30, 'r'); hold on;
%step(feedback(FdeTlaPID), 30);


CompAtraso = (s+0.5)/(s+0.0051)
%fig 11
%step(feedback(FdeTla*CompAtraso), 'r', 70); hold on;
%step(feedback(FdeTla),70)

%fig 12
%rlocus(TFla*CompAtraso);


%step(TFlc)