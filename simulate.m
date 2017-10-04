rps6_5=importdata('Z/pwm6.5.csv');
rps7_5=importdata('Z/pwm7.5.csv');
rps8_5=importdata('Z/pwm8.5.csv');
rps9_5=importdata('Z/pwm9.5.csv');

indexes=[42,203;117,280;132,256;123,208];
input6_5=[zeros(indexes(1,1),1);ones(indexes(1,2)-indexes(1,1),1)*6.5;zeros(length(rps6_5)-indexes(1,2),1)];
ref6_5=[zeros(indexes(1,1),1);ones(indexes(1,2)-indexes(1,1),1)*14.8;zeros(length(rps6_5)-indexes(1,2),1)];
input7_5=[zeros(indexes(2,1),1);ones(indexes(2,2)-indexes(2,1),1)*7.5;zeros(length(rps7_5)-indexes(2,2),1)];
ref7_5=[zeros(indexes(2,1),1);ones(indexes(2,2)-indexes(2,1),1)*24.59;zeros(length(rps7_5)-indexes(2,2),1)];
input8_5=[zeros(indexes(3,1),1);ones(indexes(3,2)-indexes(3,1),1)*8.5;zeros(length(rps8_5)-indexes(3,2),1)];
ref8_5=[zeros(indexes(3,1),1);ones(indexes(3,2)-indexes(3,1),1)*31.49;zeros(length(rps8_5)-indexes(3,2),1)];
input9_5=[zeros(indexes(4,1),1);ones(indexes(4,2)-indexes(4,1),1)*9.5;zeros(length(rps9_5)-indexes(4,2),1)];
ref9_5=[zeros(indexes(4,1),1);ones(indexes(4,2)-indexes(4,1),1)*39.16;zeros(length(rps9_5)-indexes(4,2),1)];
dt=0.025;
t6_5=0:0.025:length(rps6_5)*dt-dt;
t7_5=0:0.025:length(rps7_5)*dt-dt;
t8_5=0:0.025:length(rps8_5)*dt-dt;
t9_5=0:0.025:length(rps9_5)*dt-dt;

H6_5=tf(278.4,[1,37.43,127.6]);
H7_5=tf(305.4,[1,28.65,93.16]);
H8_5=tf(213.4,[1,17.42,57.6]);
H9_5=tf(190.8,[1,14.12,46.29]);

CONTROLLER=CPID9
H06_5=feedback(CONTROLLER*H6_5,1);
H07_5=feedback(CONTROLLER*H7_5,1);
H08_5=feedback(CONTROLLER*H8_5,1);
H09_5=feedback(CONTROLLER*H9_5,1);

y6_5=lsim(H6_5,input6_5,t6_5);
y7_5=lsim(H7_5,input7_5,t7_5);
y8_5=lsim(H8_5,input8_5,t8_5);
y9_5=lsim(H9_5,input9_5,t9_5);

yc6_5=lsim(H06_5,ref6_5,t6_5);
yc7_5=lsim(H07_5,ref7_5,t7_5);
yc8_5=lsim(H08_5,ref8_5,t8_5);
yc9_5=lsim(H09_5,ref9_5,t9_5);

subplot(411);
plot(t6_5,y6_5);hold on;
plot(t6_5,yc6_5,'r');
plot(t6_5,rps6_5);hold off;
subplot(412);
plot(t7_5,y7_5);hold on;
plot(t7_5,yc7_5,'r');
plot(t7_5,rps7_5);hold off;
subplot(413);
plot(t8_5,y8_5);hold on;
plot(t8_5,yc8_5,'r');
plot(t8_5,rps8_5);hold off;
subplot(414);
plot(t9_5,y9_5);hold on;
plot(t9_5,yc9_5,'r');
plot(t9_5,rps9_5);hold off;
