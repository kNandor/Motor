rps6_5=importdata('Z/pwm6.5.csv');
rps7_5=importdata('Z/pwm7.5.csv');
rps8_5=importdata('Z/pwm8.5.csv');
rps9_5=importdata('Z/pwm9.5.csv');

lens=[length(rps6_5),length(rps7_5),length(rps8_5),length(rps9_5)];
in=[6.5,7.5,8.5,9.5];
rps=[rps6_5;rps7_5;rps8_5;rps9_5];
dt=0.025;
t=(0:dt:length(rps)*dt-dt)';

plot(t,rps);
indexes=[42,203;117,280;132,256;123,208];
input=[];1
for i=1:length(indexes)
    i1=indexes(i,1);
    i2=indexes(i,2);
    pwm=in(i);
    l=lens(i);
    input=[input;zeros(i1,1);ones(i2-i1,1)*pwm;zeros(l-i2,1)];
end
subplot(211);plot(t,rps);
subplot(212);plot(t,input);