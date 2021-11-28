lab = sim("onemore");
vout = lab.get("outvolt");
volt = lab.get("voltage");
tin = lab.get("intemp");

plot(tin.data, vout.data);
hold on
%Calculating real value
t = 273.15:1:323.15;
for i=1:numel(t)
    tval = t(i);
    v(i) = 5/(exp(3950*((1/tval)-(1/298.15)))+1);
end
plot(t,((v-1.1462)*2.0667)+0.05);
xlabel("Temperature K");
ylabel("Voltage")
legend("Experimental", "Theoretical");
title("Experimental vs Theoretical Thermometer values");
hold off
