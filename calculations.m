%NCP15XW682p03RC
%min working current 0.121mA
%max voltage = 5V
r0 = 6800;
rc = r0;
beta = 3950;
t = 298.15;
t0 = 273.15;
t50 = 323.15;
E = 5;
%Calculating min and max resistance values at 0 at 50 degrees respectively
r_t0 = r0*exp(beta*(1/t0-1/t));
r_t50 = r0*exp(beta*(1/t50-1/t));
r_t0
r_t50
res = sqrt(r_t0*r_t50);
%Calculating potential at voltage divider at 0 and 50 degrees respectively
v_0 = E*(rc/(rc+r_t0));
v_50 = E*(rc/(rc+r_t50));
v_0
v_50

%Calculating gain required
%Setting ideal values
ideal_min_v = 0.05; %50mV
ideal_max_v = 5.25; %5V

gain = (ideal_max_v - ideal_min_v)/(v_50-v_0);
gain
(gain-1)
actual_gain = 1+(16/15);
actual_gain

swing = (v_50-v_0)*actual_gain;
swing
v_amax = (ideal_max_v + ideal_min_v)/2+swing/2;
v_amax
vref = (v_50*actual_gain-v_amax)/(16/15);
vref
%1.5k 1.6k  0.9375
