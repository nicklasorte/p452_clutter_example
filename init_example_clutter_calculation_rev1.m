clear;
clc;
close all;
app=NaN(1);
format shortG
top_start_clock=clock;
folder1='C:\Local Matlab Data\3.5GHz'; %%%%%Folder where all the matlab code is placed.
cd(folder1)
addpath(folder1)

freq_ghz=3.55; %%%%%%%%Ghz
cbsd_ant_height=1:0.1:50; %%%%%%%%%meters


%%%%%%%%%%ITU-R 452-Clutter
dk=0.1;%%%%0.1 km
ha_10=10; %%%%%%Placeholder [10m]
Ffc=0.25+0.375.*(1+tanh(7.5.*(freq_ghz-0.5)));
Ah_10=10.25.*Ffc.*exp(-1.*dk).*(1-tanh(6.*((cbsd_ant_height./ha_10)-0.625)))-0.33;
idx_zero=find(Ah_10<0);
Ah_10(idx_zero)=0;

%%%%%%%%%%ITU-R 452-Clutter
dk=0.1;%%%%0.1 km
ha_25=25; %%%%%%Placeholder [25m]
Ffc=0.25+0.375.*(1+tanh(7.5.*(freq_ghz-0.5)));
Ah_25=10.25.*Ffc.*exp(-1.*dk).*(1-tanh(6.*((cbsd_ant_height./ha_25)-0.625)))-0.33;
idx_zero=find(Ah_25<0);
Ah_25(idx_zero)=0;


dk=0.1;%%%%0.1 km
ha_50=50; %%%%%%Placeholder [50m]
Ffc=0.25+0.375.*(1+tanh(7.5.*(freq_ghz-0.5)));
Ah_50=10.25.*Ffc.*exp(-1.*dk).*(1-tanh(6.*((cbsd_ant_height./ha_50)-0.625)))-0.33;
idx_zero=find(Ah_50<0);
Ah_50(idx_zero)=0;


close all;
figure;
hold on;
plot(cbsd_ant_height,Ah_10,'-m','LineWidth',2,'DisplayName','ha=10m')
plot(cbsd_ant_height,Ah_25,'-b','LineWidth',2,'DisplayName','ha=25m')
plot(cbsd_ant_height,Ah_50,'-g','LineWidth',2,'DisplayName','ha=50m')
xlabel('CBSD Antenna Height [m]')
ylabel('Additional Loss [dB]')
title(strcat('Additional Loss'))
grid on;
legend
pause(0.1)
filename1=strcat('Additional_Loss_example.png');
saveas(gcf,char(filename1))















