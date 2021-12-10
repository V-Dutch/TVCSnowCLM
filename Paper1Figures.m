% New CLM Paper Figures Script - Makes all the figures (and accompanying stats) for Paper 1
%
% V. R. Dutch  - July 2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Import Data

cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\CLMOutputData\Baseline'
Run0_Hourly = readtimetable('Run0_S4_Hourly.csv');
Run0_Daily = readtimetable('Run0_S4_Daily.csv');

cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\CLMOutputData\Alpha=0.75(25%)'
STest25_Hourly = readtimetable('STest25_S4_Hourly.csv');
STest25_Daily = readtimetable('STest25_S4_Daily.csv');

cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\CLMOutputData\Alpha=0.7(30%)'
STest30_Hourly = readtimetable('STest30_S4_Hourly.csv');
STest30_Daily = readtimetable('STest30_S4_Daily.csv');

cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\CLMOutputData\Alpha=0.65(35%)'
STest35_Hourly = readtimetable('STest35_S4_Hourly.csv');
STest35_Daily = readtimetable('STest35_S4_Daily.csv');

cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\CLMOutputData\Alpha=0.6(40%)'
STest40_Hourly = readtimetable('STest40_S4_Hourly.csv');
STest40_Daily = readtimetable('STest40_S4_Daily.csv');

cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\CLMOutputData\Alpha=0.55(45%)'
STest45_Hourly = readtimetable('STest45_S4_Hourly.csv');
STest45_Daily = readtimetable('STest45_S4_Daily.csv');

cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\CLMOutputData\Alpha=0.5(50%)'
STest50_Hourly = readtimetable('STest50_S4_Hourly.csv');
STest50_Daily = readtimetable('STest50_S4_Daily.csv');

cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\CLMOutputData\Alpha=0.45(55%)'
STest55_Hourly = readtimetable('STest55_S4_Hourly.csv');
STest55_Daily = readtimetable('STest55_S4_Daily.csv');

cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\CLMOutputData\Alpha=0.4(60%)'
STest60_Hourly = readtimetable('STest60_S4_Hourly.csv');
STest60_Daily = readtimetable('STest60_S4_Daily.csv');

cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\CLMOutputData\Alpha=0.35(65%)'
STest65_Hourly = readtimetable('STest65_S4_Hourly.csv');
STest65_Daily = readtimetable('STest65_S4_Daily.csv');

cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\CLMOutputData\Alpha=0.3(70%)'
STest70_Hourly = readtimetable('STest70_S4_Hourly.csv');
STest70_Daily = readtimetable('STest70_S4_Daily.csv');

cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\CLMOutputData\Alpha=0.25(75%)'
STest75_Hourly = readtimetable('STest75_S4_Hourly.csv');
STest75_Daily = readtimetable('STest75_S4_Daily.csv');

cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\CLMOutputData\Alpha=0'
STest100_Hourly = readtimetable('STest100_S4_Hourly.csv');
STest100_Daily = readtimetable('STest100_S4_Daily.csv');

cd 'D:\PhD Work\Modelling\CLM\Output Data From CLM\Paper 1\GitRepo\Sturm\Sturm_NOALPHA'
Run0_Sturm_Hourly = readtimetable('Run0_Sturm_Hourly.csv');
Run0_Sturm_Daily = readtimetable('Run0_Sturm_Daily.csv');

cd 'D:\PhD Work\Modelling\CLM\Output Data From CLM\Paper 1\GitRepo\Sturm\Sturm_Alpha=0.3(70%)'
STest70_Sturm_Hourly = readtimetable('STest70_Sturm_Hourly.csv');
STest70_Sturm_Daily = readtimetable('STest70_Sturm_Daily.csv');

cd 'D:\PhD Work\Modelling\CLM\Output Data From CLM\Paper 1\GitRepo\Sturm\Sturm_Alpha=0.6(40%)'
STest40_Sturm_Hourly = readtimetable('STest40_Sturm_Hourly.csv');
STest40_Sturm_Daily = readtimetable('STest40_Sturm_Daily.csv');

% Want to plot 1st August 2017 - 31st Aug 2019
start_1719 = datetime(2017,08,01);
end_1719 = datetime(2019,08,31);
days_1719 = start_1719:end_1719;

x = [days_1719(1),days_1719(93),days_1719(185),days_1719(274),days_1719(366),days_1719(458),days_1719(550),days_1719(639),days_1719(731)]; % Aug, Nov, Feb, May 
x_minor = [days_1719(1),days_1719(32),days_1719(62),days_1719(93),days_1719(123),... %2017
    days_1719(154),days_1719(185),days_1719(213),days_1719(244),days_1719(274),days_1719(305),days_1719(335),days_1719(366),days_1719(397),days_1719(427),days_1719(458),days_1719(488),... %2018
    days_1719(519),days_1719(550),days_1719(578),days_1719(609),days_1719(639),days_1719(670),days_1719(700),days_1719(731),end_1719]; %2019

%% Fig 1.  - Meterological Charecterisation

% Daily Resolution
figure()
t = tiledlayout(6,1,'TileSpacing','none');

% Subplot 1 - Air Temp
nexttile
plot(Run0_Daily.Time,Run0_Daily.AirTemp_Obs,'k','LineWidth', 1.5)
hold on
yline(0,'k:')
hold off
xlim([start_1719 end_1719])
ylabel({'Air Temp'; '[^oC]'; ''})
text(1658, 20, '20','FontSize', 14) %y axis labels (bc. issues)
text(1665, 0, '0','FontSize', 14) %y axis labels (bc. issues)
text(1655, -20, '-20','FontSize', 14) %y axis labels (bc. issues)
% text(1655, -40, '-40','FontSize', 14) %y axis labels (bc. issues)
text(1676, -28, 'a)','FontSize', 14) %label
set(gca,'xticklabel',[])
h = gca;
h.XAxis.MinorTick = 'on';
h.XAxis.MinorTickValues = x_minor;
set(gca,'FontSize', 14)

% Subplot 2 - Precip.
nexttile
plot(Run0_Hourly.Time,Run0_Hourly.Snowfall_Obs,'Color','[0.4940 0.1840 0.5560]', 'LineWidth', 1.5);
hold on
plot(Run0_Hourly.Time,Run0_Hourly.Rainfall_Obs,'Color','[0.4660 0.6740 0.1880]', 'LineWidth', 1.5);
hold off
xlim([start_1719 end_1719])
ylabel({'Precip.'; '[mm s^{-1}]'; ''; ''});
text(1665, 0, '0','FontSize', 14) %y axis labels (bc. issues)
text(1640, 0.0005, '0.5^{10^{-3}}','FontSize', 14) %y axis labels (bc. issues)
text(1650, 0.001, '1^{10^{-3}}','FontSize', 14) %y axis labels (bc. issues)
text(1676, 0.0009, 'b)','FontSize', 14) %label
set(gca,'TickDir','out'); % puts tick marks on the outside
set(gca,'xticklabel',[])
h = gca;
h.XAxis.MinorTick = 'on';
h.XAxis.MinorTickValues = x_minor;
set(gca,'FontSize', 14)

% Subplot 3 - Snow Depth
nexttile
y = [0:0.25:0.75];
plot(Run0_Daily.Time,Run0_Daily.SnowDepth_MSC_obs,'k', 'LineWidth', 1.5)
xlim([start_1719 end_1719])
ylim([0 0.75])
ylabel({'Snow'; 'Depth [m]'; ''})
text(1665, 0, '0','FontSize', 14) %y axis labels (bc. issues)
text(1650, 0.25, '0.25','FontSize', 14) %y axis labels (bc. issues)
text(1655, 0.5, '0.5','FontSize', 14) %y axis labels (bc. issues)
% text(1650, 0.75, '0.75','FontSize', 14) %y axis labels (bc. issues)
text(1676, 0.65, 'c)','FontSize', 14) %label
set(gca,'TickDir','out'); % puts tick marks on the outside
set(gca,'xticklabel',[])
set(gca, 'ytick', y);
h = gca;
h.XAxis.MinorTick = 'on';
h.XAxis.MinorTickValues = x_minor;
set(gca,'FontSize', 14)
clear y

% Subplot 4 - Soil Temp
nexttile(4,[2 1])
plot(Run0_Daily.Time,Run0_Daily.SoilTemp_5cm_Obs, 'LineWidth', 1.5)
hold on
% plot(Run12_Daily.Time,Run12_Daily.SoilTemp_10cm_Obs)
plot(Run0_Daily.Time,Run0_Daily.SoilTemp_20cm_Obs, 'LineWidth', 1.5)
yline(0,'k:')
hold off
xlim([start_1719 end_1719])
ylim([-15 15])
ylabel({'Soil'; 'Temp'; '[^oC]'; ''});
% text(1658, 15, '15','FontSize', 14) %y axis labels (bc. issues) -
% commented out bc. overlap
text(1658, 10, '10','FontSize', 14) %y axis labels (bc. issues)
text(1665, 5, '5','FontSize', 14) %y axis labels (bc. issues)
text(1665, 0, '0','FontSize', 14) %y axis labels (bc. issues)
text(1660, -5, '-5','FontSize', 14) %y axis labels (bc. issues)
text(1655, -10, '-10','FontSize', 14) %y axis labels (bc. issues)
% text(1655, -15, '-15','FontSize', 14) %y axis labels (bc. issues)
text(1676, -12, 'd)','FontSize', 14) %label
set(gca,'TickDir','out'); % puts tick marks on the outside
set(gca,'xticklabel',[])
h = gca;
h.XAxis.MinorTick = 'on';
h.XAxis.MinorTickValues = x_minor;
set(gca,'FontSize', 14)

% Subplot 5 - Soil Moisture
nexttile
plot(Run0_Daily.Time,Run0_Daily.SoilMoisture_5cm_Obs, 'LineWidth', 1.5)
hold on
plot(Run0_Daily.Time,Run0_Daily.SoilMoisture_20cm_Obs, 'LineWidth', 1.5)
hold off
xlim([start_1719 end_1719])
% ylim([-15 15])
ylabel({'Soil H_2O'; '[m^3 m^{-3}]'; ''});
text(1665, 0, '0','FontSize', 14) %y axis labels (bc. issues)
text(1650, 0.25, '0.25','FontSize', 14) %y axis labels (bc. issues)
text(1655, 0.5, '0.5','FontSize', 14) %y axis labels (bc. issues) -
% commented out bc. overlap, how to deal with this?
text(1676, 0.1, 'e)','FontSize', 14) %label
set(gca,'TickDir','out'); % puts tick marks on the outside
h = gca;
h.XAxis.MinorTick = 'on';
h.XAxis.MinorTickValues = x_minor;
set(gca,'FontSize', 14)

set(t.Children,'XTick',x, 'YTick',[]); % if you remove this line, the spaces come back ... hence bodge above :(

%% Fig. 2. - Snowpack Charecterisation from Snowpits
cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\TVCSnowpits';
load 'TVC_Array_Paper1v3.mat';

M = horzcat(March2018_density_FS,March2018_density_WS,March2018_density_DH, ...
Nov2018_density_FS,Nov2018_density_WS,Nov2018_density_DH,...
Jan2019_density_FS,Jan2019_density_WS,Jan2019_density_DH,...
March2019_density_FS,March2019_density_WS,March2019_density_DH);  

figure()
boxplot(M, 'Labels', {'SS','WS','DH','SS', 'WS', 'DH', 'SS', 'WS', 'DH', 'SS', 'WS', 'DH'},'LabelOrientation', 'horizontal','Colors', 'k' ,'Symbol', 'bx','OutlierSize', 10)
lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
set(lines, 'Color', 'b');
ylim([0 500]);
xlim([0.5 12.5]);
% add text under labels to group campaigns?
text(1.5, -50,'March 2018','FontSize', 16) ;
text(4.65, -50,'Nov 2018','FontSize', 16) ;
text(7.65, -50,'Jan 2019','FontSize', 16) ;
text(10.5, -50,'March 2019','FontSize', 16) ;
% add vertical dashed lines to separate months
line([3.5 3.5], [0 500],'Color','k','Linestyle', '--')
line([6.5 6.5], [0 500],'Color','k','Linestyle', '--')
line([9.5 9.5], [0 500],'Color','k','Linestyle', '--')
% calculate n values for each boxplot
n_1 = (sum(~isnan(March2018_density_FS)));
n_2 = (sum(~isnan(March2018_density_WS)));
n_3 = (sum(~isnan(March2018_density_DH)));
n_4 = (sum(~isnan(Nov2018_density_FS)));
n_5 = (sum(~isnan(Nov2018_density_WS)));
n_6 = (sum(~isnan(Nov2018_density_DH)));
n_7 = (sum(~isnan(Jan2019_density_FS)));
n_8 = (sum(~isnan(Jan2019_density_WS)));
n_9 = (sum(~isnan(Jan2019_density_DH)));
n_10 = (sum(~isnan(March2019_density_FS)));
n_11 = (sum(~isnan(March2019_density_WS)));
n_12 = (sum(~isnan(March2019_density_DH)));
% add n values to plot
text(0.75, 475,sprintf('n = %d', n_1)) ;
text(1.75, 475,sprintf('n = %d', n_2)) ;
text(2.75, 475,sprintf('n = %d', n_3)) ;
text(3.75, 475,sprintf('n = %d', n_4)) ;
text(4.75, 475,sprintf('n = %d', n_5)) ;
text(5.75, 475,sprintf('n = %d', n_6)) ;
text(6.75, 475,sprintf('n = %d', n_7)) ;
text(7.75, 475,sprintf('n = %d', n_8)) ;
text(8.75, 475,sprintf('n = %d', n_9)) ;
text(9.75, 475,sprintf('n = %d', n_10)) ;
text(10.75, 475,sprintf('n = %d', n_11)) ;
text(11.75, 475,sprintf('n = %d', n_12)) ;
ylabel('Density [kg m^{-3}]'); 
set(gca,'FontSize', 16)

%% Fig. 3. - Snowpack Charecterisation from SMP
cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\TVCSnowpits';
load 'TVC_Array_Paper1v3.mat';
cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW';

%Median and IQ Range - Grey
y = NormalisedScale;
x_March2018 = rot90(MedianSMPdensity_March2018_Normalised);
q1_March2018 = rot90(Q1SMPdensity_March2018_Normalised);
q3_March2018 = rot90(Q3SMPdensity_March2018_Normalised);
x_Jan2019 = rot90(MedianSMPdensity_Jan2019_Normalised);
q1_Jan2019 = rot90(Q1SMPdensity_Jan2019_Normalised);
q3_Jan2019 = rot90(Q3SMPdensity_Jan2019_Normalised);
x_March2019 = rot90(MedianSMPdensity_March2019_Normalised);
q1_March2019 = rot90(Q1SMPdensity_March2019_Normalised);
q3_March2019 = rot90(Q3SMPdensity_March2019_Normalised);
edges = [0:2:120];

figure ()
% Subplot 1 - Histograms
subplot(2,2,1)
histogram(March2018_Depths,edges,'DisplayStyle','stairs','EdgeColor', [0 0.4470 0.7410]);
hold on
histogram(Jan2019_Depths,edges,'DisplayStyle','stairs','EdgeColor', [0.8500 0.3250 0.0980]);
hold on
histogram(March2019_Depths,edges,'DisplayStyle','stairs','EdgeColor',[0.4940 0.1840 0.5560]);
hold off
ylabel('Count')
xlabel('Snow Depth [cm]')
xlim([0 125])
ylim([0 1000])
legend({['March 2018' newline 'n = 11714'], ['Jan 2019' newline 'n = 6740'], ['March 2019' newline 'n = 8541']},'Location','Northeast')
legend boxoff
text(8,900, 'a)') %label
pbaspect ([1 1 1])

% Subplot 2 - March 2018 SMP
subplot(2,2,2)
shadedplot(y,q3_March2018,q1_March2018,[0.6 0.6 0.6],[0.6 0.6 0.6]);
hold on
plot (y, x_March2018, 'color', [0 0.4470 0.7410]);
text(115, 110, 'Density [kg m^{-3}]')
xlabel ({'Percentage Depth from the'; 'air:snow interface [%]'})
text(10, 25, {'b) March'; '2018'}) %label
text(95, 25, {'n = 411'}) %label
ylim ([0 400]);
pbaspect ([1 1 1])
camroll(-90)
set(gca,'yticklabel',[])
text(105, -10,'0') %label
text(105, 75, '100') %label
text(105, 175, '200') %label
text(105, 275, '300') %label
text(105, 375, '400') %label

% Subplot 3 - Jan 2019 SMP
subplot(2,2,3)
shadedplot(y,q3_Jan2019,q1_Jan2019,[0.6 0.6 0.6],[0.6 0.6 0.6]);
hold on
plot (y, x_Jan2019,'color', [0.8500 0.3250 0.0980]);
text(10, 25, {'c) Jan'; '2019'}) %label
text(95, 25, {'n = 423'}) %label
xlabel ({'Percentage Depth from the'; 'air:snow interface [%]'})
text(115, 110, 'Density [kg m^{-3}]')
ylim ([0 400]);
text(105, -10,'0') %label
text(105, 75, '100') %label
text(105, 175, '200') %label
text(105, 275, '300') %label
text(105, 375, '400') %label
pbaspect ([1 1 1])
camroll(-90)
set(gca,'yticklabel',[])

% Subplot 4 - March 2019 SMP
subplot(2,2,4)
shadedplot(y,q3_March2019,q1_March2019,[0.6 0.6 0.6],[0.6 0.6 0.6]);
hold on
plot (y, x_March2019,'color', [0.4940 0.1840 0.5560]);
text(115, 110, 'Density [kg m^{-3}]')
xlabel ({'Percentage Depth from the'; 'air:snow interface [%]'})
set(gca,'yticklabel',[])
text(105, -10,'0') %label
text(105, 75, '100') %label
text(105, 175, '200') %label
text(105, 275, '300') %label
text(105, 375, '400') %label
text(10, 25, {'d) March'; '2019'}) %label
text(95, 25, {'n = 217'}) %label
ylim ([0 400]);
pbaspect ([1 1 1])
camroll(-90)

% Snow symbols in panels b - d of figure were added in illustrator

%% Fig. 4 Plot - Keff SMP
cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\TVCSnowpits';
load 'TVC_Array_Paper1v3.mat';
cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW';

% Median and IQR
March18_c = rot90(MedianSMPK_eff_C_March2018_Normalised);
March18_q1c = rot90(Q1SMPK_eff_C_March2018_Normalised);
March18_q3c = rot90(Q3SMPK_eff_C_March2018_Normalised);
March18_s = rot90(MedianSMPK_eff_S_March2018_Normalised);
March18_q1s = rot90(Q1SMPK_eff_S_March2018_Normalised);
March18_q3s = rot90(Q3SMPK_eff_S_March2018_Normalised);
March18_j = rot90(MedianSMPK_eff_J_March2018_Normalised);
March18_q1j = rot90(Q1SMPK_eff_J_March2018_Normalised);
March18_q3j = rot90(Q3SMPK_eff_J_March2018_Normalised);

Jan19_c = rot90(MedianSMPK_eff_C_Jan2019_Normalised);
Jan19_q1c = rot90(Q1SMPK_eff_C_Jan2019_Normalised);
Jan19_q3c = rot90(Q3SMPK_eff_C_Jan2019_Normalised);
Jan19_s = rot90(MedianSMPK_eff_S_Jan2019_Normalised);
Jan19_q1s = rot90(Q1SMPK_eff_S_Jan2019_Normalised);
Jan19_q3s = rot90(Q3SMPK_eff_S_Jan2019_Normalised);
Jan19_j = rot90(MedianSMPK_eff_J_Jan2019_Normalised);
Jan19_q1j = rot90(Q1SMPK_eff_J_Jan2019_Normalised);
Jan19_q3j = rot90(Q3SMPK_eff_J_Jan2019_Normalised);

March19_c = rot90(MedianSMPK_eff_C_March2019_Normalised);
March19_q1c = rot90(Q1SMPK_eff_C_March2019_Normalised);
March19_q3c = rot90(Q3SMPK_eff_C_March2019_Normalised);
March19_s = rot90(MedianSMPK_eff_S_March2019_Normalised);
March19_q1s = rot90(Q1SMPK_eff_S_March2019_Normalised);
March19_q3s = rot90(Q3SMPK_eff_S_March2019_Normalised);
March19_j = rot90(MedianSMPK_eff_J_March2019_Normalised);
March19_q1j = rot90(Q1SMPK_eff_J_March2019_Normalised);
March19_q3j = rot90(Q3SMPK_eff_J_March2019_Normalised);

y = NormalisedScale;

figure()
tiledlayout(1,3,'TileSpacing','Compact');
nexttile % March 2018
% Calonne
shadedplot(y,March18_q3c,March18_q1c,[0.6 0.6 0.6],[0.6 0.6 0.6]);
alpha(0.4)
hold on
plot (y, March18_c, 'k');
hold on
% Sturm
shadedplot(y,March18_q3s,March18_q1s,[0 0.4470 0.7410],[0 0.4470 0.7410]);
alpha(0.4)
hold on
plot (y, March18_s, 'b');
% Jordan
shadedplot(y,March18_q3j,March18_q1j,[0.8980 0 0],[0.8980 0 0]);
alpha(0.4)
hold on
plot (y, March18_j, 'r');
camroll(-90)
hold off
pbaspect ([1 1 1])
xlabel ({'Percentage Depth from the'; 'air:snow interface [%]'})
text(105, -0.009,'0','FontSize', 16) %label
text(105, 0.085, '0.1','FontSize', 16) %label
text(105, 0.185, '0.2','FontSize', 16) %label
text(105, 0.285, '0.3','FontSize', 16) %label
text(105, 0.385, '0.4','FontSize', 16) %label
text(105, 0.485, '0.5','FontSize', 16) %label
set(gca,'yticklabel',[])
ylim ([0 0.5]);
text(8, 0.02, {'a) March'; '2018'},'FontSize', 14) %label
text(95, 0.41, 'n = 411','FontSize', 14) %label
set(gca,'FontSize', 16)

nexttile % Jan 2019
% Calonne
shadedplot(y,Jan19_q3c,Jan19_q1c,[0.6 0.6 0.6],[0.6 0.6 0.6]);
alpha(0.4)
hold on
plot (y, Jan19_c, 'k');
hold on
% Sturm
shadedplot(y,Jan19_q3s,Jan19_q1s,[0 0.4470 0.7410],[0 0.4470 0.7410]);
alpha(0.4)
hold on
plot (y, Jan19_s, 'b');
% Jordan
shadedplot(y,Jan19_q3j,Jan19_q1j,[0.8980 0 0],[0.8980 0 0]);
alpha(0.4)
hold on
plot (y, Jan19_j, 'r');
camroll(-90)
hold off
text(8, 0.02, {'b) Jan'; '2019'},'FontSize', 14) %label
text(95, 0.41, 'n = 423','FontSize', 14) %label
pbaspect ([1 1 1])
title ('Snow Thermal Conductivity [W m^{-1} K^{-1}]','FontWeight', 'normal') % thinks it's a title, but is acting as an xaxis label
set(get(gca,'title'),'Position',[120 0.25 1.00011]) %sets location of title to that position on the axis
text(105, -0.009,'0','FontSize', 16) %label
text(105, 0.085, '0.1','FontSize', 16) %label
text(105, 0.185, '0.2','FontSize', 16) %label
text(105, 0.285, '0.3','FontSize', 16) %label
text(105, 0.385, '0.4','FontSize', 16) %label
text(105, 0.485, '0.5','FontSize', 16) %label
set(gca,'yticklabel',[])
% legend('','Calonne - IQR', 'Calonne - Q1','Calonne - Q3','Calonne - Median','', 'Sturm - IQR', 'Sturm - Q1','Sturm - Q3','Sturm - Median','Location', 'SouthOutside','numcolumns', 2)
ylim ([0 0.5]);
set(gca,'FontSize', 16)

nexttile % March 2019
hleg = legend('show');
hold on
plot (y, March19_c, 'k');
plot (y, March19_s, 'b');
plot (y, March19_j, 'r');
legend('Calonne','Sturm','Jordan','Location', 'east','FontSize',14)
legend boxoff
% Calonne
shadedplot(y,March19_q3c,March19_q1c,[0.6 0.6 0.6],[0.6 0.6 0.6]);
alpha(0.4)
hold on
% Sturm
shadedplot(y,March19_q3s,March19_q1s,[0 0.4470 0.7410],[0 0.4470 0.7410]);
alpha(0.4)
hold on
% Jordan
shadedplot(y,March19_q3j,March19_q1j,[0.8980 0 0],[0.8980 0 0]);
alpha(0.4)
hold on
hleg.String(4:end) = []; % deletes all but first 3 legend entries
camroll(-90)
hold off
box on
ylim ([0 0.5]);
text(8, 0.02, {'c) March'; '2019'},'FontSize', 14) %label
text(95, 0.41, 'n = 217','FontSize', 14) %label
text(105, -0.009,'0','FontSize', 16) %label
text(105, 0.085, '0.1','FontSize', 16) %label
text(105, 0.185, '0.2','FontSize', 16) %label
text(105, 0.285, '0.3','FontSize', 16) %label
text(105, 0.385, '0.4','FontSize', 16) %label
text(105, 0.485, '0.5','FontSize', 16) %label
set(gca,'yticklabel',[])
pbaspect ([1 1 1])
set(gca,'FontSize', 16)

%% Fig. 4 Stats - Keff SMP
% statistical similarity (ANOVA)
SMPKeff4ANOVA_March18 = vertcat(March18_s,March18_c,March18_j);
SMPKeff4ANOVA_March18 = rot90(SMPKeff4ANOVA_March18);
[p_SMPANOVA_March18,tbl_SMPANOVA_March18,stats_SMPANOVA_March18] = anova1(SMPKeff4ANOVA_March18);
multcompare(stats_SMPANOVA_March18,'Alpha',0.001)

SMPKeff4ANOVA_Jan19 = vertcat(Jan19_s,Jan19_c,Jan19_j);
SMPKeff4ANOVA_Jan19 = rot90(SMPKeff4ANOVA_Jan19);
[p_SMPANOVA_Jan19,tbl_SMPANOVA_Jan19,stats_SMPANOVA_Jan19] = anova1(SMPKeff4ANOVA_Jan19);
multcompare(stats_SMPANOVA_Jan19,'Alpha',0.001)

SMPKeff4ANOVA_March19 = vertcat(March19_s,March19_c,March19_j);
SMPKeff4ANOVA_March19 = rot90(SMPKeff4ANOVA_March19);
[p_SMPANOVA_March19,tbl_SMPANOVA_March19,stats_SMPANOVA_March19] = anova1(SMPKeff4ANOVA_March19);
multcompare(stats_SMPANOVA_March19,'Alpha',0.001)

%% Fig 5. Plot - CLM Snow Layer Properties 
clear x
clear x_minor

x = [days_1719(1),days_1719(93),days_1719(185),days_1719(274),days_1719(366),days_1719(458),days_1719(550),days_1719(639),days_1719(731)]; % Aug, Nov, Feb, May 
x_minor = [days_1719(1),days_1719(32),days_1719(62),days_1719(93),days_1719(123),... %2017
    days_1719(154),days_1719(185),days_1719(213),days_1719(244),days_1719(274),days_1719(305),days_1719(335),days_1719(366),days_1719(427),days_1719(458),days_1719(488),... %2018
    days_1719(519),days_1719(550),days_1719(578),days_1719(609),days_1719(639),days_1719(670),days_1719(700),days_1719(731),end_1719]; %2019

figure()
winter_1718 = days_1719(46:304); % 15th Sept - 31st May
winter_1819 = days_1719(411:669);
SnowLayerThickness_1718 = Run0_Daily{1719:1977,24:27};
SnowLayerThickness_1718 = fliplr(SnowLayerThickness_1718);
SnowLayerThickness_1819 = Run0_Daily{2084:2342,24:27};
SnowLayerThickness_1819 = fliplr(SnowLayerThickness_1819);

tiledlayout(3,2,'TileSpacing','Compact');

% Row 1 - Snowpack layers
nexttile
flippedcolors = [0 0.4470 0.7410; 0 0.2235 0.3705;0.6 0.6 0.6; 0 0 0;]; %flip colour order so it matches up with the other snow layer plots
area(winter_1718, SnowLayerThickness_1718);
set(gca, 'ColorOrder',flippedcolors, 'NextPlot','ReplaceChildren')
ylim([0 0.4])
ylabel({'Depth'; '[m]'}) % label on right
set(gca,'TickDir','out'); % puts tick marks on the outside
text(20, 0.35, 'a)','FontSize', 14) %label
set(gca, 'xtick', x);
set(gca,'xticklabel',[])
h = gca;
h.XAxis.MinorTick = 'on';
h.XAxis.MinorTickValues = x_minor;
set(gca,'FontSize', 16)
box off

nexttile
area(winter_1819, SnowLayerThickness_1819);
set(gca, 'ColorOrder',flippedcolors, 'NextPlot','ReplaceChildren')
ylim([0 0.4])
set(gca,'TickDir','out'); % puts tick marks on the outside
text(-8, 0.35, 'd)','FontSize', 14) %label
set(gca, 'xtick', x);
set(gca,'xticklabel',[])
h = gca;
h.XAxis.MinorTick = 'on';
h.XAxis.MinorTickValues = x_minor;
set(gca,'FontSize', 16)
box off

% Row 2 - Snow Layer Densities
y = [0:250:500];
nexttile
hold on
plot(winter_1718,Run0_Daily.SnowLayerDensities_1(1719:1977),'k','LineWidth',1.5)
plot(winter_1718,Run0_Daily.SnowLayerDensities_2(1719:1977),'Color',[0.6 0.6 0.6],'LineWidth',1.5)
plot(winter_1718,Run0_Daily.SnowLayerDensities_3(1719:1977),'Color',[0 0.2235 0.3705],'LineWidth',1.5)
plot(winter_1718,Run0_Daily.SnowLayerDensities_4(1719:1977),'Color',[0 0.4470 0.7410],'LineWidth',1.5)
hold off
ylabel({'\rho'; '[kg m^{-3}]'}) %label on left
ylim([0 500]) 
text(20, 450, 'b)','FontSize', 14) %label
set(gca,'TickDir','out'); % puts tick marks on the outside
set(gca, 'xtick', x);
set(gca, 'ytick', y);
set(gca,'xticklabel',[])
h = gca;
h.XAxis.MinorTick = 'on';
h.XAxis.MinorTickValues = x_minor;
set(gca,'FontSize', 16)

nexttile
hold on
plot(winter_1819,Run0_Daily.SnowLayerDensities_1(2084:2342),'k','LineWidth',1.5)
plot(winter_1819,Run0_Daily.SnowLayerDensities_2(2084:2342),'Color',[0.6 0.6 0.6],'LineWidth',1.5)
plot(winter_1819,Run0_Daily.SnowLayerDensities_3(2084:2342),'Color',[0 0.2235 0.3705],'LineWidth',1.5)
plot(winter_1819,Run0_Daily.SnowLayerDensities_4(2084:2342),'Color',[0 0.4470 0.7410],'LineWidth',1.5)
hold off
ylim([0 500])
text(-8, 450, 'e)','FontSize', 14) %label
set(gca,'TickDir','out'); % puts tick marks on the outside
set(gca, 'xtick', x);
set(gca, 'ytick', y);
set(gca,'xticklabel',[])
h = gca;
h.XAxis.MinorTick = 'on';
h.XAxis.MinorTickValues = x_minor;
set(gca,'FontSize', 16)
clear y

% Row 3 - Snow Layer Thermal Conductivities
y = [0:0.2:1];
nexttile
hold on
plot(winter_1718,Run0_Daily.SnowThermalConductivities_1(1719:1977),'k','LineWidth',1.5)
plot(winter_1718,Run0_Daily.SnowThermalConductivities_2(1719:1977),'Color',[0.6 0.6 0.6],'LineWidth',1.5)
plot(winter_1718,Run0_Daily.SnowThermalConductivities_3(1719:1977),'Color',[0 0.2235 0.3705],'LineWidth',1.5)
plot(winter_1718,Run0_Daily.SnowThermalConductivities_4(1719:1977),'Color',[0 0.4470 0.7410],'LineWidth',1.5)
hold off
ylim([0 0.6])
ylabel({'K_{eff}'; '[W m^{-1} K^{-1}]'})
text(5, 0.55, 'c)','FontSize', 14) %label
set(gca,'TickDir','out'); % puts tick marks on the outside
xlim([winter_1718(1) winter_1718(259)])
set(gca, 'xtick', x);
set(gca, 'ytick', y);
h = gca;
h.XAxis.MinorTick = 'on';
h.XAxis.MinorTickValues = x_minor;
set(gca,'FontSize', 16)

nexttile
hold on
plot(winter_1819,Run0_Daily.SnowThermalConductivities_1(2084:2342),'k','LineWidth',1.5)
plot(winter_1819,Run0_Daily.SnowThermalConductivities_2(2084:2342),'Color',[0.6 0.6 0.6],'LineWidth',1.5)
plot(winter_1819,Run0_Daily.SnowThermalConductivities_3(2084:2342),'Color',[0 0.2235 0.3705],'LineWidth',1.5)
plot(winter_1819,Run0_Daily.SnowThermalConductivities_4(2084:2342),'Color',[0 0.4470 0.7410],'LineWidth',1.5)
hold off
ylim([0 0.6])
text(5, 0.55, 'f)','FontSize', 14) %label
set(gca,'TickDir','out'); % puts tick marks on the outside
xlim([winter_1819(1) winter_1819(259)])
set(gca, 'xtick', x);
set(gca, 'ytick', y);
h = gca;
h.XAxis.MinorTick = 'on';
h.XAxis.MinorTickValues = x_minor;
set(gca,'FontSize', 16)
clear y

%% Fig 5. Stats - CLM Snow Layer Properties 
% Statistical similarity

% layer densities
layer1density_1718 = Run0_Daily.SnowLayerDensities_1(1719:1977);
layer2density_1718 = Run0_Daily.SnowLayerDensities_2(1719:1977);
layer3density_1718 = Run0_Daily.SnowLayerDensities_3(1719:1977);
layer4density_1718 = Run0_Daily.SnowLayerDensities_4(1719:1977);

layer1density_1819 = Run0_Daily.SnowLayerDensities_1(2084:2342);
layer2density_1819 = Run0_Daily.SnowLayerDensities_2(2084:2342);
layer3density_1819 = Run0_Daily.SnowLayerDensities_3(2084:2342);
layer4density_1819 = Run0_Daily.SnowLayerDensities_4(2084:2342);

layer1densities = vertcat(layer1density_1718,layer1density_1819); 
layer2densities = vertcat(layer2density_1718,layer2density_1819);
layer3densities = vertcat(layer3density_1718,layer3density_1819);
layer4densities = vertcat(layer4density_1718,layer4density_1819);

meanlayer1density = nanmean(layer1densities);
meanlayer2density = nanmean(layer2densities);
meanlayer3density = nanmean(layer3densities);
meanlayer4density = nanmean(layer4densities);

medianlayer1density = nanmedian(layer1densities);
medianlayer2density = nanmedian(layer2densities);
medianlayer3density = nanmedian(layer3densities);
medianlayer4density = nanmedian(layer4densities);

stddevlayer1density = nanstd(layer1densities);
stddevlayer2density = nanstd(layer2densities);
stddevlayer3density = nanstd(layer3densities);
stddevlayer4density = nanstd(layer4densities);

Q1layer1density = quantile(layer1densities, 0.25);
Q1layer2density = quantile(layer2densities, 0.25);
Q1layer3density = quantile(layer3densities, 0.25);
Q1layer4density = quantile(layer4densities, 0.25);

Q3layer1density = quantile(layer1densities, 0.75);
Q3layer2density = quantile(layer2densities, 0.75);
Q3layer3density = quantile(layer3densities, 0.75);
Q3layer4density = quantile(layer4densities, 0.75);

SnowLayerDensities_1718 = horzcat(Run0_Daily.SnowLayerDensities_1(1719:1977), Run0_Daily.SnowLayerDensities_2(1719:1977),Run0_Daily.SnowLayerDensities_3(1719:1977),Run0_Daily.SnowLayerDensities_4(1719:1977));
SnowLayerDensities_1718 = reshape(SnowLayerDensities_1718,[], 1);
MedianDensity_1718 = nanmedian(SnowLayerDensities_1718);

SnowLayerDensities_1819 = horzcat(Run0_Daily.SnowLayerDensities_1(2084:2342),Run0_Daily.SnowLayerDensities_2(2084:2342),Run0_Daily.SnowLayerDensities_3(2084:2342),Run0_Daily.SnowLayerDensities_4(2084:2342));
SnowLayerDensities_1819 = reshape(SnowLayerDensities_1819,[], 1);
MedianDensity_1819 = nanmedian(SnowLayerDensities_1819);

[h_interannualdensity,p_interannualdensity,ci_interannualdensity,stats_interannualdensity] = ttest(SnowLayerDensities_1718,SnowLayerDensities_1819, 'Alpha', 0.001); 

LayerDensities4ANOVA = horzcat(Run0_Daily.SnowLayerDensities_1,Run0_Daily.SnowLayerDensities_2,Run0_Daily.SnowLayerDensities_3,Run0_Daily.SnowLayerDensities_4);
[p_layerdensity,tbl_layerdensity,stats_layerdensity] = anova1(LayerDensities4ANOVA);
multcompare(stats,'Alpha',0.001)

LayerDensities4ANOVA = reshape(LayerDensities4ANOVA,[],1);
bulkmeandensity = nanmean(LayerDensities4ANOVA);
bulkmediandensity = nanmedian(LayerDensities4ANOVA);

cv_layer1density = stddevlayer1density/meanlayer1density;
cv_layer2density = stddevlayer2density/meanlayer2density;
cv_layer3density = stddevlayer3density/meanlayer3density;
cv_layer4density = stddevlayer4density/meanlayer4density;

cv_Bulkdensity = (nanstd(LayerDensities4ANOVA))/(nanmean(LayerDensities4ANOVA));

% thermal conductivities
layer1keff_1718 = Run0_Daily.SnowThermalConductivities_1(1719:1977);
layer2keff_1718 = Run0_Daily.SnowThermalConductivities_2(1719:1977);
layer3keff_1718 = Run0_Daily.SnowThermalConductivities_3(1719:1977);
layer4keff_1718 = Run0_Daily.SnowThermalConductivities_4(1719:1977);

layer1keff_1819 = Run0_Daily.SnowThermalConductivities_1(2084:2342);
layer2keff_1819 = Run0_Daily.SnowThermalConductivities_2(2084:2342);
layer3keff_1819 = Run0_Daily.SnowThermalConductivities_3(2084:2342);
layer4keff_1819 = Run0_Daily.SnowThermalConductivities_4(2084:2342);

layer1keffs = vertcat(layer1keff_1718,layer1keff_1819); 
layer2keffs = vertcat(layer2keff_1718,layer2keff_1819);
layer3keffs = vertcat(layer3keff_1718,layer3keff_1819);
layer4keffs = vertcat(layer4keff_1718,layer4keff_1819);

meanlayer1keff = nanmean(layer1keffs);
meanlayer2keff = nanmean(layer2keffs);
meanlayer3keff = nanmean(layer3keffs);
meanlayer4keff = nanmean(layer4keffs);

medianlayer1keff = nanmedian(layer1keffs);
medianlayer2keff = nanmedian(layer2keffs);
medianlayer3keff = nanmedian(layer3keffs);
medianlayer4keff = nanmedian(layer4keffs);

stddevlayer1keff = nanstd(layer1keffs);
stddevlayer2keff = nanstd(layer2keffs);
stddevlayer3keff = nanstd(layer3keffs);
stddevlayer4keff = nanstd(layer4keffs);

Q1layer1keff = quantile(layer1keffs, 0.25);
Q1layer2keff = quantile(layer2keffs, 0.25);
Q1layer3keff = quantile(layer3keffs, 0.25);
Q1layer4keff = quantile(layer4keffs, 0.25);

Q3layer1keff = quantile(layer1keffs, 0.75);
Q3layer2keff = quantile(layer2keffs, 0.75);
Q3layer3keff = quantile(layer3keffs, 0.75);
Q3layer4keff = quantile(layer4keffs, 0.75);

SnowLayerKeff_1718 = horzcat(Run0_Daily.SnowThermalConductivities_1(1719:1977), Run0_Daily.SnowThermalConductivities_2(1719:1977),Run0_Daily.SnowThermalConductivities_3(1719:1977),Run0_Daily.SnowThermalConductivities_4(1719:1977));
SnowLayerKeff_1718 = reshape(SnowLayerKeff_1718,[], 1);
MedianKeff_1718 = nanmedian(SnowLayerKeff_1718);

SnowLayerKeff_1819 = horzcat(Run0_Daily.SnowThermalConductivities_1(2084:2342),Run0_Daily.SnowThermalConductivities_2(2084:2342),Run0_Daily.SnowThermalConductivities_3(2084:2342),Run0_Daily.SnowThermalConductivities_4(2084:2342));
SnowLayerKeff_1819 = reshape(SnowLayerKeff_1819,[], 1);
MedianKeff_1819 = nanmedian(SnowLayerKeff_1819);

[h_interannualKeff,p_interannualKeff,ci_interannualKeff,stats_interannualKeff] = ttest(SnowLayerKeff_1718,SnowLayerKeff_1819, 'Alpha', 0.001);

LayerKeff4ANOVA = horzcat(Run0_Daily.SnowThermalConductivities_1,Run0_Daily.SnowThermalConductivities_2,Run0_Daily.SnowThermalConductivities_3,Run0_Daily.SnowThermalConductivities_4);
[p_layerkeff,tbl_layerkeff,stats_layerkeff] = anova1(LayerKeff4ANOVA);
multcompare(stats,'Alpha',0.001)

LayerKeff4ANOVA = reshape(LayerKeff4ANOVA,[],1);
bulkmeanKeff = nanmean(LayerKeff4ANOVA);
bulkmedianKeff = nanmedian(LayerKeff4ANOVA);

% cv = std dev / mean
cv_layer1keff = stddevlayer1Keff/meanlayer1Keff;
cv_layer2keff = stddevlayer2Keff/meanlayer2Keff;
cv_layer3keff = stddevlayer3Keff/meanlayer3Keff;
cv_layer4keff = stddevlayer4Keff/meanlayer4Keff;

cv_BulkKeff = (nanstd(LayerKeff4ANOVA))/(nanmean(LayerKeff4ANOVA));

%% Fig. 6 - Keff Distributions
cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\TVCSnowpits';
load 'TVC_Array_Paper1v3.mat';
cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW';

% March 2018 - Needlprobe% March 2018 - Needlprobe
k_eff_2018 = [];
layer_2018 = [];

for pit = 1
    pitname = (Pitnames_March2018(pit));
    b = TVC.March_2018.(pitname).thermal_conductivity.K_eff;
    f = TVC.March_2018.(pitname).thermal_conductivity.layer;
    k_eff_2018 = vertcat(k_eff_2018,b);
    layer_2018 = vertcat(layer_2018,f);
end
for pit = 4:6
    pitname = (Pitnames_March2018(pit));
    b = TVC.March_2018.(pitname).thermal_conductivity.K_eff;
    f = TVC.March_2018.(pitname).thermal_conductivity.layer;
    k_eff_2018 = vertcat(k_eff_2018,b);
    layer_2018 = vertcat(layer_2018,f);
end
for pit = 9
    pitname = (Pitnames_March2018(pit));
    b = TVC.March_2018.(pitname).thermal_conductivity.K_eff;
    f = TVC.March_2018.(pitname).thermal_conductivity.layer;
    k_eff_2018 = vertcat(k_eff_2018,b);
    layer_2018 = vertcat(layer_2018,f);
end
for pit = 12
    pitname = (Pitnames_March2018(pit));
    b = TVC.March_2018.(pitname).thermal_conductivity.K_eff;
    f = TVC.March_2018.(pitname).thermal_conductivity.layer;
    k_eff_2018 = vertcat(k_eff_2018,b);
    layer_2018 = vertcat(layer_2018,f);
end
for pit = 15
    pitname = (Pitnames_March2018(pit));
    b = TVC.March_2018.(pitname).thermal_conductivity.K_eff;
    f = TVC.March_2018.(pitname).thermal_conductivity.layer;
    k_eff_2018 = vertcat(k_eff_2018,b);
    layer_2018 = vertcat(layer_2018,f);
end
for pit = 18
    pitname = (Pitnames_March2018(pit));
    b = TVC.March_2018.(pitname).thermal_conductivity.K_eff;
    f = TVC.March_2018.(pitname).thermal_conductivity.layer;
    k_eff_2018 = vertcat(k_eff_2018,b);
    layer_2018 = vertcat(layer_2018,f);
end
for pit = 20:22
    pitname = (Pitnames_March2018(pit));
    b = TVC.March_2018.(pitname).thermal_conductivity.K_eff;
    f = TVC.March_2018.(pitname).thermal_conductivity.layer;
    k_eff_2018 = vertcat(k_eff_2018,b);
    layer_2018 = vertcat(layer_2018,f);
end

clear f
clear b

ThermCond_Table_2018 = table(k_eff_2018,layer_2018);
ThermCond_Table_2018 = sortrows(ThermCond_Table_2018,'layer_2018','descend');

% March 2018 - SMP
March2018_Keff_S = [];
March2018_Keff_C = [];
March2018_Keff_J = [];

for pit = 1:5
    pitname = (Pitnames_March2018(pit));
    a = [];
    f = [];
    h = [];
    n = (numel(fieldnames(TVC.March_2018.(pitname).SMP.CroppedProfiles)));
    n = n-1; % because summary of cropped profiles has already been added at this point
for smp = 1:n
    fields = fieldnames(TVC.March_2018.(pitname).SMP.CroppedProfiles);
    fnm = sprintf(fields{smp});
    a = vertcat(a,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_C);
    f = vertcat(f,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_S);
    h = vertcat(h,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_J);
    end
March2018_Keff_S = vertcat(March2018_Keff_S, f);
March2018_Keff_C = vertcat(March2018_Keff_C, a);
March2018_Keff_J = vertcat(March2018_Keff_J, h);
clear a f h n
end

for pit = 7:8
    pitname = (Pitnames_March2018(pit));
    a = [];
    f = [];
    h = [];
    n = (numel(fieldnames(TVC.March_2018.(pitname).SMP.CroppedProfiles)));
    n = n-1; % because summary of cropped profiles has already been added at this point
for smp = 1:n
    fields = fieldnames(TVC.March_2018.(pitname).SMP.CroppedProfiles);
    fnm = sprintf(fields{smp});
    a = vertcat(a,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_C);
    f = vertcat(f,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_S);
    h = vertcat(h,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_J);
    end
March2018_Keff_S = vertcat(March2018_Keff_S, f);
March2018_Keff_C = vertcat(March2018_Keff_C, a);
March2018_Keff_J = vertcat(March2018_Keff_J, h);
clear a f h n
end

for pit = 11:12
    pitname = (Pitnames_March2018(pit));
    a = [];
    f = [];
    h = [];
    n = (numel(fieldnames(TVC.March_2018.(pitname).SMP.CroppedProfiles)));
    n = n-1; % because summary of cropped profiles has already been added at this point
for smp = 1:n
    fields = fieldnames(TVC.March_2018.(pitname).SMP.CroppedProfiles);
    fnm = sprintf(fields{smp});
    a = vertcat(a,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_C);
    f = vertcat(f,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_S);
    h = vertcat(h,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_J);
    end
March2018_Keff_S = vertcat(March2018_Keff_S, f);
March2018_Keff_C = vertcat(March2018_Keff_C, a);
March2018_Keff_J = vertcat(March2018_Keff_J, h);
clear a f h n
end

for pit = 23:24
    pitname = (Pitnames_March2018(pit));
    a = [];
    f = [];
    h = [];
    n = (numel(fieldnames(TVC.March_2018.(pitname).SMP.CroppedProfiles)));
    n = n-1; % because summary of cropped profiles has already been added at this point
for smp = 1:n
    fields = fieldnames(TVC.March_2018.(pitname).SMP.CroppedProfiles);
    fnm = sprintf(fields{smp});
    a = vertcat(a,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_C);
    f = vertcat(f,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_S);
    h = vertcat(h,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_J);
    end
March2018_Keff_S = vertcat(March2018_Keff_S, f);
March2018_Keff_C = vertcat(March2018_Keff_C, a);
March2018_Keff_J = vertcat(March2018_Keff_J, h);
clear a f h n
end

for pit = 26
    pitname = (Pitnames_March2018(pit));
    a = [];
    f = [];
    h = [];
    n = (numel(fieldnames(TVC.March_2018.(pitname).SMP.CroppedProfiles)));
    n = n-1; % because summary of cropped profiles has already been added at this point
for smp = 1:n
    fields = fieldnames(TVC.March_2018.(pitname).SMP.CroppedProfiles);
    fnm = sprintf(fields{smp});
    a = vertcat(a,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_C);
    f = vertcat(f,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_S);
    h = vertcat(h,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_J);
    end
March2018_Keff_S = vertcat(March2018_Keff_S, f);
March2018_Keff_C = vertcat(March2018_Keff_C, a);
March2018_Keff_J = vertcat(March2018_Keff_J, h);
clear a f h n
end

for pit = 30:35    
    pitname = (Pitnames_March2018(pit));
    a = [];
    f = [];
    h = [];
    n = (numel(fieldnames(TVC.March_2018.(pitname).SMP.CroppedProfiles)));
    n = n-1; % because summary of cropped profiles has already been added at this point
for smp = 1:n
    fields = fieldnames(TVC.March_2018.(pitname).SMP.CroppedProfiles);
    fnm = sprintf(fields{smp});
    a = vertcat(a,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_C);
    f = vertcat(f,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_S);
    h = vertcat(h,TVC.March_2018.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_J);
    end
March2018_Keff_S = vertcat(March2018_Keff_S, f);
March2018_Keff_C = vertcat(March2018_Keff_C, a);
March2018_Keff_J = vertcat(March2018_Keff_J, h);
clear a f h n
end

% March 2019 - Needleprobe
k_eff_2019 = [];
layer_2019 = [];

for pit = 1:9
    pitname = (Pitnames_March2019(pit));
    b = TVC.March_2019.(pitname).thermal_conductivity.K_eff;
    f = TVC.March_2019.(pitname).thermal_conductivity.layer;
    k_eff_2019 = vertcat(k_eff_2019,b);
    layer_2019 = vertcat(layer_2019,f);
end
for pit = 12:19
    pitname = (Pitnames_March2019(pit));
    b = TVC.March_2019.(pitname).thermal_conductivity.K_eff;
    f = TVC.March_2019.(pitname).thermal_conductivity.layer;
    k_eff_2019 = vertcat(k_eff_2019,b);
    layer_2019 = vertcat(layer_2019,f);
end
for pit = 21
    pitname = (Pitnames_March2019(pit));
    b = TVC.March_2019.(pitname).thermal_conductivity.K_eff;
    f = TVC.March_2019.(pitname).thermal_conductivity.layer;
    k_eff_2019 = vertcat(k_eff_2019,b);
    layer_2019 = vertcat(layer_2019,f);
end
for pit = 23
    pitname = (Pitnames_March2019(pit));
    b = TVC.March_2019.(pitname).thermal_conductivity.K_eff;
    f = TVC.March_2019.(pitname).thermal_conductivity.layer;
    k_eff_2019 = vertcat(k_eff_2019,b);
    layer_2019 = vertcat(layer_2019,f);
end
for pit = 26:32
    pitname = (Pitnames_March2019(pit));
    b = TVC.March_2019.(pitname).thermal_conductivity.K_eff;
    f = TVC.March_2019.(pitname).thermal_conductivity.layer;
    k_eff_2019 = vertcat(k_eff_2019,b);
    layer_2019 = vertcat(layer_2019,f);
end
clear f
clear b

ThermCond_Table_2019 = table(k_eff_2019,layer_2019);
ThermCond_Table_2019 = sortrows(ThermCond_Table_2019,'layer_2019','descend');

% March 2019 - SMP
March2019_Keff_S = [];
March2019_Keff_C = [];
March2019_Keff_J = [];

for pit = 1:2
    pitname = (Pitnames_March2019(pit));
    a = [];
    f = [];
    h = [];
    n = (numel(fieldnames(TVC.March_2019.(pitname).SMP.CroppedProfiles)));
    n = n-1; % because summary of cropped profiles has already been added at this point
for smp = 1:n
    fields = fieldnames(TVC.March_2019.(pitname).SMP.CroppedProfiles);
    fnm = sprintf(fields{smp});
    a = vertcat(a,TVC.March_2019.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_C);
    f = vertcat(f,TVC.March_2019.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_S);
    h = vertcat(h,TVC.March_2019.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_J);
    end
March2019_Keff_S = vertcat(March2019_Keff_S, f);
March2019_Keff_C = vertcat(March2019_Keff_C, a);
March2019_Keff_J = vertcat(March2019_Keff_J, h);
clear a f h n
end

for pit = 4:8
    pitname = (Pitnames_March2019(pit));
    a = [];
    f = [];
    h = [];
    n = (numel(fieldnames(TVC.March_2019.(pitname).SMP.CroppedProfiles)));
    n = n-1; % because summary of cropped profiles has already been added at this point
for smp = 1:n
    fields = fieldnames(TVC.March_2019.(pitname).SMP.CroppedProfiles);
    fnm = sprintf(fields{smp});
    a = vertcat(a,TVC.March_2019.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_C);
    f = vertcat(f,TVC.March_2019.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_S);
    h = vertcat(h,TVC.March_2019.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_J);
    end
March2019_Keff_S = vertcat(March2019_Keff_S, f);
March2019_Keff_C = vertcat(March2019_Keff_C, a);
March2019_Keff_J = vertcat(March2019_Keff_J, h);
clear a f h n
end

for pit = 23
    pitname = (Pitnames_March2019(pit));
    a = [];
    f = [];
    h = [];
    n = (numel(fieldnames(TVC.March_2019.(pitname).SMP.CroppedProfiles)));
    n = n-1; % because summary of cropped profiles has already been added at this point
for smp = 1:n
    fields = fieldnames(TVC.March_2019.(pitname).SMP.CroppedProfiles);
    fnm = sprintf(fields{smp});
    a = vertcat(a,TVC.March_2019.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_C);
    f = vertcat(f,TVC.March_2019.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_S);
    h = vertcat(h,TVC.March_2019.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_J);
    end
March2019_Keff_S = vertcat(March2019_Keff_S, f);
March2019_Keff_C = vertcat(March2019_Keff_C, a);
March2019_Keff_J = vertcat(March2019_Keff_J, h);
clear a f h n
end

for pit = 26:32
    pitname = (Pitnames_March2019(pit));
    a = [];
    f = [];
    h = [];
    n = (numel(fieldnames(TVC.March_2019.(pitname).SMP.CroppedProfiles)));
    n = n-1; % because summary of cropped profiles has already been added at this point
for smp = 1:n
    fields = fieldnames(TVC.March_2019.(pitname).SMP.CroppedProfiles);
    fnm = sprintf(fields{smp});
    a = vertcat(a,TVC.March_2019.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_C);
    f = vertcat(f,TVC.March_2019.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_S);
    h = vertcat(h,TVC.March_2019.(pitname).SMP.NormalisedProfiles.(fnm).RescaledK_eff_J);
    end
March2019_Keff_S = vertcat(March2019_Keff_S, f);
March2019_Keff_C = vertcat(March2019_Keff_C, a);
March2019_Keff_J = vertcat(March2019_Keff_J, h);
clear a f h n
end

% Pooled Histogram
k_eff_pooled = vertcat(k_eff_2018,k_eff_2019);
SMP_Keff_S = vertcat(March2018_Keff_S,March2019_Keff_S);
SMP_Keff_C = vertcat(March2018_Keff_C,March2019_Keff_C);
SMP_Keff_J = vertcat(March2018_Keff_J,March2019_Keff_J);

% import from sensitivity test runs - convert to tables
Run0_Daily_T = table2array(timetable2table(Run0_Daily,'ConvertRowTimes',false));
STest30_Daily_T = table2array(timetable2table(STest30_Daily,'ConvertRowTimes',false));
STest40_Daily_T = table2array(timetable2table(STest40_Daily,'ConvertRowTimes',false));
STest50_Daily_T = table2array(timetable2table(STest50_Daily,'ConvertRowTimes',false));
STest60_Daily_T = table2array(timetable2table(STest60_Daily,'ConvertRowTimes',false));
STest70_Daily_T = table2array(timetable2table(STest70_Daily,'ConvertRowTimes',false));
Run0_Sturm_Daily_T = table2array(timetable2table(Run0_Sturm_Daily,'ConvertRowTimes',false));

% subset data from sampling campaigns
% March 2018 = 14th - 21st (1899:1906)
% March 2019 = 18th - 27th (2268:2277)
 CLMSnowKeff_March2018_Run0 = Run0_Daily_T(1899:1906,36:39);
 CLMSnowKeff_March2019_Run0 = Run0_Daily_T(2268:2277,36:39);
 CLMSnowKeff_March2018_STest30 = STest30_Daily_T(1899:1906,36:39);
 CLMSnowKeff_March2019_STest30 = STest30_Daily_T(2268:2277,36:39);
 CLMSnowKeff_March2018_STest40 = STest40_Daily_T(1899:1906,36:39);
 CLMSnowKeff_March2019_STest40 = STest40_Daily_T(2268:2277,36:39);
 CLMSnowKeff_March2018_STest50 = STest50_Daily_T(1899:1906,36:39);
 CLMSnowKeff_March2019_STest50 = STest50_Daily_T(2268:2277,36:39);
 CLMSnowKeff_March2018_STest60 = STest60_Daily_T(1899:1906,36:39);
 CLMSnowKeff_March2019_STest60 = STest60_Daily_T(2268:2277,36:39);
 CLMSnowKeff_March2018_STest70 = STest70_Daily_T(1899:1906,36:39);
 CLMSnowKeff_March2019_STest70 = STest70_Daily_T(2268:2277,36:39);
 CLMSnowKeff_March2018_Run0_Sturm = Run0_Sturm_Daily_T(1899:1906,36:39);
 CLMSnowKeff_March2019_Run0_Sturm = Run0_Sturm_Daily_T(2268:2277,36:39);

 
% Pooled Histogram
CLMSnowKeff_Run0 = vertcat(CLMSnowKeff_March2018_Run0, CLMSnowKeff_March2019_Run0);
CLMSnowKeff_STest30 = vertcat(CLMSnowKeff_March2018_STest30, CLMSnowKeff_March2019_STest30);
CLMSnowKeff_STest40 = vertcat(CLMSnowKeff_March2018_STest40, CLMSnowKeff_March2019_STest40);
CLMSnowKeff_STest50 = vertcat(CLMSnowKeff_March2018_STest50, CLMSnowKeff_March2019_STest50);
CLMSnowKeff_STest60 = vertcat(CLMSnowKeff_March2018_STest60, CLMSnowKeff_March2019_STest60);
CLMSnowKeff_STest70 = vertcat(CLMSnowKeff_March2018_STest70, CLMSnowKeff_March2019_STest70);
CLMSnowKeff_Run0_Sturm = vertcat(CLMSnowKeff_March2018_Run0_Sturm, CLMSnowKeff_March2019_Run0_Sturm);

CLMSnowKeff_Run0 = reshape(CLMSnowKeff_Run0,[],1);
CLMSnowKeff_STest30 = reshape(CLMSnowKeff_STest30,[],1);
CLMSnowKeff_STest40 = reshape(CLMSnowKeff_STest40,[],1);
CLMSnowKeff_STest50 = reshape(CLMSnowKeff_STest50,[],1);
CLMSnowKeff_STest60 = reshape(CLMSnowKeff_STest60,[],1);
CLMSnowKeff_STest70 = reshape(CLMSnowKeff_STest70,[],1);
CLMSnowKeff_Run0_Sturm = reshape(CLMSnowKeff_Run0_Sturm,[],1);

% Histograms
figure()
t = tiledlayout(2,1,'TileSpacing','Compact');
nexttile
edgeu = [0: 0.05: 0.65];
hold on
histogram(k_eff_pooled, edgeu, 'FaceColor',[0.6 0.6 0.6],'Normalization','probability');
histogram(CLMSnowKeff_Run0,edgeu,'DisplayStyle', 'stairs','LineWidth', 1.5, 'EdgeColor',[0.6350 0.0780 0.1840],'Normalization','probability'); % change colour?
histogram(SMP_Keff_S,edgeu,'DisplayStyle', 'stairs','LineWidth', 2, 'LineStyle', '--','EdgeColor','b','Normalization','probability');
histogram(SMP_Keff_C,edgeu,'DisplayStyle', 'stairs','LineWidth', 2, 'LineStyle', ':','EdgeColor','k','Normalization','probability');
histogram(SMP_Keff_J,edgeu,'DisplayStyle', 'stairs','LineWidth', 1.5, 'LineStyle', '-.','EdgeColor','r','Normalization','probability');
xlim([0 0.65])
legend({['Needleprobe' newline 'n = 105'],['CLM' newline 'n = 64'], ['SMP - Sturm' newline 'n = 251828'], ['SMP - Calonne' newline 'n = 251828'], ['SMP - Jordan' newline 'n = 251828']}, 'Position', [0.41 0.1 0.2 0.2]);
legend boxoff
pbaspect([1 1 1])
text(0.01, 0.375, 'a)') %label
% set(gca,'FontSize',14)
nexttile
edgeu = [0: 0.05: 0.65];
hold on
histogram(CLMSnowKeff_Run0,edgeu,'DisplayStyle', 'stairs','LineWidth', 2.2,'EdgeColor',[0.6350 0.0780 0.1840],'Normalization','probability'); % dark red
histogram(CLMSnowKeff_STest30,edgeu,'DisplayStyle', 'stairs','LineWidth', 1.2,'EdgeColor',[1.0000 0.7176 0.8078],'Normalization','probability'); % pale red
histogram(CLMSnowKeff_STest40,edgeu,'DisplayStyle', 'stairs','LineWidth', 1.2,'EdgeColor',[0.5 0.5 0.5],'Normalization','probability'); % paler grey
histogram(CLMSnowKeff_STest50,edgeu,'DisplayStyle', 'stairs','LineWidth', 1.2,'EdgeColor',[0.5843 0.8157 0.9882],'Normalization','probability'); % mid blue
histogram(CLMSnowKeff_STest60,edgeu,'DisplayStyle', 'stairs','LineWidth', 1.2,'EdgeColor',[0 0.4470 0.7410],'Normalization','probability'); % black
histogram(CLMSnowKeff_STest70,edgeu,'DisplayStyle', 'stairs','LineWidth', 1.2,'EdgeColor',[0 0.2235 0.3705],'Normalization','probability'); % navy
histogram(CLMSnowKeff_Run0_Sturm,edgeu,'DisplayStyle', 'stairs','LineWidth', 2.2,'EdgeColor','b','Normalization','probability'); % blue
xlim([0 0.65])
legend({'Baseline', '\alpha = 0.7','\alpha = 0.6','\alpha = 0.5', '\alpha = 0.4','\alpha = 0.3', 'Sturm'}, 'Location', 'NorthEast');
legend boxoff
pbaspect([1 1 1])
ylim([0 1])
text(0.01, 0.95,'b)') %label
% set(gca,'FontSize',14)
ylabel(t,'Relative Frequency')
xlabel(t, 'Thermal Conductivity [W m^{-1} K^{-1}]')

%% Fig. 6a - Stats

% Stats:
median_Keff_CLM = nanmedian(CLMSnowKeff_Run0);
median_Keff_S = nanmedian(SMP_Keff_S);
median_Keff_C = nanmedian(SMP_Keff_C);
median_Keff_J = nanmedian(SMP_Keff_J);
median_Keff_NP = nanmedian(k_eff_pooled);
IQR_Keff_NP = quantile(k_eff_pooled, [0.25 0.75]);

mean_Keff_CLM = nanmean(CLMSnowKeff_Run0);
mean_Keff_S = nanmean(SMP_Keff_S);
mean_Keff_C = nanmean(SMP_Keff_C);
mean_Keff_J = nanmean(SMP_Keff_J);
mean_Keff_NP = nanmean(k_eff_pooled);

stdev_Keff_CLM = nanstd(CLMSnowKeff_Run0);
stdev_Keff_S = nanstd(SMP_Keff_S);
stdev_Keff_C = nanstd(SMP_Keff_C);
stdev_Keff_J = nanstd(SMP_Keff_J);
stdev_Keff_NP = nanstd(k_eff_pooled);

% Test sample means of all 4 groups
% group 1 = SMP_S
X = ones(1,length(SMP_Keff_S));
SMP_S = rot90(SMP_Keff_S);
% group 2 = SMP_C
Y = X*2;
SMP_C = rot90(SMP_Keff_C);
% group 3 = SMP_J
V = X*3;
SMP_J = rot90(SMP_Keff_J);
% group 4 = CLM
Z = ones(1,length(CLMSnowKeff_Run0));
Z = Z*4;
CLM_Keff = rot90(CLMSnowKeff_Run0);
% group 5 = Needleprobe
W = ones(1, length(k_eff_pooled));
W = W*5;
NP = rot90(k_eff_pooled);
%concatinate
Variables = horzcat(SMP_S, SMP_C, SMP_J, CLM_Keff,NP);
groups = horzcat(X,Y,V,Z,W);

%Kruskal Wallis test
[p,tbl,stats] = kruskalwallis(Variables,groups);
multcompare(stats,'Alpha',0.001)

%% Fig. 7 - Sensitivity Test Timeseries

% Want to plot 1st August 2017 - 31st Aug 2019
start_1719 = datetime(2017,08,01);
end_1719 = datetime(2019,08,31);
days_1719 = start_1719:end_1719;

x = [days_1719(1),days_1719(93),days_1719(185),days_1719(274),days_1719(366),days_1719(458),days_1719(550),days_1719(639),days_1719(731)]; % Aug, Nov, Feb, May 
x_minor = [days_1719(1),days_1719(32),days_1719(62),days_1719(93),days_1719(123),... %2017
    days_1719(154),days_1719(185),days_1719(213),days_1719(244),days_1719(274),days_1719(305),days_1719(335),days_1719(366),days_1719(397),days_1719(427),days_1719(458),days_1719(488),... %2018
    days_1719(519),days_1719(550),days_1719(578),days_1719(609),days_1719(639),days_1719(670),days_1719(700),days_1719(731),end_1719]; %2019

figure()
t = tiledlayout(5,1,'TileSpacing','none');

% Subplot 1 - Alpha Runs
a = nexttile(1, [2 1]);
plot(Run0_Daily.Time, Run0_Daily.SoilTemp_10cm_CLM, 'Color',[0.6350 0.0780 0.1840],'LineWidth', 1.5, 'LineStyle','-');
hold on
plot(STest30_Daily.Time, STest30_Daily.SoilTemp_10cm_CLM,'LineStyle','-', 'Color',[1.0000 0.7176 0.8078]);
plot(STest40_Daily.Time, STest40_Daily.SoilTemp_10cm_CLM,'LineStyle','-', 'Color',[0.5 0.5 0.5]);
plot(STest50_Daily.Time, STest50_Daily.SoilTemp_10cm_CLM,'LineStyle','-', 'Color',[0.5843 0.8157 0.9882]);
plot(STest60_Daily.Time, STest60_Daily.SoilTemp_10cm_CLM,'LineStyle','-', 'Color',[0 0.4470 0.7410]);
plot(STest70_Daily.Time, STest70_Daily.SoilTemp_10cm_CLM,'LineStyle','-', 'Color', [0 0.2235 0.3705]);
plot(Run0_Daily.Time, Run0_Daily.SoilTemp_10cm_Obs, 'k--', 'LineWidth', 1.5);
yline(0,'k:')% add zero line
hold off
xlim([start_1719 end_1719])
ylim([-30 20])
text(1658, 20, '20','FontSize', 14) %y axis labels (bc. issues)
text(1658, 10, '10','FontSize', 14) %y axis labels (bc. issues)
text(1665, 0, '0','FontSize', 14) %y axis labels (bc. issues)
text(1655, -10, '-10','FontSize', 14) %y axis labels (bc. issues)
text(1655, -20, '-20','FontSize', 14) %y axis labels (bc. issues)
text(1655, -30, '-30','FontSize', 14) %y axis labels (bc. issues)
text(1676, -27, 'a)','FontSize', 14) %label
set(gca,'xticklabel',[])
h = gca;
h.XAxis.MinorTick = 'on';
h.XAxis.MinorTickValues = x_minor;
set(gca,'FontSize', 12)

% Subplot 2 - Keff Parameterisations
b = nexttile(3,[2 1]);
plot(Run0_Daily.Time, Run0_Daily.SoilTemp_10cm_CLM, 'Color',[0.6350 0.0780 0.1840],'LineWidth', 1.5, 'LineStyle','-');
hold on
plot(Run0_Sturm_Daily.Time, Run0_Sturm_Daily.SoilTemp_10cm_CLM, 'b-','LineWidth', 1.5);
plot(Run0_Daily.Time, Run0_Daily.SoilTemp_10cm_Obs, 'k--', 'LineWidth', 1.5);
yline(0,'k:')% add zero line
hold off
xlim([start_1719 end_1719])
ylim([-30 20])
text(1630, 5, '10 cm Soil Temp [^{o} C]','FontSize', 14, 'Rotation', 90) %y axis labels (shared)
text(1658, 10, '10','FontSize', 14) %y axis labels (bc. issues)
text(1665, 0, '0','FontSize', 14) %y axis labels (bc. issues)
text(1655, -10, '-10','FontSize', 14) %y axis labels (bc. issues)
text(1655, -20, '-20','FontSize', 14) %y axis labels (bc. issues)
text(1655, -30, '-30','FontSize', 14) %y axis labels (bc. issues)
text(1676, -27, 'b)','FontSize', 14) %label
set(gca,'TickDir','out'); % puts tick marks on the outside
set(gca,'xticklabel',[])
h = gca;
h.XAxis.MinorTick = 'on';
h.XAxis.MinorTickValues = x_minor;
set(gca,'FontSize', 12)

% Subplot 3 - Snow Depth
c = nexttile;
y = [0:0.25:0.75];
plot(Run0_Daily.Time,Run0_Daily.SnowDepth_CLM, 'k-','LineWidth', 1.5);
hold on
plot(Run0_Daily.Time,Run0_Daily.SnowDepth_MSC_obs,'k--')
xlim([start_1719 end_1719])
ylim([0 0.75])
ylabel({'Snow'; 'Depth [m]'; ''})
text(1665, 0, '0','FontSize', 14) %y axis labels (bc. issues)
text(1650, 0.25, '0.25','FontSize', 14) %y axis labels (bc. issues)
text(1655, 0.5, '0.5','FontSize', 14) %y axis labels (bc. issues)
% text(1650, 0.75, '0.75','FontSize', 14) %y axis labels (bc. issues)
text(1676, 0.65, 'c)','FontSize', 14) %label
set(gca,'TickDir','out'); % puts tick marks on the outside
set(gca, 'ytick', y);
h = gca;
h.XAxis.MinorTick = 'on';
h.XAxis.MinorTickValues = x_minor;
set(gca,'FontSize', 12)
clear y

set(t.Children,'XTick',x, 'YTick',[]); % if you remove this line, the spaces come back ... hence bodge above :(
lega = legend(a,{'Baseline', '\alpha = 0.7','\alpha = 0.6','\alpha = 0.5', '\alpha = 0.4','\alpha = 0.3', 'Obs'},'Location', 'SouthEast', 'NumColumns', 2);
set(lega,'Box','off');
legb = legend(b,{'Jordan', 'Sturm', 'Obs'},'Location', 'SouthEast');
set(legb,'Box','off');
legc = legend(c,'CLM', 'Obs');
set(legc,'Box','off');

%% Fig. 8 Stats - RMSE
% Root Mean Square Error = sqrt(mean((CLM - Obs).^2))

% Import Data: 17-18
% Winter 17-18 = 15th Sept - 31st May (1719:1977)
Obs_SoilTemp_Winter1718 = Run0_Daily.SoilTemp_10cm_Obs(1719:1977);
Run0_SoilTemp_Winter1718 = Run0_Daily.SoilTemp_10cm_CLM(1719:1977);
STest25_SoilTemp_Winter1718 = STest25_Daily.SoilTemp_10cm_CLM(1719:1977);
STest30_SoilTemp_Winter1718 = STest30_Daily.SoilTemp_10cm_CLM(1719:1977);
STest35_SoilTemp_Winter1718 = STest35_Daily.SoilTemp_10cm_CLM(1719:1977);
STest40_SoilTemp_Winter1718 = STest40_Daily.SoilTemp_10cm_CLM(1719:1977);
STest45_SoilTemp_Winter1718 = STest45_Daily.SoilTemp_10cm_CLM(1719:1977);
STest50_SoilTemp_Winter1718 = STest50_Daily.SoilTemp_10cm_CLM(1719:1977);
STest55_SoilTemp_Winter1718 = STest55_Daily.SoilTemp_10cm_CLM(1719:1977);
STest60_SoilTemp_Winter1718 = STest60_Daily.SoilTemp_10cm_CLM(1719:1977);
STest65_SoilTemp_Winter1718 = STest65_Daily.SoilTemp_10cm_CLM(1719:1977);
STest70_SoilTemp_Winter1718 = STest70_Daily.SoilTemp_10cm_CLM(1719:1977);
STest75_SoilTemp_Winter1718 = STest75_Daily.SoilTemp_10cm_CLM(1719:1977);
STest100_SoilTemp_Winter1718 = STest100_Daily.SoilTemp_10cm_CLM(1719:1977);

% Import Data: 18-19
% Winter 18-19 = 15th Sept - 31st May (2084:2342)
Obs_SoilTemp_Winter1819 = Run0_Daily.SoilTemp_10cm_Obs(2084:2342);
Run0_SoilTemp_Winter1819 = Run0_Daily.SoilTemp_10cm_CLM(2084:2342);
STest25_SoilTemp_Winter1819 = STest25_Daily.SoilTemp_10cm_CLM(2084:2342);
STest30_SoilTemp_Winter1819 = STest30_Daily.SoilTemp_10cm_CLM(2084:2342);
STest35_SoilTemp_Winter1819 = STest35_Daily.SoilTemp_10cm_CLM(2084:2342);
STest40_SoilTemp_Winter1819 = STest40_Daily.SoilTemp_10cm_CLM(2084:2342);
STest45_SoilTemp_Winter1819 = STest45_Daily.SoilTemp_10cm_CLM(2084:2342);
STest50_SoilTemp_Winter1819 = STest50_Daily.SoilTemp_10cm_CLM(2084:2342);
STest55_SoilTemp_Winter1819 = STest55_Daily.SoilTemp_10cm_CLM(2084:2342);
STest60_SoilTemp_Winter1819 = STest60_Daily.SoilTemp_10cm_CLM(2084:2342);
STest65_SoilTemp_Winter1819 = STest65_Daily.SoilTemp_10cm_CLM(2084:2342);
STest70_SoilTemp_Winter1819 = STest70_Daily.SoilTemp_10cm_CLM(2084:2342);
STest75_SoilTemp_Winter1819 = STest75_Daily.SoilTemp_10cm_CLM(2084:2342);
STest100_SoilTemp_Winter1819 = STest100_Daily.SoilTemp_10cm_CLM(2084:2342);

% whole year - Run 0
RMSE_Run0 = sqrt(mean((((Run0_Daily.SoilTemp_10cm_CLM(1674:2434)) - (Run0_Daily.SoilTemp_10cm_Obs(1674:2434))).^2),'omitnan'));
% bias stat: intercept of y = mx + c ?
% y = Modelled, x = Obs
y = Run0_Daily.SoilTemp_10cm_CLM(1674:2434);
x = Run0_Daily.SoilTemp_10cm_Obs(1674:2434);
x_regression = horzcat(ones(length(x),1),x);

[b,~,~, stats] = regress(y,x_regression);

% Pool winters
SoilTemp_Winter_Obs = vertcat(Obs_SoilTemp_Winter1718, Obs_SoilTemp_Winter1819);
SoilTemp_Winter_Run0 = vertcat(Run0_SoilTemp_Winter1718, Run0_SoilTemp_Winter1819); 
SoilTemp_Winter_STest25 = vertcat(STest25_SoilTemp_Winter1718, STest25_SoilTemp_Winter1819); 
SoilTemp_Winter_STest30 = vertcat(STest30_SoilTemp_Winter1718, STest30_SoilTemp_Winter1819);
SoilTemp_Winter_STest35 = vertcat(STest35_SoilTemp_Winter1718, STest35_SoilTemp_Winter1819);
SoilTemp_Winter_STest40 = vertcat(STest40_SoilTemp_Winter1718, STest40_SoilTemp_Winter1819);
SoilTemp_Winter_STest45 = vertcat(STest45_SoilTemp_Winter1718, STest45_SoilTemp_Winter1819);
SoilTemp_Winter_STest50 = vertcat(STest50_SoilTemp_Winter1718, STest50_SoilTemp_Winter1819);
SoilTemp_Winter_STest55 = vertcat(STest55_SoilTemp_Winter1718, STest55_SoilTemp_Winter1819);
SoilTemp_Winter_STest60 = vertcat(STest60_SoilTemp_Winter1718, STest60_SoilTemp_Winter1819);
SoilTemp_Winter_STest65 = vertcat(STest65_SoilTemp_Winter1718, STest65_SoilTemp_Winter1819);
SoilTemp_Winter_STest70 = vertcat(STest70_SoilTemp_Winter1718, STest70_SoilTemp_Winter1819);
SoilTemp_Winter_STest75 = vertcat(STest75_SoilTemp_Winter1718, STest75_SoilTemp_Winter1819);

% RMSE
RMSE_Winter = sqrt(mean((SoilTemp_Winter_Run0 - SoilTemp_Winter_Obs).^2));
RMSE_Winter_STest25_Pooled = sqrt(mean((SoilTemp_Winter_STest25 - SoilTemp_Winter_Obs).^2));
RMSE_Winter_STest30_Pooled = sqrt(mean((SoilTemp_Winter_STest30 - SoilTemp_Winter_Obs).^2));
RMSE_Winter_STest35_Pooled = sqrt(mean((SoilTemp_Winter_STest35 - SoilTemp_Winter_Obs).^2));
RMSE_Winter_STest40_Pooled = sqrt(mean((SoilTemp_Winter_STest40 - SoilTemp_Winter_Obs).^2));
RMSE_Winter_STest45_Pooled = sqrt(mean((SoilTemp_Winter_STest45 - SoilTemp_Winter_Obs).^2));
RMSE_Winter_STest50_Pooled = sqrt(mean((SoilTemp_Winter_STest50 - SoilTemp_Winter_Obs).^2));
RMSE_Winter_STest55_Pooled = sqrt(mean((SoilTemp_Winter_STest55 - SoilTemp_Winter_Obs).^2));
RMSE_Winter_STest60_Pooled = sqrt(mean((SoilTemp_Winter_STest60 - SoilTemp_Winter_Obs).^2));
RMSE_Winter_STest65_Pooled = sqrt(mean((SoilTemp_Winter_STest65 - SoilTemp_Winter_Obs).^2));
RMSE_Winter_STest70_Pooled = sqrt(mean((SoilTemp_Winter_STest70 - SoilTemp_Winter_Obs).^2));
RMSE_Winter_STest75_Pooled = sqrt(mean((SoilTemp_Winter_STest75 - SoilTemp_Winter_Obs).^2));

% RMSE Reduction
RMSE_red_STest25 = RMSE_Winter - RMSE_Winter_STest25_Pooled; 
RMSE_red_STest30 = RMSE_Winter - RMSE_Winter_STest30_Pooled;
RMSE_red_STest35 = RMSE_Winter - RMSE_Winter_STest35_Pooled;
RMSE_red_STest40 = RMSE_Winter - RMSE_Winter_STest40_Pooled; 
RMSE_red_STest45 = RMSE_Winter - RMSE_Winter_STest45_Pooled; 
RMSE_red_STest50 = RMSE_Winter - RMSE_Winter_STest50_Pooled; 
RMSE_red_STest55 = RMSE_Winter - RMSE_Winter_STest55_Pooled; 
RMSE_red_STest60 = RMSE_Winter - RMSE_Winter_STest60_Pooled; 
RMSE_red_STest65 = RMSE_Winter - RMSE_Winter_STest65_Pooled; 
RMSE_red_STest70 = RMSE_Winter - RMSE_Winter_STest70_Pooled;
RMSE_red_STest75 = RMSE_Winter - RMSE_Winter_STest75_Pooled; 

% 17-18
RMSE_Winter1718_Run0 = sqrt(mean((Run0_SoilTemp_Winter1718 - Obs_SoilTemp_Winter1718).^2));
RMSE_Winter1718_STest25 = sqrt(mean((STest25_SoilTemp_Winter1718 - Obs_SoilTemp_Winter1718).^2));
RMSE_Winter1718_STest30 = sqrt(mean((STest30_SoilTemp_Winter1718 - Obs_SoilTemp_Winter1718).^2));
RMSE_Winter1718_STest35 = sqrt(mean((STest35_SoilTemp_Winter1718 - Obs_SoilTemp_Winter1718).^2));
RMSE_Winter1718_STest40 = sqrt(mean((STest40_SoilTemp_Winter1718 - Obs_SoilTemp_Winter1718).^2));
RMSE_Winter1718_STest45 = sqrt(mean((STest45_SoilTemp_Winter1718 - Obs_SoilTemp_Winter1718).^2));
RMSE_Winter1718_STest50 = sqrt(mean((STest50_SoilTemp_Winter1718 - Obs_SoilTemp_Winter1718).^2));
RMSE_Winter1718_STest55 = sqrt(mean((STest55_SoilTemp_Winter1718 - Obs_SoilTemp_Winter1718).^2));
RMSE_Winter1718_STest60 = sqrt(mean((STest60_SoilTemp_Winter1718 - Obs_SoilTemp_Winter1718).^2));
RMSE_Winter1718_STest65 = sqrt(mean((STest65_SoilTemp_Winter1718 - Obs_SoilTemp_Winter1718).^2));
RMSE_Winter1718_STest70 = sqrt(mean((STest70_SoilTemp_Winter1718 - Obs_SoilTemp_Winter1718).^2));
RMSE_Winter1718_STest75 = sqrt(mean((STest75_SoilTemp_Winter1718 - Obs_SoilTemp_Winter1718).^2));
RMSE_Winter1718_STest100 = sqrt(mean((STest100_SoilTemp_Winter1718 - Obs_SoilTemp_Winter1718).^2));

% 18-19
RMSE_Winter1819_Run0 = sqrt(mean((Run0_SoilTemp_Winter1819 - Obs_SoilTemp_Winter1819).^2));
RMSE_Winter1819_STest25 = sqrt(mean((STest25_SoilTemp_Winter1819 - Obs_SoilTemp_Winter1819).^2));
RMSE_Winter1819_STest30 = sqrt(mean((STest30_SoilTemp_Winter1819 - Obs_SoilTemp_Winter1819).^2));
RMSE_Winter1819_STest35 = sqrt(mean((STest35_SoilTemp_Winter1819 - Obs_SoilTemp_Winter1819).^2));
RMSE_Winter1819_STest40 = sqrt(mean((STest40_SoilTemp_Winter1819 - Obs_SoilTemp_Winter1819).^2));
RMSE_Winter1819_STest45 = sqrt(mean((STest45_SoilTemp_Winter1819 - Obs_SoilTemp_Winter1819).^2));
RMSE_Winter1819_STest50 = sqrt(mean((STest50_SoilTemp_Winter1819 - Obs_SoilTemp_Winter1819).^2));
RMSE_Winter1819_STest55 = sqrt(mean((STest55_SoilTemp_Winter1819 - Obs_SoilTemp_Winter1819).^2));
RMSE_Winter1819_STest60 = sqrt(mean((STest60_SoilTemp_Winter1819 - Obs_SoilTemp_Winter1819).^2));
RMSE_Winter1819_STest65 = sqrt(mean((STest65_SoilTemp_Winter1819 - Obs_SoilTemp_Winter1819).^2));
RMSE_Winter1819_STest70 = sqrt(mean((STest70_SoilTemp_Winter1819 - Obs_SoilTemp_Winter1819).^2));
RMSE_Winter1819_STest75 = sqrt(mean((STest75_SoilTemp_Winter1819 - Obs_SoilTemp_Winter1819).^2));
RMSE_Winter1819_STest100 = sqrt(mean((STest100_SoilTemp_Winter1819 - Obs_SoilTemp_Winter1819).^2));

% Collate
RMSE_Winter1718_ALL = [RMSE_Winter1718_Run0, RMSE_Winter1718_STest25, RMSE_Winter1718_STest30, RMSE_Winter1718_STest35, RMSE_Winter1718_STest40, RMSE_Winter1718_STest45, RMSE_Winter1718_STest50, RMSE_Winter1718_STest55, RMSE_Winter1718_STest60, RMSE_Winter1718_STest65, RMSE_Winter1718_STest70, RMSE_Winter1718_STest75, RMSE_Winter1718_STest100];
RMSE_Winter1819_ALL = [RMSE_Winter1819_Run0, RMSE_Winter1819_STest25, RMSE_Winter1819_STest30, RMSE_Winter1819_STest35, RMSE_Winter1819_STest40, RMSE_Winter1819_STest45, RMSE_Winter1819_STest50, RMSE_Winter1819_STest55, RMSE_Winter1819_STest60, RMSE_Winter1819_STest65, RMSE_Winter1819_STest70, RMSE_Winter1819_STest75, RMSE_Winter1819_STest100];
Multiplier = fliplr([0 0.25:0.05:0.75 1]);

% Sturm
% Import Data
% 17 - 18
Run0_Sturm_SoilTemp_Winter1718 = Run0_Sturm_Daily.SoilTemp_10cm_CLM(1719:1977);
STest40_Sturm_SoilTemp_Winter1718 = STest40_Sturm_Daily.SoilTemp_10cm_CLM(1719:1977);
STest70_Sturm_SoilTemp_Winter1718 = STest70_Sturm_Daily.SoilTemp_10cm_CLM(1719:1977);

% 18 -19
Run0_Sturm_SoilTemp_Winter1819 = Run0_Sturm_Daily.SoilTemp_10cm_CLM(2084:2342);
STest40_Sturm_SoilTemp_Winter1819 = STest40_Sturm_Daily.SoilTemp_10cm_CLM(2084:2342);
STest70_Sturm_SoilTemp_Winter1819 = STest70_Sturm_Daily.SoilTemp_10cm_CLM(2084:2342);

% Collate
SoilTemp_Winter_Run0_Sturm = vertcat(Run0_Sturm_SoilTemp_Winter1718, Run0_Sturm_SoilTemp_Winter1819);
SoilTemp_Winter_STest40_Sturm = vertcat(STest40_Sturm_SoilTemp_Winter1718, STest40_Sturm_SoilTemp_Winter1819);
SoilTemp_Winter_STest70_Sturm = vertcat(STest70_Sturm_SoilTemp_Winter1718, STest70_Sturm_SoilTemp_Winter1819);

% RMSE
% 17 - 18
RMSE_Winter1718_Run0_Sturm = sqrt(mean((Run0_Sturm_SoilTemp_Winter1718 - Obs_SoilTemp_Winter1718).^2));
RMSE_Winter1718_STest40_Sturm = sqrt(mean((STest40_Sturm_SoilTemp_Winter1718 - Obs_SoilTemp_Winter1718).^2));
RMSE_Winter1718_STest70_Sturm = sqrt(mean((STest70_Sturm_SoilTemp_Winter1718 - Obs_SoilTemp_Winter1718).^2));

% 18 - 19
RMSE_Winter1819_Run0_Sturm = sqrt(mean((Run0_Sturm_SoilTemp_Winter1819 - Obs_SoilTemp_Winter1718).^2));
RMSE_Winter1819_STest40_Sturm = sqrt(mean((STest40_Sturm_SoilTemp_Winter1819 - Obs_SoilTemp_Winter1819).^2));
RMSE_Winter1819_STest70_Sturm = sqrt(mean((STest70_Sturm_SoilTemp_Winter1819 - Obs_SoilTemp_Winter1819).^2));

% Pooled
RMSE_Winter_Run0_Sturm = sqrt(mean((SoilTemp_Winter_Run0_Sturm - SoilTemp_Winter_Obs).^2));
RMSE_Winter_STest40_Sturm_Pooled = sqrt(mean((SoilTemp_Winter_STest40_Sturm - SoilTemp_Winter_Obs).^2));
RMSE_Winter_STest70_Sturm_Pooled = sqrt(mean((SoilTemp_Winter_STest70_Sturm - SoilTemp_Winter_Obs).^2));

% Reduction
RMSE_red_Sturm = RMSE_Winter - RMSE_Winter_Run0_Sturm; 

%% Fig. 8 Stats - SHTM
% A Norm = (Air Temp Amplitude - Soil Temp Amplitude)/(Air Temp Amplitude)

% A Norm - In situ:

% 2017-18 = 1st Oct 2017 - 31st March 2018(41617:45984)
AirTemp_Obs_1718 = Run0_Hourly.AirTemp_Obs(41617:45984);
MaxAirTempObs_1718 = max(AirTemp_Obs_1718);
MinAirTempObs_1718 = min(AirTemp_Obs_1718);
AirTempAmp_Obs_1718 = MaxAirTempObs_1718 - MinAirTempObs_1718;
SoilTempObs_1718 = Run0_Hourly.SoilTemp_20cm_Obs(41617:45984); 
MaxSoilTempObs_1718 = max(SoilTempObs_1718);
MinSoilTempObs_1718 = min(SoilTempObs_1718);
SoilTempAmp_Obs_1718 = MaxSoilTempObs_1718 - MinSoilTempObs_1718;
ANorm_Obs_1718 = (AirTempAmp_Obs_1718 - SoilTempAmp_Obs_1718)/AirTempAmp_Obs_1718;

% 2018-19 = 1st Oct 2018 - 31st March 2019 (50377:54744)
AirTemp_Obs_1819 = Run0_Hourly.AirTemp_Obs(50377:54744); 
MaxAirTempObs_1819 = max(AirTemp_Obs_1819);
MinAirTempObs_1819 = min(AirTemp_Obs_1819);
AirTempAmp_Obs_1819 = MaxAirTempObs_1819 - MinAirTempObs_1819;
SoilTempObs_1819 = Run0_Hourly.SoilTemp_20cm_Obs(50377:54744);
MaxSoilTempObs_1819 = max(SoilTempObs_1819);
MinSoilTempObs_1819 = min(SoilTempObs_1819);
SoilTempAmp_Obs_1819 = MaxSoilTempObs_1819 - MinSoilTempObs_1819;
ANorm_Obs_1819 = (AirTempAmp_Obs_1819 - SoilTempAmp_Obs_1819)/AirTempAmp_Obs_1819;

% A Norm - CLM:
%interpolate 20cm CLM soil temp
CLM_SoilTemp_20cm_Run0 = Run0_Hourly.SoilTemp_16cm_CLM + ((Run0_Hourly.SoilTemp_26cm_CLM - Run0_Hourly.SoilTemp_16cm_CLM)*0.4);
CLM_SoilTemp_20cm_STest25 = STest25_Hourly.SoilTemp_16cm_CLM + ((STest25_Hourly.SoilTemp_26cm_CLM - STest25_Hourly.SoilTemp_16cm_CLM)*0.4);
CLM_SoilTemp_20cm_STest30 = STest30_Hourly.SoilTemp_16cm_CLM + ((STest30_Hourly.SoilTemp_26cm_CLM - STest30_Hourly.SoilTemp_16cm_CLM)*0.4);
CLM_SoilTemp_20cm_STest35 = STest35_Hourly.SoilTemp_16cm_CLM + ((STest35_Hourly.SoilTemp_26cm_CLM - STest35_Hourly.SoilTemp_16cm_CLM)*0.4);
CLM_SoilTemp_20cm_STest40 = STest40_Hourly.SoilTemp_16cm_CLM + ((STest40_Hourly.SoilTemp_26cm_CLM - STest40_Hourly.SoilTemp_16cm_CLM)*0.4);
CLM_SoilTemp_20cm_STest45 = STest45_Hourly.SoilTemp_16cm_CLM + ((STest45_Hourly.SoilTemp_26cm_CLM - STest45_Hourly.SoilTemp_16cm_CLM)*0.4);
CLM_SoilTemp_20cm_STest50 = STest50_Hourly.SoilTemp_16cm_CLM + ((STest50_Hourly.SoilTemp_26cm_CLM - STest50_Hourly.SoilTemp_16cm_CLM)*0.4);
CLM_SoilTemp_20cm_STest55 = STest55_Hourly.SoilTemp_16cm_CLM + ((STest55_Hourly.SoilTemp_26cm_CLM - STest55_Hourly.SoilTemp_16cm_CLM)*0.4);
CLM_SoilTemp_20cm_STest60 = STest60_Hourly.SoilTemp_16cm_CLM + ((STest60_Hourly.SoilTemp_26cm_CLM - STest60_Hourly.SoilTemp_16cm_CLM)*0.4);
CLM_SoilTemp_20cm_STest65 = STest65_Hourly.SoilTemp_16cm_CLM + ((STest65_Hourly.SoilTemp_26cm_CLM - STest65_Hourly.SoilTemp_16cm_CLM)*0.4);
CLM_SoilTemp_20cm_STest70 = STest70_Hourly.SoilTemp_16cm_CLM + ((STest70_Hourly.SoilTemp_26cm_CLM - STest70_Hourly.SoilTemp_16cm_CLM)*0.4);
CLM_SoilTemp_20cm_STest75 = STest75_Hourly.SoilTemp_16cm_CLM + ((STest75_Hourly.SoilTemp_26cm_CLM - STest75_Hourly.SoilTemp_16cm_CLM)*0.4);
CLM_SoilTemp_20cm_STest100 = STest100_Hourly.SoilTemp_16cm_CLM + ((STest100_Hourly.SoilTemp_26cm_CLM - STest100_Hourly.SoilTemp_16cm_CLM)*0.4);

% 2017-18 - SnowSeason_1718 = 41617:45984
AirTemp_Run0_1718 = Run0_Hourly.AirTemp_CLM(41617:45984);
MaxAirTemp_Run0_1718 = max(AirTemp_Run0_1718);
MinAirTemp_Run0_1718 = min(AirTemp_Run0_1718);
AirTempAmp_Run0_1718 = MaxAirTemp_Run0_1718 - MinAirTemp_Run0_1718;
SoilTemp_Run0_1718 = CLM_SoilTemp_20cm_Run0(41617:45984);
MaxSoilTemp_Run0_1718 = max(SoilTemp_Run0_1718);
MinSoilTemp_Run0_1718 = min(SoilTemp_Run0_1718);
SoilTempAmp_Run0_1718 = MaxSoilTemp_Run0_1718 - MinSoilTemp_Run0_1718;
ANorm_Run0_1718 = (AirTempAmp_Run0_1718 - SoilTempAmp_Run0_1718)/AirTempAmp_Run0_1718;

AirTemp_STest25_1718 = STest25_Hourly.AirTemp_CLM(41617:45984);
MaxAirTemp_STest25_1718 = max(AirTemp_STest25_1718);
MinAirTemp_STest25_1718 = min(AirTemp_STest25_1718);
AirTempAmp_STest25_1718 = MaxAirTemp_STest25_1718 - MinAirTemp_STest25_1718;
SoilTemp_STest25_1718 = CLM_SoilTemp_20cm_STest25(41617:45984);
MaxSoilTemp_STest25_1718 = max(SoilTemp_STest25_1718);
MinSoilTemp_STest25_1718 = min(SoilTemp_STest25_1718);
SoilTempAmp_STest25_1718 = MaxSoilTemp_STest25_1718 - MinSoilTemp_STest25_1718;
ANorm_STest25_1718 = (AirTempAmp_STest25_1718 - SoilTempAmp_STest25_1718)/AirTempAmp_STest25_1718;

AirTemp_STest30_1718 = STest30_Hourly.AirTemp_CLM(41617:45984);
MaxAirTemp_STest30_1718 = max(AirTemp_STest30_1718);
MinAirTemp_STest30_1718 = min(AirTemp_STest30_1718);
AirTempAmp_STest30_1718 = MaxAirTemp_STest30_1718 - MinAirTemp_STest30_1718;
SoilTemp_STest30_1718 = CLM_SoilTemp_20cm_STest30(41617:45984);
MaxSoilTemp_STest30_1718 = max(SoilTemp_STest30_1718);
MinSoilTemp_STest30_1718 = min(SoilTemp_STest30_1718);
SoilTempAmp_STest30_1718 = MaxSoilTemp_STest30_1718 - MinSoilTemp_STest30_1718;
ANorm_STest30_1718 = (AirTempAmp_STest30_1718 - SoilTempAmp_STest30_1718)/AirTempAmp_STest30_1718;

AirTemp_STest35_1718 = STest35_Hourly.AirTemp_CLM(41617:45984);
MaxAirTemp_STest35_1718 = max(AirTemp_STest35_1718);
MinAirTemp_STest35_1718 = min(AirTemp_STest35_1718);
AirTempAmp_STest35_1718 = MaxAirTemp_STest35_1718 - MinAirTemp_STest35_1718;
SoilTemp_STest35_1718 = CLM_SoilTemp_20cm_STest35(41617:45984);
MaxSoilTemp_STest35_1718 = max(SoilTemp_STest35_1718);
MinSoilTemp_STest35_1718 = min(SoilTemp_STest35_1718);
SoilTempAmp_STest35_1718 = MaxSoilTemp_STest35_1718 - MinSoilTemp_STest35_1718;
ANorm_STest35_1718 = (AirTempAmp_STest35_1718 - SoilTempAmp_STest35_1718)/AirTempAmp_STest35_1718;

AirTemp_STest40_1718 = STest40_Hourly.AirTemp_CLM(41617:45984);
MaxAirTemp_STest40_1718 = max(AirTemp_STest40_1718);
MinAirTemp_STest40_1718 = min(AirTemp_STest40_1718);
AirTempAmp_STest40_1718 = MaxAirTemp_STest40_1718 - MinAirTemp_STest40_1718;
SoilTemp_STest40_1718 = CLM_SoilTemp_20cm_STest40(41617:45984);
MaxSoilTemp_STest40_1718 = max(SoilTemp_STest40_1718);
MinSoilTemp_STest40_1718 = min(SoilTemp_STest40_1718);
SoilTempAmp_STest40_1718 = MaxSoilTemp_STest40_1718 - MinSoilTemp_STest40_1718;
ANorm_STest40_1718 = (AirTempAmp_STest40_1718 - SoilTempAmp_STest40_1718)/AirTempAmp_STest40_1718;

AirTemp_STest45_1718 = STest45_Hourly.AirTemp_CLM(41617:45984);
MaxAirTemp_STest45_1718 = max(AirTemp_STest45_1718);
MinAirTemp_STest45_1718 = min(AirTemp_STest45_1718);
AirTempAmp_STest45_1718 = MaxAirTemp_STest45_1718 - MinAirTemp_STest45_1718;
SoilTemp_STest45_1718 = CLM_SoilTemp_20cm_STest45(41617:45984);
MaxSoilTemp_STest45_1718 = max(SoilTemp_STest45_1718);
MinSoilTemp_STest45_1718 = min(SoilTemp_STest45_1718);
SoilTempAmp_STest45_1718 = MaxSoilTemp_STest45_1718 - MinSoilTemp_STest45_1718;
ANorm_STest45_1718 = (AirTempAmp_STest45_1718 - SoilTempAmp_STest45_1718)/AirTempAmp_STest45_1718;

AirTemp_STest50_1718 = STest50_Hourly.AirTemp_CLM(41617:45984);
MaxAirTemp_STest50_1718 = max(AirTemp_STest50_1718);
MinAirTemp_STest50_1718 = min(AirTemp_STest50_1718);
AirTempAmp_STest50_1718 = MaxAirTemp_STest50_1718 - MinAirTemp_STest50_1718;
SoilTemp_STest50_1718 = CLM_SoilTemp_20cm_STest50(41617:45984);
MaxSoilTemp_STest50_1718 = max(SoilTemp_STest50_1718);
MinSoilTemp_STest50_1718 = min(SoilTemp_STest50_1718);
SoilTempAmp_STest50_1718 = MaxSoilTemp_STest50_1718 - MinSoilTemp_STest50_1718;
ANorm_STest50_1718 = (AirTempAmp_STest50_1718 - SoilTempAmp_STest50_1718)/AirTempAmp_STest50_1718;

AirTemp_STest55_1718 = STest55_Hourly.AirTemp_CLM(41617:45984);
MaxAirTemp_STest55_1718 = max(AirTemp_STest55_1718);
MinAirTemp_STest55_1718 = min(AirTemp_STest55_1718);
AirTempAmp_STest55_1718 = MaxAirTemp_STest55_1718 - MinAirTemp_STest55_1718;
SoilTemp_STest55_1718 = CLM_SoilTemp_20cm_STest55(41617:45984);
MaxSoilTemp_STest55_1718 = max(SoilTemp_STest55_1718);
MinSoilTemp_STest55_1718 = min(SoilTemp_STest55_1718);
SoilTempAmp_STest55_1718 = MaxSoilTemp_STest55_1718 - MinSoilTemp_STest55_1718;
ANorm_STest55_1718 = (AirTempAmp_STest55_1718 - SoilTempAmp_STest55_1718)/AirTempAmp_STest55_1718;

AirTemp_STest60_1718 = STest60_Hourly.AirTemp_CLM(41617:45984);
MaxAirTemp_STest60_1718 = max(AirTemp_STest60_1718);
MinAirTemp_STest60_1718 = min(AirTemp_STest60_1718);
AirTempAmp_STest60_1718 = MaxAirTemp_STest60_1718 - MinAirTemp_STest60_1718;
SoilTemp_STest60_1718 = CLM_SoilTemp_20cm_STest60(41617:45984);
MaxSoilTemp_STest60_1718 = max(SoilTemp_STest60_1718);
MinSoilTemp_STest60_1718 = min(SoilTemp_STest60_1718);
SoilTempAmp_STest60_1718 = MaxSoilTemp_STest60_1718 - MinSoilTemp_STest60_1718;
ANorm_STest60_1718 = (AirTempAmp_STest60_1718 - SoilTempAmp_STest60_1718)/AirTempAmp_STest60_1718;

AirTemp_STest65_1718 = STest65_Hourly.AirTemp_CLM(41617:45984);
MaxAirTemp_STest65_1718 = max(AirTemp_STest65_1718);
MinAirTemp_STest65_1718 = min(AirTemp_STest65_1718);
AirTempAmp_STest65_1718 = MaxAirTemp_STest65_1718 - MinAirTemp_STest65_1718;
SoilTemp_STest65_1718 = CLM_SoilTemp_20cm_STest65(41617:45984);
MaxSoilTemp_STest65_1718 = max(SoilTemp_STest65_1718);
MinSoilTemp_STest65_1718 = min(SoilTemp_STest65_1718);
SoilTempAmp_STest65_1718 = MaxSoilTemp_STest65_1718 - MinSoilTemp_STest65_1718;
ANorm_STest65_1718 = (AirTempAmp_STest65_1718 - SoilTempAmp_STest65_1718)/AirTempAmp_STest65_1718;

AirTemp_STest70_1718 = STest70_Hourly.AirTemp_CLM(41617:45984);
MaxAirTemp_STest70_1718 = max(AirTemp_STest70_1718);
MinAirTemp_STest70_1718 = min(AirTemp_STest70_1718);
AirTempAmp_STest70_1718 = MaxAirTemp_STest70_1718 - MinAirTemp_STest70_1718;
SoilTemp_STest70_1718 = CLM_SoilTemp_20cm_STest70(41617:45984);
MaxSoilTemp_STest70_1718 = max(SoilTemp_STest70_1718);
MinSoilTemp_STest70_1718 = min(SoilTemp_STest70_1718);
SoilTempAmp_STest70_1718 = MaxSoilTemp_STest70_1718 - MinSoilTemp_STest70_1718;
ANorm_STest70_1718 = (AirTempAmp_STest70_1718 - SoilTempAmp_STest70_1718)/AirTempAmp_STest70_1718;

AirTemp_STest75_1718 = STest75_Hourly.AirTemp_CLM(41617:45984);
MaxAirTemp_STest75_1718 = max(AirTemp_STest75_1718);
MinAirTemp_STest75_1718 = min(AirTemp_STest75_1718);
AirTempAmp_STest75_1718 = MaxAirTemp_STest75_1718 - MinAirTemp_STest75_1718;
SoilTemp_STest75_1718 = CLM_SoilTemp_20cm_STest75(41617:45984);
MaxSoilTemp_STest75_1718 = max(SoilTemp_STest75_1718);
MinSoilTemp_STest75_1718 = min(SoilTemp_STest75_1718);
SoilTempAmp_STest75_1718 = MaxSoilTemp_STest75_1718 - MinSoilTemp_STest75_1718;
ANorm_STest75_1718 = (AirTempAmp_STest75_1718 - SoilTempAmp_STest75_1718)/AirTempAmp_STest75_1718;

AirTemp_STest100_1718 = STest100_Hourly.AirTemp_CLM(41617:45984);
MaxAirTemp_STest100_1718 = max(AirTemp_STest100_1718);
MinAirTemp_STest100_1718 = min(AirTemp_STest100_1718);
AirTempAmp_STest100_1718 = MaxAirTemp_STest100_1718 - MinAirTemp_STest100_1718;
SoilTemp_STest100_1718 = CLM_SoilTemp_20cm_STest100(41617:45984);
MaxSoilTemp_STest100_1718 = max(SoilTemp_STest100_1718);
MinSoilTemp_STest100_1718 = min(SoilTemp_STest100_1718);
SoilTempAmp_STest100_1718 = MaxSoilTemp_STest100_1718 - MinSoilTemp_STest100_1718;
ANorm_STest100_1718 = (AirTempAmp_STest100_1718 - SoilTempAmp_STest100_1718)/AirTempAmp_STest100_1718;

% 2018-19 - SnowSeason_1819 = 50377:54744
AirTemp_Run0_1819 = Run0_Hourly.AirTemp_CLM(50377:54744); 
MaxAirTemp_Run0_1819 = max(AirTemp_Run0_1819);
MinAirTemp_Run0_1819 = min(AirTemp_Run0_1819);
AirTempAmp_Run0_1819 = MaxAirTemp_Run0_1819 - MinAirTemp_Run0_1819;
SoilTemp_Run0_1819 = CLM_SoilTemp_20cm_Run0(50377:54744); 
MaxSoilTemp_Run0_1819 = max(SoilTemp_Run0_1819);
MinSoilTemp_Run0_1819 = min(SoilTemp_Run0_1819);
SoilTempAmp_Run0_1819 = MaxSoilTemp_Run0_1819 - MinSoilTemp_Run0_1819;
ANorm_Run0_1819 = (AirTempAmp_Run0_1819 - SoilTempAmp_Run0_1819)/AirTempAmp_Run0_1819;

AirTemp_STest25_1819 = STest25_Hourly.AirTemp_CLM(50377:54744); 
MaxAirTemp_STest25_1819 = max(AirTemp_STest25_1819);
MinAirTemp_STest25_1819 = min(AirTemp_STest25_1819);
AirTempAmp_STest25_1819 = MaxAirTemp_STest25_1819 - MinAirTemp_STest25_1819;
SoilTemp_STest25_1819 = CLM_SoilTemp_20cm_STest25(50377:54744); 
MaxSoilTemp_STest25_1819 = max(SoilTemp_STest25_1819);
MinSoilTemp_STest25_1819 = min(SoilTemp_STest25_1819);
SoilTempAmp_STest25_1819 = MaxSoilTemp_STest25_1819 - MinSoilTemp_STest25_1819;
ANorm_STest25_1819 = (AirTempAmp_STest25_1819 - SoilTempAmp_STest25_1819)/AirTempAmp_STest25_1819;

AirTemp_STest30_1819 = STest30_Hourly.AirTemp_CLM(50377:54744); 
MaxAirTemp_STest30_1819 = max(AirTemp_STest30_1819);
MinAirTemp_STest30_1819 = min(AirTemp_STest30_1819);
AirTempAmp_STest30_1819 = MaxAirTemp_STest30_1819 - MinAirTemp_STest30_1819;
SoilTemp_STest30_1819 = CLM_SoilTemp_20cm_STest30(50377:54744); 
MaxSoilTemp_STest30_1819 = max(SoilTemp_STest30_1819);
MinSoilTemp_STest30_1819 = min(SoilTemp_STest30_1819);
SoilTempAmp_STest30_1819 = MaxSoilTemp_STest30_1819 - MinSoilTemp_STest30_1819;
ANorm_STest30_1819 = (AirTempAmp_STest30_1819 - SoilTempAmp_STest30_1819)/AirTempAmp_STest30_1819;

AirTemp_STest35_1819 = STest35_Hourly.AirTemp_CLM(50377:54744); 
MaxAirTemp_STest35_1819 = max(AirTemp_STest35_1819);
MinAirTemp_STest35_1819 = min(AirTemp_STest35_1819);
AirTempAmp_STest35_1819 = MaxAirTemp_STest35_1819 - MinAirTemp_STest35_1819;
SoilTemp_STest35_1819 = CLM_SoilTemp_20cm_STest35(50377:54744); 
MaxSoilTemp_STest35_1819 = max(SoilTemp_STest35_1819);
MinSoilTemp_STest35_1819 = min(SoilTemp_STest35_1819);
SoilTempAmp_STest35_1819 = MaxSoilTemp_STest35_1819 - MinSoilTemp_STest35_1819;
ANorm_STest35_1819 = (AirTempAmp_STest35_1819 - SoilTempAmp_STest35_1819)/AirTempAmp_STest35_1819;

AirTemp_STest40_1819 = STest40_Hourly.AirTemp_CLM(50377:54744); 
MaxAirTemp_STest40_1819 = max(AirTemp_STest40_1819);
MinAirTemp_STest40_1819 = min(AirTemp_STest40_1819);
AirTempAmp_STest40_1819 = MaxAirTemp_STest40_1819 - MinAirTemp_STest40_1819;
SoilTemp_STest40_1819 = CLM_SoilTemp_20cm_STest40(50377:54744); 
MaxSoilTemp_STest40_1819 = max(SoilTemp_STest40_1819);
MinSoilTemp_STest40_1819 = min(SoilTemp_STest40_1819);
SoilTempAmp_STest40_1819 = MaxSoilTemp_STest40_1819 - MinSoilTemp_STest40_1819;
ANorm_STest40_1819 = (AirTempAmp_STest40_1819 - SoilTempAmp_STest40_1819)/AirTempAmp_STest40_1819;

AirTemp_STest45_1819 = STest45_Hourly.AirTemp_CLM(50377:54744); 
MaxAirTemp_STest45_1819 = max(AirTemp_STest45_1819);
MinAirTemp_STest45_1819 = min(AirTemp_STest45_1819);
AirTempAmp_STest45_1819 = MaxAirTemp_STest45_1819 - MinAirTemp_STest45_1819;
SoilTemp_STest45_1819 = CLM_SoilTemp_20cm_STest45(50377:54744); 
MaxSoilTemp_STest45_1819 = max(SoilTemp_STest45_1819);
MinSoilTemp_STest45_1819 = min(SoilTemp_STest45_1819);
SoilTempAmp_STest45_1819 = MaxSoilTemp_STest45_1819 - MinSoilTemp_STest45_1819;
ANorm_STest45_1819 = (AirTempAmp_STest45_1819 - SoilTempAmp_STest45_1819)/AirTempAmp_STest45_1819;

AirTemp_STest50_1819 = STest50_Hourly.AirTemp_CLM(50377:54744); 
MaxAirTemp_STest50_1819 = max(AirTemp_STest50_1819);
MinAirTemp_STest50_1819 = min(AirTemp_STest50_1819);
AirTempAmp_STest50_1819 = MaxAirTemp_STest50_1819 - MinAirTemp_STest50_1819;
SoilTemp_STest50_1819 = CLM_SoilTemp_20cm_STest50(50377:54744); 
MaxSoilTemp_STest50_1819 = max(SoilTemp_STest50_1819);
MinSoilTemp_STest50_1819 = min(SoilTemp_STest50_1819);
SoilTempAmp_STest50_1819 = MaxSoilTemp_STest50_1819 - MinSoilTemp_STest50_1819;
ANorm_STest50_1819 = (AirTempAmp_STest50_1819 - SoilTempAmp_STest50_1819)/AirTempAmp_STest50_1819;

AirTemp_STest55_1819 = STest55_Hourly.AirTemp_CLM(50377:54744); 
MaxAirTemp_STest55_1819 = max(AirTemp_STest55_1819);
MinAirTemp_STest55_1819 = min(AirTemp_STest55_1819);
AirTempAmp_STest55_1819 = MaxAirTemp_STest55_1819 - MinAirTemp_STest55_1819;
SoilTemp_STest55_1819 = CLM_SoilTemp_20cm_STest55(50377:54744); 
MaxSoilTemp_STest55_1819 = max(SoilTemp_STest55_1819);
MinSoilTemp_STest55_1819 = min(SoilTemp_STest55_1819);
SoilTempAmp_STest55_1819 = MaxSoilTemp_STest55_1819 - MinSoilTemp_STest55_1819;
ANorm_STest55_1819 = (AirTempAmp_STest55_1819 - SoilTempAmp_STest55_1819)/AirTempAmp_STest55_1819;

AirTemp_STest60_1819 = STest60_Hourly.AirTemp_CLM(50377:54744); 
MaxAirTemp_STest60_1819 = max(AirTemp_STest60_1819);
MinAirTemp_STest60_1819 = min(AirTemp_STest60_1819);
AirTempAmp_STest60_1819 = MaxAirTemp_STest60_1819 - MinAirTemp_STest60_1819;
SoilTemp_STest60_1819 = CLM_SoilTemp_20cm_STest60(50377:54744); 
MaxSoilTemp_STest60_1819 = max(SoilTemp_STest60_1819);
MinSoilTemp_STest60_1819 = min(SoilTemp_STest60_1819);
SoilTempAmp_STest60_1819 = MaxSoilTemp_STest60_1819 - MinSoilTemp_STest60_1819;
ANorm_STest60_1819 = (AirTempAmp_STest60_1819 - SoilTempAmp_STest60_1819)/AirTempAmp_STest60_1819;

AirTemp_STest65_1819 = STest65_Hourly.AirTemp_CLM(50377:54744); 
MaxAirTemp_STest65_1819 = max(AirTemp_STest65_1819);
MinAirTemp_STest65_1819 = min(AirTemp_STest65_1819);
AirTempAmp_STest65_1819 = MaxAirTemp_STest65_1819 - MinAirTemp_STest65_1819;
SoilTemp_STest65_1819 = CLM_SoilTemp_20cm_STest65(50377:54744); 
MaxSoilTemp_STest65_1819 = max(SoilTemp_STest65_1819);
MinSoilTemp_STest65_1819 = min(SoilTemp_STest65_1819);
SoilTempAmp_STest65_1819 = MaxSoilTemp_STest65_1819 - MinSoilTemp_STest65_1819;
ANorm_STest65_1819 = (AirTempAmp_STest65_1819 - SoilTempAmp_STest65_1819)/AirTempAmp_STest65_1819;

AirTemp_STest70_1819 = STest70_Hourly.AirTemp_CLM(50377:54744); 
MaxAirTemp_STest70_1819 = max(AirTemp_STest70_1819);
MinAirTemp_STest70_1819 = min(AirTemp_STest70_1819);
AirTempAmp_STest70_1819 = MaxAirTemp_STest70_1819 - MinAirTemp_STest70_1819;
SoilTemp_STest70_1819 = CLM_SoilTemp_20cm_STest70(50377:54744); 
MaxSoilTemp_STest70_1819 = max(SoilTemp_STest70_1819);
MinSoilTemp_STest70_1819 = min(SoilTemp_STest70_1819);
SoilTempAmp_STest70_1819 = MaxSoilTemp_STest70_1819 - MinSoilTemp_STest70_1819;
ANorm_STest70_1819 = (AirTempAmp_STest70_1819 - SoilTempAmp_STest70_1819)/AirTempAmp_STest70_1819;

AirTemp_STest75_1819 = STest75_Hourly.AirTemp_CLM(50377:54744); 
MaxAirTemp_STest75_1819 = max(AirTemp_STest75_1819);
MinAirTemp_STest75_1819 = min(AirTemp_STest75_1819);
AirTempAmp_STest75_1819 = MaxAirTemp_STest75_1819 - MinAirTemp_STest75_1819;
SoilTemp_STest75_1819 = CLM_SoilTemp_20cm_STest75(50377:54744); 
MaxSoilTemp_STest75_1819 = max(SoilTemp_STest75_1819);
MinSoilTemp_STest75_1819 = min(SoilTemp_STest75_1819);
SoilTempAmp_STest75_1819 = MaxSoilTemp_STest75_1819 - MinSoilTemp_STest75_1819;
ANorm_STest75_1819 = (AirTempAmp_STest75_1819 - SoilTempAmp_STest75_1819)/AirTempAmp_STest75_1819;

AirTemp_STest100_1819 = STest100_Hourly.AirTemp_CLM(50377:54744); 
MaxAirTemp_STest100_1819 = max(AirTemp_STest100_1819);
MinAirTemp_STest100_1819 = min(AirTemp_STest100_1819);
AirTempAmp_STest100_1819 = MaxAirTemp_STest100_1819 - MinAirTemp_STest100_1819;
SoilTemp_STest100_1819 = CLM_SoilTemp_20cm_STest100(50377:54744); 
MaxSoilTemp_STest100_1819 = max(SoilTemp_STest100_1819);
MinSoilTemp_STest100_1819 = min(SoilTemp_STest100_1819);
SoilTempAmp_STest100_1819 = MaxSoilTemp_STest100_1819 - MinSoilTemp_STest100_1819;
ANorm_STest100_1819 = (AirTempAmp_STest100_1819 - SoilTempAmp_STest100_1819)/AirTempAmp_STest100_1819;

% SHTM = 1 - sqrt(2*(ANorm_CLM - ANorm_Obs)^2)

SHTM_1718_Run0 = 1 - sqrt(2*(ANorm_Run0_1718 - ANorm_Obs_1718)^2);
SHTM_1819_Run0 = 1 - sqrt(2*(ANorm_Run0_1819 - ANorm_Obs_1819)^2);
SHTM_1718_STest25 = 1 - sqrt(2*(ANorm_STest25_1718 - ANorm_Obs_1718)^2);
SHTM_1819_STest25 = 1 - sqrt(2*(ANorm_STest25_1819 - ANorm_Obs_1819)^2);
SHTM_1718_STest30 = 1 - sqrt(2*(ANorm_STest30_1718 - ANorm_Obs_1718)^2);
SHTM_1819_STest30 = 1 - sqrt(2*(ANorm_STest30_1819 - ANorm_Obs_1819)^2);
SHTM_1718_STest35 = 1 - sqrt(2*(ANorm_STest35_1718 - ANorm_Obs_1718)^2);
SHTM_1819_STest35 = 1 - sqrt(2*(ANorm_STest35_1819 - ANorm_Obs_1819)^2);
SHTM_1718_STest40 = 1 - sqrt(2*(ANorm_STest40_1718 - ANorm_Obs_1718)^2);
SHTM_1819_STest40 = 1 - sqrt(2*(ANorm_STest40_1819 - ANorm_Obs_1819)^2);
SHTM_1718_STest45 = 1 - sqrt(2*(ANorm_STest45_1718 - ANorm_Obs_1718)^2);
SHTM_1819_STest45 = 1 - sqrt(2*(ANorm_STest45_1819 - ANorm_Obs_1819)^2);
SHTM_1718_STest50 = 1 - sqrt(2*(ANorm_STest50_1718 - ANorm_Obs_1718)^2);
SHTM_1819_STest50 = 1 - sqrt(2*(ANorm_STest50_1819 - ANorm_Obs_1819)^2);
SHTM_1718_STest55 = 1 - sqrt(2*(ANorm_STest55_1718 - ANorm_Obs_1718)^2);
SHTM_1819_STest55 = 1 - sqrt(2*(ANorm_STest55_1819 - ANorm_Obs_1819)^2);
SHTM_1718_STest60 = 1 - sqrt(2*(ANorm_STest60_1718 - ANorm_Obs_1718)^2);
SHTM_1819_STest60 = 1 - sqrt(2*(ANorm_STest60_1819 - ANorm_Obs_1819)^2);
SHTM_1718_STest65 = 1 - sqrt(2*(ANorm_STest65_1718 - ANorm_Obs_1718)^2);
SHTM_1819_STest65 = 1 - sqrt(2*(ANorm_STest65_1819 - ANorm_Obs_1819)^2);
SHTM_1718_STest70 = 1 - sqrt(2*(ANorm_STest70_1718 - ANorm_Obs_1718)^2);
SHTM_1819_STest70 = 1 - sqrt(2*(ANorm_STest70_1819 - ANorm_Obs_1819)^2);
SHTM_1718_STest75 = 1 - sqrt(2*(ANorm_STest75_1718 - ANorm_Obs_1718)^2);
SHTM_1819_STest75 = 1 - sqrt(2*(ANorm_STest75_1819 - ANorm_Obs_1819)^2);
SHTM_1718_STest100 = 1 - sqrt(2*(ANorm_STest100_1718 - ANorm_Obs_1718)^2);
SHTM_1819_STest100 = 1 - sqrt(2*(ANorm_STest100_1819 - ANorm_Obs_1819)^2);

% collate SHTM
SHTM_STests_1718 = [SHTM_1718_Run0,SHTM_1718_STest25, SHTM_1718_STest30, SHTM_1718_STest35, SHTM_1718_STest40, SHTM_1718_STest45, SHTM_1718_STest50, SHTM_1718_STest55, SHTM_1718_STest60, SHTM_1718_STest65, SHTM_1718_STest70, SHTM_1718_STest75,SHTM_1718_STest100];  
SHTM_STests_1819 = [SHTM_1819_Run0,SHTM_1819_STest25, SHTM_1819_STest30, SHTM_1819_STest35, SHTM_1819_STest40, SHTM_1819_STest45, SHTM_1819_STest50, SHTM_1819_STest55, SHTM_1819_STest60, SHTM_1819_STest65, SHTM_1819_STest70, SHTM_1819_STest75,SHTM_1819_STest100];

% Pooled SHTM

AirTemp_Run0_Pooled = vertcat(AirTemp_Run0_1718,AirTemp_Run0_1819);
MaxAirTemp_Run0_Pooled = max(AirTemp_Run0_Pooled);
MinAirTemp_Run0_Pooled = min(AirTemp_Run0_Pooled);
AirTempAmp_Run0_Pooled = MaxAirTemp_Run0_Pooled - MinAirTemp_Run0_Pooled;
SoilTemp_Run0_Pooled = vertcat(SoilTemp_Run0_1718,SoilTemp_Run0_1819);
MaxSoilTemp_Run0_Pooled = max(SoilTemp_Run0_Pooled);
MinSoilTemp_Run0_Pooled = min(SoilTemp_Run0_Pooled);
SoilTempAmp_Run0_Pooled = MaxSoilTemp_Run0_Pooled - MinSoilTemp_Run0_Pooled;
ANorm_Run0_Pooled = (AirTempAmp_Run0_Pooled - SoilTempAmp_Run0_Pooled)/AirTempAmp_Run0_Pooled;

AirTemp_STest25_Pooled = vertcat(AirTemp_STest25_1718,AirTemp_STest25_1819);
MaxAirTemp_STest25_Pooled = max(AirTemp_STest25_Pooled);
MinAirTemp_STest25_Pooled = min(AirTemp_STest25_Pooled);
AirTempAmp_STest25_Pooled = MaxAirTemp_STest25_Pooled - MinAirTemp_STest25_Pooled;
SoilTemp_STest25_Pooled = vertcat(SoilTemp_STest25_1718,SoilTemp_STest25_1819);
MaxSoilTemp_STest25_Pooled = max(SoilTemp_STest25_Pooled);
MinSoilTemp_STest25_Pooled = min(SoilTemp_STest25_Pooled);
SoilTempAmp_STest25_Pooled = MaxSoilTemp_STest25_Pooled - MinSoilTemp_STest25_Pooled;
ANorm_STest25_Pooled = (AirTempAmp_STest25_Pooled - SoilTempAmp_STest25_Pooled)/AirTempAmp_STest25_Pooled;

AirTemp_STest30_Pooled = vertcat(AirTemp_STest30_1718,AirTemp_STest30_1819);
MaxAirTemp_STest30_Pooled = max(AirTemp_STest30_Pooled);
MinAirTemp_STest30_Pooled = min(AirTemp_STest30_Pooled);
AirTempAmp_STest30_Pooled = MaxAirTemp_STest30_Pooled - MinAirTemp_STest30_Pooled;
SoilTemp_STest30_Pooled = vertcat(SoilTemp_STest30_1718,SoilTemp_STest30_1819);
MaxSoilTemp_STest30_Pooled = max(SoilTemp_STest30_Pooled);
MinSoilTemp_STest30_Pooled = min(SoilTemp_STest30_Pooled);
SoilTempAmp_STest30_Pooled = MaxSoilTemp_STest30_Pooled - MinSoilTemp_STest30_Pooled;
ANorm_STest30_Pooled = (AirTempAmp_STest30_Pooled - SoilTempAmp_STest30_Pooled)/AirTempAmp_STest30_Pooled;

AirTemp_STest35_Pooled = vertcat(AirTemp_STest35_1718,AirTemp_STest35_1819);
MaxAirTemp_STest35_Pooled = max(AirTemp_STest35_Pooled);
MinAirTemp_STest35_Pooled = min(AirTemp_STest35_Pooled);
AirTempAmp_STest35_Pooled = MaxAirTemp_STest35_Pooled - MinAirTemp_STest35_Pooled;
SoilTemp_STest35_Pooled = vertcat(SoilTemp_STest35_1718,SoilTemp_STest35_1819);
MaxSoilTemp_STest35_Pooled = max(SoilTemp_STest35_Pooled);
MinSoilTemp_STest35_Pooled = min(SoilTemp_STest35_Pooled);
SoilTempAmp_STest35_Pooled = MaxSoilTemp_STest35_Pooled - MinSoilTemp_STest35_Pooled;
ANorm_STest35_Pooled = (AirTempAmp_STest35_Pooled - SoilTempAmp_STest35_Pooled)/AirTempAmp_STest35_Pooled;

AirTemp_STest40_Pooled = vertcat(AirTemp_STest40_1718,AirTemp_STest40_1819);
MaxAirTemp_STest40_Pooled = max(AirTemp_STest40_Pooled);
MinAirTemp_STest40_Pooled = min(AirTemp_STest40_Pooled);
AirTempAmp_STest40_Pooled = MaxAirTemp_STest40_Pooled - MinAirTemp_STest40_Pooled;
SoilTemp_STest40_Pooled = vertcat(SoilTemp_STest40_1718,SoilTemp_STest40_1819);
MaxSoilTemp_STest40_Pooled = max(SoilTemp_STest40_Pooled);
MinSoilTemp_STest40_Pooled = min(SoilTemp_STest40_Pooled);
SoilTempAmp_STest40_Pooled = MaxSoilTemp_STest40_Pooled - MinSoilTemp_STest40_Pooled;
ANorm_STest40_Pooled = (AirTempAmp_STest40_Pooled - SoilTempAmp_STest40_Pooled)/AirTempAmp_STest40_Pooled;

AirTemp_STest45_Pooled = vertcat(AirTemp_STest45_1718,AirTemp_STest45_1819);
MaxAirTemp_STest45_Pooled = max(AirTemp_STest45_Pooled);
MinAirTemp_STest45_Pooled = min(AirTemp_STest45_Pooled);
AirTempAmp_STest45_Pooled = MaxAirTemp_STest45_Pooled - MinAirTemp_STest45_Pooled;
SoilTemp_STest45_Pooled = vertcat(SoilTemp_STest45_1718,SoilTemp_STest45_1819);
MaxSoilTemp_STest45_Pooled = max(SoilTemp_STest45_Pooled);
MinSoilTemp_STest45_Pooled = min(SoilTemp_STest45_Pooled);
SoilTempAmp_STest45_Pooled = MaxSoilTemp_STest45_Pooled - MinSoilTemp_STest45_Pooled;
ANorm_STest45_Pooled = (AirTempAmp_STest45_Pooled - SoilTempAmp_STest45_Pooled)/AirTempAmp_STest45_Pooled;

AirTemp_STest50_Pooled = vertcat(AirTemp_STest50_1718,AirTemp_STest50_1819);
MaxAirTemp_STest50_Pooled = max(AirTemp_STest50_Pooled);
MinAirTemp_STest50_Pooled = min(AirTemp_STest50_Pooled);
AirTempAmp_STest50_Pooled = MaxAirTemp_STest50_Pooled - MinAirTemp_STest50_Pooled;
SoilTemp_STest50_Pooled = vertcat(SoilTemp_STest50_1718,SoilTemp_STest50_1819);
MaxSoilTemp_STest50_Pooled = max(SoilTemp_STest50_Pooled);
MinSoilTemp_STest50_Pooled = min(SoilTemp_STest50_Pooled);
SoilTempAmp_STest50_Pooled = MaxSoilTemp_STest50_Pooled - MinSoilTemp_STest50_Pooled;
ANorm_STest50_Pooled = (AirTempAmp_STest50_Pooled - SoilTempAmp_STest50_Pooled)/AirTempAmp_STest50_Pooled;

AirTemp_STest55_Pooled = vertcat(AirTemp_STest55_1718,AirTemp_STest55_1819);
MaxAirTemp_STest55_Pooled = max(AirTemp_STest55_Pooled);
MinAirTemp_STest55_Pooled = min(AirTemp_STest55_Pooled);
AirTempAmp_STest55_Pooled = MaxAirTemp_STest55_Pooled - MinAirTemp_STest55_Pooled;
SoilTemp_STest55_Pooled = vertcat(SoilTemp_STest55_1718,SoilTemp_STest55_1819);
MaxSoilTemp_STest55_Pooled = max(SoilTemp_STest55_Pooled);
MinSoilTemp_STest55_Pooled = min(SoilTemp_STest55_Pooled);
SoilTempAmp_STest55_Pooled = MaxSoilTemp_STest55_Pooled - MinSoilTemp_STest55_Pooled;
ANorm_STest55_Pooled = (AirTempAmp_STest55_Pooled - SoilTempAmp_STest55_Pooled)/AirTempAmp_STest55_Pooled;

AirTemp_STest60_Pooled = vertcat(AirTemp_STest60_1718,AirTemp_STest60_1819);
MaxAirTemp_STest60_Pooled = max(AirTemp_STest60_Pooled);
MinAirTemp_STest60_Pooled = min(AirTemp_STest60_Pooled);
AirTempAmp_STest60_Pooled = MaxAirTemp_STest60_Pooled - MinAirTemp_STest60_Pooled;
SoilTemp_STest60_Pooled = vertcat(SoilTemp_STest60_1718,SoilTemp_STest60_1819);
MaxSoilTemp_STest60_Pooled = max(SoilTemp_STest60_Pooled);
MinSoilTemp_STest60_Pooled = min(SoilTemp_STest60_Pooled);
SoilTempAmp_STest60_Pooled = MaxSoilTemp_STest60_Pooled - MinSoilTemp_STest60_Pooled;
ANorm_STest60_Pooled = (AirTempAmp_STest60_Pooled - SoilTempAmp_STest60_Pooled)/AirTempAmp_STest60_Pooled;

AirTemp_STest65_Pooled = vertcat(AirTemp_STest65_1718,AirTemp_STest65_1819);
MaxAirTemp_STest65_Pooled = max(AirTemp_STest65_Pooled);
MinAirTemp_STest65_Pooled = min(AirTemp_STest65_Pooled);
AirTempAmp_STest65_Pooled = MaxAirTemp_STest65_Pooled - MinAirTemp_STest65_Pooled;
SoilTemp_STest65_Pooled = vertcat(SoilTemp_STest65_1718,SoilTemp_STest65_1819);
MaxSoilTemp_STest65_Pooled = max(SoilTemp_STest65_Pooled);
MinSoilTemp_STest65_Pooled = min(SoilTemp_STest65_Pooled);
SoilTempAmp_STest65_Pooled = MaxSoilTemp_STest65_Pooled - MinSoilTemp_STest65_Pooled;
ANorm_STest65_Pooled = (AirTempAmp_STest65_Pooled - SoilTempAmp_STest65_Pooled)/AirTempAmp_STest65_Pooled;

AirTemp_STest70_Pooled = vertcat(AirTemp_STest70_1718,AirTemp_STest70_1819);
MaxAirTemp_STest70_Pooled = max(AirTemp_STest70_Pooled);
MinAirTemp_STest70_Pooled = min(AirTemp_STest70_Pooled);
AirTempAmp_STest70_Pooled = MaxAirTemp_STest70_Pooled - MinAirTemp_STest70_Pooled;
SoilTemp_STest70_Pooled = vertcat(SoilTemp_STest70_1718,SoilTemp_STest70_1819);
MaxSoilTemp_STest70_Pooled = max(SoilTemp_STest70_Pooled);
MinSoilTemp_STest70_Pooled = min(SoilTemp_STest70_Pooled);
SoilTempAmp_STest70_Pooled = MaxSoilTemp_STest70_Pooled - MinSoilTemp_STest70_Pooled;
ANorm_STest70_Pooled = (AirTempAmp_STest70_Pooled - SoilTempAmp_STest70_Pooled)/AirTempAmp_STest70_Pooled;

AirTemp_STest75_Pooled = vertcat(AirTemp_STest75_1718,AirTemp_STest75_1819);
MaxAirTemp_STest75_Pooled = max(AirTemp_STest75_Pooled);
MinAirTemp_STest75_Pooled = min(AirTemp_STest75_Pooled);
AirTempAmp_STest75_Pooled = MaxAirTemp_STest75_Pooled - MinAirTemp_STest75_Pooled;
SoilTemp_STest75_Pooled = vertcat(SoilTemp_STest75_1718,SoilTemp_STest75_1819);
MaxSoilTemp_STest75_Pooled = max(SoilTemp_STest75_Pooled);
MinSoilTemp_STest75_Pooled = min(SoilTemp_STest75_Pooled);
SoilTempAmp_STest75_Pooled = MaxSoilTemp_STest75_Pooled - MinSoilTemp_STest75_Pooled;
ANorm_STest75_Pooled = (AirTempAmp_STest75_Pooled - SoilTempAmp_STest75_Pooled)/AirTempAmp_STest75_Pooled;

AirTemp_Obs_Pooled = vertcat(AirTemp_Obs_1718,AirTemp_Obs_1819);
MaxAirTemp_Obs_Pooled = max(AirTemp_Obs_Pooled);
MinAirTemp_Obs_Pooled = min(AirTemp_Obs_Pooled);
AirTempAmp_Obs_Pooled = MaxAirTemp_Obs_Pooled - MinAirTemp_Obs_Pooled;
SoilTemp_Obs_Pooled = vertcat(SoilTempObs_1718,SoilTempObs_1819);
MaxSoilTemp_Obs_Pooled = max(SoilTemp_Obs_Pooled);
MinSoilTemp_Obs_Pooled = min(SoilTemp_Obs_Pooled);
SoilTempAmp_Obs_Pooled = MaxSoilTemp_Obs_Pooled - MinSoilTemp_Obs_Pooled;
ANorm_Obs_Pooled = (AirTempAmp_Obs_Pooled - SoilTempAmp_Obs_Pooled)/AirTempAmp_Obs_Pooled;

SHTM_Pooled_Run0 = 1 - sqrt(2*(ANorm_Run0_Pooled - ANorm_Obs_Pooled)^2);
SHTM_Pooled_STest25 = 1 - sqrt(2*(ANorm_STest25_Pooled - ANorm_Obs_Pooled)^2);
SHTM_Pooled_STest30 = 1 - sqrt(2*(ANorm_STest30_Pooled - ANorm_Obs_Pooled)^2);
SHTM_Pooled_STest35 = 1 - sqrt(2*(ANorm_STest35_Pooled - ANorm_Obs_Pooled)^2);
SHTM_Pooled_STest40 = 1 - sqrt(2*(ANorm_STest40_Pooled - ANorm_Obs_Pooled)^2);
SHTM_Pooled_STest45 = 1 - sqrt(2*(ANorm_STest45_Pooled - ANorm_Obs_Pooled)^2);
SHTM_Pooled_STest50 = 1 - sqrt(2*(ANorm_STest50_Pooled - ANorm_Obs_Pooled)^2);
SHTM_Pooled_STest55 = 1 - sqrt(2*(ANorm_STest55_Pooled - ANorm_Obs_Pooled)^2);
SHTM_Pooled_STest60 = 1 - sqrt(2*(ANorm_STest60_Pooled - ANorm_Obs_Pooled)^2);
SHTM_Pooled_STest65 = 1 - sqrt(2*(ANorm_STest65_Pooled - ANorm_Obs_Pooled)^2);
SHTM_Pooled_STest70 = 1 - sqrt(2*(ANorm_STest70_Pooled - ANorm_Obs_Pooled)^2);
SHTM_Pooled_STest75 = 1 - sqrt(2*(ANorm_STest75_Pooled - ANorm_Obs_Pooled)^2);

% SHTM - Sturm runs:
% A Norm
%interpolate 20cm CLM soil temp
CLM_SoilTemp_20cm_Run0_Sturm = Run0_Sturm_Hourly.SoilTemp_16cm_CLM + ((Run0_Sturm_Hourly.SoilTemp_26cm_CLM - Run0_Sturm_Hourly.SoilTemp_16cm_CLM)*0.4);
CLM_SoilTemp_20cm_ST40_Sturm = STest40_Sturm_Hourly.SoilTemp_16cm_CLM + ((STest40_Sturm_Hourly.SoilTemp_26cm_CLM - STest40_Sturm_Hourly.SoilTemp_16cm_CLM)*0.4);
CLM_SoilTemp_20cm_ST70_Sturm = STest70_Sturm_Hourly.SoilTemp_16cm_CLM + ((STest70_Sturm_Hourly.SoilTemp_26cm_CLM - STest70_Sturm_Hourly.SoilTemp_16cm_CLM)*0.4);
% 2017-18 - SnowSeason_1718 = 41617:45984
AirTemp_Run0_Sturm_1718 = Run0_Sturm_Hourly.AirTemp_CLM(41617:45984);
MaxAirTemp_Run0_Sturm_1718 = max(AirTemp_Run0_Sturm_1718);
MinAirTemp_Run0_Sturm_1718 = min(AirTemp_Run0_Sturm_1718);
AirTempAmp_Run0_Sturm_1718 = MaxAirTemp_Run0_Sturm_1718 - MinAirTemp_Run0_Sturm_1718;
SoilTemp_Run0_Sturm_1718 = CLM_SoilTemp_20cm_Run0_Sturm(41617:45984);
MaxSoilTemp_Run0_Sturm_1718 = max(SoilTemp_Run0_Sturm_1718);
MinSoilTemp_Run0_Sturm_1718 = min(SoilTemp_Run0_Sturm_1718);
SoilTempAmp_Run0_Sturm_1718 = MaxSoilTemp_Run0_Sturm_1718 - MinSoilTemp_Run0_Sturm_1718;
ANorm_Run0_Sturm_1718 = (AirTempAmp_Run0_Sturm_1718 - SoilTempAmp_Run0_Sturm_1718)/AirTempAmp_Run0_Sturm_1718;

AirTemp_ST40_Sturm_1718 = STest40_Sturm_Hourly.AirTemp_CLM(41617:45984);
MaxAirTemp_ST40_Sturm_1718 = max(AirTemp_ST40_Sturm_1718);
MinAirTemp_ST40_Sturm_1718 = min(AirTemp_ST40_Sturm_1718);
AirTempAmp_ST40_Sturm_1718 = MaxAirTemp_ST40_Sturm_1718 - MinAirTemp_ST40_Sturm_1718;
SoilTemp_ST40_Sturm_1718 = CLM_SoilTemp_20cm_ST40_Sturm(41617:45984);
MaxSoilTemp_ST40_Sturm_1718 = max(SoilTemp_ST40_Sturm_1718);
MinSoilTemp_ST40_Sturm_1718 = min(SoilTemp_ST40_Sturm_1718);
SoilTempAmp_ST40_Sturm_1718 = MaxSoilTemp_ST40_Sturm_1718 - MinSoilTemp_ST40_Sturm_1718;
ANorm_ST40_Sturm_1718 = (AirTempAmp_ST40_Sturm_1718 - SoilTempAmp_ST40_Sturm_1718)/AirTempAmp_ST40_Sturm_1718;

AirTemp_ST70_Sturm_1718 = STest70_Sturm_Hourly.AirTemp_CLM(41617:45984);
MaxAirTemp_ST70_Sturm_1718 = max(AirTemp_ST70_Sturm_1718);
MinAirTemp_ST70_Sturm_1718 = min(AirTemp_ST70_Sturm_1718);
AirTempAmp_ST70_Sturm_1718 = MaxAirTemp_ST70_Sturm_1718 - MinAirTemp_ST70_Sturm_1718;
SoilTemp_ST70_Sturm_1718 = CLM_SoilTemp_20cm_ST70_Sturm(41617:45984);
MaxSoilTemp_ST70_Sturm_1718 = max(SoilTemp_ST70_Sturm_1718);
MinSoilTemp_ST70_Sturm_1718 = min(SoilTemp_ST70_Sturm_1718);
SoilTempAmp_ST70_Sturm_1718 = MaxSoilTemp_ST70_Sturm_1718 - MinSoilTemp_ST70_Sturm_1718;
ANorm_ST70_Sturm_1718 = (AirTempAmp_ST70_Sturm_1718 - SoilTempAmp_ST70_Sturm_1718)/AirTempAmp_ST70_Sturm_1718;

% 2018-19 - SnowSeason_1819 = 50377:54744
AirTemp_Run0_Sturm_1819 = Run0_Sturm_Hourly.AirTemp_CLM(50377:54744); 
MaxAirTemp_Run0_Sturm_1819 = max(AirTemp_Run0_Sturm_1819);
MinAirTemp_Run0_Sturm_1819 = min(AirTemp_Run0_Sturm_1819);
AirTempAmp_Run0_Sturm_1819 = MaxAirTemp_Run0_Sturm_1819 - MinAirTemp_Run0_Sturm_1819;
SoilTemp_Run0_Sturm_1819 = CLM_SoilTemp_20cm_Run0_Sturm(50377:54744); 
MaxSoilTemp_Run0_Sturm_1819 = max(SoilTemp_Run0_Sturm_1819);
MinSoilTemp_Run0_Sturm_1819 = min(SoilTemp_Run0_Sturm_1819);
SoilTempAmp_Run0_Sturm_1819 = MaxSoilTemp_Run0_Sturm_1819 - MinSoilTemp_Run0_Sturm_1819;
ANorm_Run0_Sturm_1819 = (AirTempAmp_Run0_Sturm_1819 - SoilTempAmp_Run0_Sturm_1819)/AirTempAmp_Run0_Sturm_1819;

AirTemp_ST40_Sturm_1819 = STest40_Sturm_Hourly.AirTemp_CLM(50377:54744); 
MaxAirTemp_ST40_Sturm_1819 = max(AirTemp_ST40_Sturm_1819);
MinAirTemp_ST40_Sturm_1819 = min(AirTemp_ST40_Sturm_1819);
AirTempAmp_ST40_Sturm_1819 = MaxAirTemp_ST40_Sturm_1819 - MinAirTemp_ST40_Sturm_1819;
SoilTemp_ST40_Sturm_1819 = CLM_SoilTemp_20cm_ST40_Sturm(50377:54744); 
MaxSoilTemp_ST40_Sturm_1819 = max(SoilTemp_ST40_Sturm_1819);
MinSoilTemp_ST40_Sturm_1819 = min(SoilTemp_ST40_Sturm_1819);
SoilTempAmp_ST40_Sturm_1819 = MaxSoilTemp_ST40_Sturm_1819 - MinSoilTemp_ST40_Sturm_1819;
ANorm_ST40_Sturm_1819 = (AirTempAmp_ST40_Sturm_1819 - SoilTempAmp_ST40_Sturm_1819)/AirTempAmp_ST40_Sturm_1819;

AirTemp_ST70_Sturm_1819 = STest70_Sturm_Hourly.AirTemp_CLM(50377:54744); 
MaxAirTemp_ST70_Sturm_1819 = max(AirTemp_ST70_Sturm_1819);
MinAirTemp_ST70_Sturm_1819 = min(AirTemp_ST70_Sturm_1819);
AirTempAmp_ST70_Sturm_1819 = MaxAirTemp_ST70_Sturm_1819 - MinAirTemp_ST70_Sturm_1819;
SoilTemp_ST70_Sturm_1819 = CLM_SoilTemp_20cm_ST70_Sturm(50377:54744); 
MaxSoilTemp_ST70_Sturm_1819 = max(SoilTemp_ST70_Sturm_1819);
MinSoilTemp_ST70_Sturm_1819 = min(SoilTemp_ST70_Sturm_1819);
SoilTempAmp_ST70_Sturm_1819 = MaxSoilTemp_ST70_Sturm_1819 - MinSoilTemp_ST70_Sturm_1819;
ANorm_ST70_Sturm_1819 = (AirTempAmp_ST70_Sturm_1819 - SoilTempAmp_ST70_Sturm_1819)/AirTempAmp_ST70_Sturm_1819;

% SHTM = 1 - sqrt(2*(ANorm_CLM - ANorm_Obs)^2)

SHTM_1718_Run0 = 1 - sqrt(2*(ANorm_Run0_1718 - ANorm_Obs_1718)^2);
SHTM_1819_Run0 = 1 - sqrt(2*(ANorm_Run0_1819 - ANorm_Obs_1819)^2);
SHTM_1718_ST40_Sturm = 1 - sqrt(2*(ANorm_ST40_Sturm_1718 - ANorm_Obs_1718)^2);
SHTM_1819_ST40_Sturm = 1 - sqrt(2*(ANorm_ST40_Sturm_1819 - ANorm_Obs_1819)^2);
SHTM_1718_ST70_Sturm = 1 - sqrt(2*(ANorm_ST70_Sturm_1718 - ANorm_Obs_1718)^2);
SHTM_1819_ST70_Sturm = 1 - sqrt(2*(ANorm_ST70_Sturm_1819 - ANorm_Obs_1819)^2);

% Pooled SHTM
AirTemp_Run0_Sturm_Pooled = vertcat(AirTemp_Run0_Sturm_1718,AirTemp_Run0_Sturm_1819);
MaxAirTemp_Run0_Sturm_Pooled = max(AirTemp_Run0_Sturm_Pooled);
MinAirTemp_Run0_Sturm_Pooled = min(AirTemp_Run0_Sturm_Pooled);
AirTempAmp_Run0_Sturm_Pooled = MaxAirTemp_Run0_Sturm_Pooled - MinAirTemp_Run0_Sturm_Pooled;
SoilTemp_Run0_Sturm_Pooled = vertcat(SoilTemp_Run0_Sturm_1718,SoilTemp_Run0_Sturm_1819);
MaxSoilTemp_Run0_Sturm_Pooled = max(SoilTemp_Run0_Sturm_Pooled);
MinSoilTemp_Run0_Sturm_Pooled = min(SoilTemp_Run0_Sturm_Pooled);
SoilTempAmp_Run0_Sturm_Pooled = MaxSoilTemp_Run0_Sturm_Pooled - MinSoilTemp_Run0_Sturm_Pooled;
ANorm_Run0_Sturm_Pooled = (AirTempAmp_Run0_Sturm_Pooled - SoilTempAmp_Run0_Sturm_Pooled)/AirTempAmp_Run0_Sturm_Pooled;

AirTemp_ST40_Sturm_Pooled = vertcat(AirTemp_ST40_Sturm_1718,AirTemp_ST40_Sturm_1819);
MaxAirTemp_ST40_Sturm_Pooled = max(AirTemp_ST40_Sturm_Pooled);
MinAirTemp_ST40_Sturm_Pooled = min(AirTemp_ST40_Sturm_Pooled);
AirTempAmp_ST40_Sturm_Pooled = MaxAirTemp_ST40_Sturm_Pooled - MinAirTemp_ST40_Sturm_Pooled;
SoilTemp_ST40_Sturm_Pooled = vertcat(SoilTemp_ST40_Sturm_1718,SoilTemp_ST40_Sturm_1819);
MaxSoilTemp_ST40_Sturm_Pooled = max(SoilTemp_ST40_Sturm_Pooled);
MinSoilTemp_ST40_Sturm_Pooled = min(SoilTemp_ST40_Sturm_Pooled);
SoilTempAmp_ST40_Sturm_Pooled = MaxSoilTemp_ST40_Sturm_Pooled - MinSoilTemp_ST40_Sturm_Pooled;
ANorm_ST40_Sturm_Pooled = (AirTempAmp_ST40_Sturm_Pooled - SoilTempAmp_ST40_Sturm_Pooled)/AirTempAmp_ST40_Sturm_Pooled;

AirTemp_ST70_Sturm_Pooled = vertcat(AirTemp_ST70_Sturm_1718,AirTemp_ST70_Sturm_1819);
MaxAirTemp_ST70_Sturm_Pooled = max(AirTemp_ST70_Sturm_Pooled);
MinAirTemp_ST70_Sturm_Pooled = min(AirTemp_ST70_Sturm_Pooled);
AirTempAmp_ST70_Sturm_Pooled = MaxAirTemp_ST70_Sturm_Pooled - MinAirTemp_ST70_Sturm_Pooled;
SoilTemp_ST70_Sturm_Pooled = vertcat(SoilTemp_ST70_Sturm_1718,SoilTemp_ST70_Sturm_1819);
MaxSoilTemp_ST70_Sturm_Pooled = max(SoilTemp_ST70_Sturm_Pooled);
MinSoilTemp_ST70_Sturm_Pooled = min(SoilTemp_ST70_Sturm_Pooled);
SoilTempAmp_ST70_Sturm_Pooled = MaxSoilTemp_ST70_Sturm_Pooled - MinSoilTemp_ST70_Sturm_Pooled;
ANorm_ST70_Sturm_Pooled = (AirTempAmp_ST70_Sturm_Pooled - SoilTempAmp_ST70_Sturm_Pooled)/AirTempAmp_ST70_Sturm_Pooled;

SHTM_Pooled_Run0_Sturm = 1 - sqrt(2*(ANorm_Run0_Sturm_Pooled - ANorm_Obs_Pooled)^2);
SHTM_Pooled_ST40_Sturm = 1 - sqrt(2*(ANorm_ST40_Sturm_Pooled - ANorm_Obs_Pooled)^2);
SHTM_Pooled_ST70_Sturm = 1 - sqrt(2*(ANorm_ST70_Sturm_Pooled - ANorm_Obs_Pooled)^2);

%% Fig. 8 Plot - RMSE & SHTM 
figure()
yyaxis left 
hold on
plot(Multiplier, RMSE_Winter1718_ALL, 'k', 'Linewidth', 1.5)
plot(Multiplier, RMSE_Winter1819_ALL, 'LineStyle', '-', 'Color', [0.4660, 0.6740, 0.1880], 'Linewidth', 1.5)
ylim([0 10])
set(gca,'ycolor','k')
ylabel('RMSE [^oC]')
yyaxis right
plot(Multiplier, SHTM_STests_1718, 'k--', 'Linewidth', 1.5)
plot(Multiplier, SHTM_STests_1819, 'Color', [0.4660, 0.6740, 0.1880], 'Linewidth', 1.5)
hold off
ylim([0 1])
set(gca,'ycolor','k')
ylabel('SHTM')
xlabel('Multiplier [\alpha]') % revisit x label?

%% Fig. 9 - Best Fit Correction

%  Determine Best fit correction
%  Find absolute difference for each run 
TempDifference_Baseline = abs(Run0_Daily.SoilTemp_10cm_Obs - Run0_Daily.SoilTemp_10cm_CLM);
TempDifference_STest25 = abs(Run0_Daily.SoilTemp_10cm_Obs - STest25_Daily.SoilTemp_10cm_CLM);
TempDifference_STest30 = abs(Run0_Daily.SoilTemp_10cm_Obs - STest30_Daily.SoilTemp_10cm_CLM);
TempDifference_STest35 = abs(Run0_Daily.SoilTemp_10cm_Obs - STest35_Daily.SoilTemp_10cm_CLM);
TempDifference_STest40 = abs(Run0_Daily.SoilTemp_10cm_Obs - STest40_Daily.SoilTemp_10cm_CLM);
TempDifference_STest45 = abs(Run0_Daily.SoilTemp_10cm_Obs - STest45_Daily.SoilTemp_10cm_CLM);
TempDifference_STest50 = abs(Run0_Daily.SoilTemp_10cm_Obs - STest50_Daily.SoilTemp_10cm_CLM);
TempDifference_STest55 = abs(Run0_Daily.SoilTemp_10cm_Obs - STest55_Daily.SoilTemp_10cm_CLM);
TempDifference_STest60 = abs(Run0_Daily.SoilTemp_10cm_Obs - STest60_Daily.SoilTemp_10cm_CLM);
TempDifference_STest65 = abs(Run0_Daily.SoilTemp_10cm_Obs - STest65_Daily.SoilTemp_10cm_CLM);
TempDifference_STest70 = abs(Run0_Daily.SoilTemp_10cm_Obs - STest70_Daily.SoilTemp_10cm_CLM);
TempDifference_STest75 = abs(Run0_Daily.SoilTemp_10cm_Obs - STest75_Daily.SoilTemp_10cm_CLM);
%(columns L-R: Baseline, -25%, -30%, % -35%, -40%, -45%, -50%, -55%, -60%, -65%, -70%, -75%)
TempDifference_ALL = horzcat(TempDifference_Baseline, TempDifference_STest25, TempDifference_STest30, TempDifference_STest35, TempDifference_STest40,...
     TempDifference_STest45, TempDifference_STest50, TempDifference_STest55, TempDifference_STest60,  TempDifference_STest65,  TempDifference_STest70,  TempDifference_STest75);
 
% Best fit = min temp differences
[M,index] = min(TempDifference_ALL, [], 2, 'includenan');
% M = abs closest temp, index = column it came from

% Convert column numbers back to percent correction
index = int32(index);
BestFitCorrection= zeros(length(index),1);
for i= 1:length(index)
    if index(i) == 1
        BestFitCorrection(i) = 1;
    elseif index(i) == 2
        BestFitCorrection(i) = 0.75;
    elseif index(i) == 3
        BestFitCorrection(i) = 0.70;
    elseif index(i) == 4
        BestFitCorrection(i) = 0.65;
    elseif index(i) == 5
        BestFitCorrection(i) = 0.6;
    elseif index(i) == 6
        BestFitCorrection(i) = 0.55;
    elseif index(i) == 7
        BestFitCorrection(i) = 0.5;
    elseif index(i) == 8
        BestFitCorrection(i) = 0.45;
    elseif index(i) == 9
        BestFitCorrection(i) = 0.4;
    elseif index(i) == 10
        BestFitCorrection(i) = 0.35;
    elseif index(i) == 11
        BestFitCorrection(i) = 0.3;
    elseif index(i) == 12
        BestFitCorrection(i) = 0.25;
    end
end

% Soil Temp Obs are NaN until Aug 2016, ignore 1st 1334 values. 

% Timeseries: 2017-18
AbsDepthError_1718 = (Run0_Daily.SnowDepth_MSC_obs(1719:1977)) - (Run0_Daily.SnowDepth_CLM(1719:1977)); %CLM-Obs
PercentDepthError_1718 = (AbsDepthError_1718./(Run0_Daily.SnowDepth_MSC_obs(1719:1977))).*100;
BestFitCorrection_1718 = BestFitCorrection(1719:1977);
EggPlotData_1718 = timetable(Run0_Daily.Time(1719:1977),Run0_Daily.SnowDepth_MSC_obs(1719:1977),Run0_Daily.SnowDepth_CLM(1719:1977),AbsDepthError_1718,PercentDepthError_1718,BestFitCorrection_1718);
EggPlotData_1718.Properties.VariableNames{1} = 'SnowDepth_Obs';
EggPlotData_1718.Properties.VariableNames{2} = 'SnowDepth_CLM';
EggPlotData_1718.Properties.VariableNames{3} = 'AbsDepthError';
EggPlotData_1718.Properties.VariableNames{4} = 'PercentDepthError';
EggPlotData_1718.Properties.VariableNames{5} = 'BestFitCorrection';

% Timeseries: 2018-19
AbsDepthError_1819 = (Run0_Daily.SnowDepth_MSC_obs(2084:2342)) - (Run0_Daily.SnowDepth_CLM(2084:2342)); %CLM-Obs
PercentDepthError_1819 = (AbsDepthError_1819./(Run0_Daily.SnowDepth_MSC_obs(2084:2342))).*100;
BestFitCorrection_1819 = BestFitCorrection(2084:2342);
EggPlotData_1819 = timetable(Run0_Daily.Time(2084:2342),Run0_Daily.SnowDepth_MSC_obs(2084:2342),Run0_Daily.SnowDepth_CLM(2084:2342),AbsDepthError_1819,PercentDepthError_1819,BestFitCorrection_1819);
EggPlotData_1819.Properties.VariableNames{1} = 'SnowDepth_Obs';
EggPlotData_1819.Properties.VariableNames{2} = 'SnowDepth_CLM';
EggPlotData_1819.Properties.VariableNames{3} = 'AbsDepthError';
EggPlotData_1819.Properties.VariableNames{4} = 'PercentDepthError';
EggPlotData_1819.Properties.VariableNames{5} = 'BestFitCorrection';

% % remove NaN/Inf & melt out rows?
EggPlotData_toplot_1718 = EggPlotData_1718(37:244,:); 
EggPlotData_toplot_1819 = EggPlotData_1819(11:239,:); 

EggPlotData = vertcat(EggPlotData_1718,EggPlotData_1819);
EggPlotData_nomelt = vertcat(EggPlotData_toplot_1718,EggPlotData_toplot_1819);

% Leanne's Code for multi-linear regression
% Set up your X matrix: 1=Snow Depth, x2= Abs Depth Error
x1=EggPlotData_nomelt.SnowDepth_CLM;
x2=EggPlotData_nomelt.AbsDepthError;
y=EggPlotData_nomelt.BestFitCorrection;
X = [x1 x2 x1.*x2];
lm = fitlm(X,y) % Easier way to visualise things using this code!

% b(1) is intercept. b(2) is multiplier for x1. b(3)
% is multiplier for x2 b(4) is multiplier for x1*x2.

% Plot MLR
% Create some values for x1 and x2 to generate alphas (ymodelled) 
x1input=[0:0.05:0.5]';
x2input=[-0.1:0.2:0.5];

% loop through each value of error and each value of modelled depth to create a grid of predicted alpha corrections
for i=1:length(x1input)
    for j=1:length(x2input)
ymodelled(i,j) = lm.Coefficients.Estimate(1) + lm.Coefficients.Estimate(2)*x1input(i)+ lm.Coefficients.Estimate(3)*x2input(j) + lm.Coefficients.Estimate(4)*x1input(i)*x2input(j);
    end
end

% Sort out colourmap first
c = redbluecmap; % only has 11 colors, want to increase resolution
c_new1 = interp(c(:,1), 10);
c_new2 = abs(interp(c(:,2), 10));
c_new3 = interp(c(:,3), 10);
c_new = horzcat(c_new1,c_new2,c_new3);

figure()
t = tiledlayout(1,2);
nexttile
scatter(EggPlotData_toplot_1718.SnowDepth_Obs, EggPlotData_toplot_1718.SnowDepth_CLM,50,EggPlotData_toplot_1718.BestFitCorrection,'filled', 'MarkerEdgeColor','k')%17-18
hold on
scatter(EggPlotData_toplot_1819.SnowDepth_Obs, EggPlotData_toplot_1819.SnowDepth_CLM,70,EggPlotData_toplot_1819.BestFitCorrection,'filled', 's','MarkerEdgeColor','k')%18-19
colormap(c_new)
ylim([0 0.5])
xlim([0 0.5])
caxis([0.2 0.8])
ylabel(t,'Modelled Snow Depth [m]','FontSize',14)
xlabel('Observed Snow Depth [m]')
text(0.025, 0.475, 'a)','FontSize', 14) %label
pbaspect([1 1 1])
set(gca,'FontSize',14)
set(gca,'TickDir','out');

nexttile
pcolor(x2input',x1input',ymodelled);
shading interp
colormap(c_new)
caxis([0.2 0.8])
hold on
scatter(x2,x1,50,y,'filled','MarkerEdgeColor','k')
xlabel('Depth Error [m]')
text(-0.075, 0.475, 'b)','FontSize', 14,'Color','w') %label
pbaspect([1 1 1])
set(gca,'FontSize',14)
cb=colorbar;
cb.Label.String='Best Fit Multiplier [\alpha]';
set(gca,'TickDir','out');
% cb.Layout.Tile= 'east';

%% Effective Snow Depth Stats
% Effective Snow Depth = ((6*OctoberMeanSnowDepth) + (5*NovemberMeanSnowDepth) + (4*DecemberMeanSnowDepth) + (3*JanuaryMeanSnowDepth) + (2*FebuaryMeanSnowDepth) + (1*MarchMeanSnowDepth))/6

% Effective Snow Depth - In situ

% 2017-18
SnowDepth_Oct17Mean_MSC = (nanmean(Run0_Daily.SnowDepth_MSC_obs(1735:1765)))*100;
SnowDepth_Nov17Mean_MSC = (nanmean(Run0_Daily.SnowDepth_MSC_obs(1766:1795)))*100;
SnowDepth_Dec17Mean_MSC = (nanmean(Run0_Daily.SnowDepth_MSC_obs(1796:1826)))*100;
SnowDepth_Jan18Mean_MSC = (nanmean(Run0_Daily.SnowDepth_MSC_obs(1827:1857)))*100;
SnowDepth_Feb18Mean_MSC = (nanmean(Run0_Daily.SnowDepth_MSC_obs(1858:1885)))*100;
SnowDepth_March18Mean_MSC = (nanmean(Run0_Daily.SnowDepth_MSC_obs(1886:1916)))*100;

SnowDepthEff_MSC_201718 = ((6*SnowDepth_Oct17Mean_MSC) + (5*SnowDepth_Nov17Mean_MSC) + (4*SnowDepth_Dec17Mean_MSC) + (3*SnowDepth_Jan18Mean_MSC) + (2*SnowDepth_Feb18Mean_MSC) + (SnowDepth_March18Mean_MSC))/6;

%2018-19
SnowDepth_Oct18Mean_MSC = (nanmean(Run0_Daily.SnowDepth_MSC_obs(2100:2130)))*100;
SnowDepth_Nov18Mean_MSC = (nanmean(Run0_Daily.SnowDepth_MSC_obs(2131:2160)))*100;
SnowDepth_Dec18Mean_MSC = (nanmean(Run0_Daily.SnowDepth_MSC_obs(2161:2191)))*100;
SnowDepth_Jan19Mean_MSC = (nanmean(Run0_Daily.SnowDepth_MSC_obs(2192:2222)))*100;
SnowDepth_Feb19Mean_MSC = (nanmean(Run0_Daily.SnowDepth_MSC_obs(2223:2250)))*100;
SnowDepth_March19Mean_MSC = (nanmean(Run0_Daily.SnowDepth_MSC_obs(2251:2281)))*100;

SnowDepthEff_MSC_201819 = ((6*SnowDepth_Oct18Mean_MSC) + (5*SnowDepth_Nov18Mean_MSC) + (4*SnowDepth_Dec18Mean_MSC) + (3*SnowDepth_Jan19Mean_MSC) + (2*SnowDepth_Feb19Mean_MSC) + (SnowDepth_March19Mean_MSC))/6;

% Effective Snow Depth - CLM
% No changes made to snow depth in sensitivity tests, so use Run 0 only

% 2017-18
SnowDepth_Oct17Mean_CLM = (nanmean(Run0_Daily.SnowDepth_CLM(1735:1765)))*100;
SnowDepth_Nov17Mean_CLM = (nanmean(Run0_Daily.SnowDepth_CLM(1766:1795)))*100;
SnowDepth_Dec17Mean_CLM = (nanmean(Run0_Daily.SnowDepth_CLM(1796:1826)))*100;
SnowDepth_Jan18Mean_CLM = (nanmean(Run0_Daily.SnowDepth_CLM(1827:1857)))*100;
SnowDepth_Feb18Mean_CLM = (nanmean(Run0_Daily.SnowDepth_CLM(1858:1885)))*100;
SnowDepth_March18Mean_CLM = (nanmean(Run0_Daily.SnowDepth_CLM(1886:1916)))*100;

SnowDepthEff_CLM_201718 = ((6*SnowDepth_Oct17Mean_CLM) + (5*SnowDepth_Nov17Mean_CLM) + (4*SnowDepth_Dec17Mean_CLM) + (3*SnowDepth_Jan18Mean_CLM) + (2*SnowDepth_Feb18Mean_CLM) + (SnowDepth_March18Mean_CLM))/6;

% 2018-19
SnowDepth_Oct18Mean_CLM = (nanmean(Run0_Daily.SnowDepth_CLM(2100:2130)))*100;
SnowDepth_Nov18Mean_CLM = (nanmean(Run0_Daily.SnowDepth_CLM(2131:2160)))*100;
SnowDepth_Dec18Mean_CLM = (nanmean(Run0_Daily.SnowDepth_CLM(2161:2191)))*100;
SnowDepth_Jan19Mean_CLM = (nanmean(Run0_Daily.SnowDepth_CLM(2192:2222)))*100;
SnowDepth_Feb19Mean_CLM = (nanmean(Run0_Daily.SnowDepth_CLM(2223:2250)))*100;
SnowDepth_March19Mean_CLM = (nanmean(Run0_Daily.SnowDepth_CLM(2251:2281)))*100;

SnowDepthEff_CLM_201819 = ((6*SnowDepth_Oct18Mean_CLM) + (5*SnowDepth_Nov18Mean_CLM) + (4*SnowDepth_Dec18Mean_CLM) + (3*SnowDepth_Jan19Mean_CLM) + (2*SnowDepth_Feb19Mean_CLM) + (SnowDepth_March19Mean_CLM))/6;

%% Fig. A1 - Lucid chart figure
%% Fig. A2 - SMP Microstructure metrics

%import raw data
cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\TVCSnowpits\SMPProcessing\Results'
TVC_Merged_Comparison = readtable('TVC_Merged_Comparison_4.csv');
TVC_Merged_Comparison.Properties.VariableNames{11} = 'Proksch_RHO_mean';
TVC_Merged_Comparison.Properties.VariableNames{12} = 'Proksch_RHO_median';
TVC_Merged_Comparison.Properties.VariableNames{2} = 'Snowpit_RHO';

TVC_Merged_Comparison = removevars(TVC_Merged_Comparison, 'error'); %delete column so as not to cause confusion later

% Import recalibrated densities
TVC_Merged_K19a_RHO = readtable('TVC_Merged_k19adensities_incN_4.csv','ReadRowNames', true);
TVC_Merged_K19b_RHO = readtable('TVC_Merged_k19bdensities_incN_4.csv','ReadRowNames', true);

% Calculate error 
TVC_Merged_K19a_RHO(1,:) = []; %csv file has an empty row above the data
K19a_RHO = table2array(TVC_Merged_K19a_RHO);
clear TVC_Merged_K19a_RHO;

Merged_Snowpit_RHO = TVC_Merged_Comparison{:,2};
Error = (K19a_RHO - Merged_Snowpit_RHO);

IndexError = abs(Error) > 67.8; % Use to double check expected number of outliers (as stated in Jup. Notebook) have been removed

% Insert 'NaN' into K19b_RHO where error is greater than 103.9047 (95% error threashold, calculated in Josh's code)
% IndexError should equal 1 here and 0 everywhere else. 

TVC_Merged_K19b_RHO(1,:) = []; %csv file had an empty row above the data
Var1_new = nan(228,1);
Var1_new([4:17 19:61 63:67 70:79 81:85 87:109 111:168 170:195 197:228]) = TVC_Merged_K19b_RHO.Var1; 
K19b_RHO = Var1_new;

clear TVC_Merged_K19b_RHO

%Add K19a and K19b to table
TVC_Merged_Comparison = addvars(TVC_Merged_Comparison,K19a_RHO,K19b_RHO);

%Split K19b and Snowpit RHO into Jan and March so can colour code on plot
K19b_RHO_Jan = TVC_Merged_Comparison{1:185,17};
K19b_RHO_March = TVC_Merged_Comparison{186:end,17};
Snowpit_RHO_Jan = TVC_Merged_Comparison{1:185,2};
Snowpit_RHO_March = TVC_Merged_Comparison{186:end,2};

%Spilt Grain Types to Colour Code on Microstructure Plot
TVC_Merged_DH = TVC_Merged_Comparison([9:16,24:26,29:33,37:43,52:57,63:67,71:78,85:90,102:104,115:121,127:129,134,146:151,159:160,170:175,180:185,200:204,207:212,214:221,225:end],1:17);
TVC_Merged_R = TVC_Merged_Comparison([130:133,135:140,186:187,196:199,205:206,213,222:224],1:17);
TVC_Merged_F = TVC_Merged_Comparison([4:8,19:23,45:51,60:62,69:70,82:84,97:101,112:114,123:126,141:145,157:158,163:169,188:190],1:17);
TVC_Merged_N = TVC_Merged_Comparison([1:3,17:18,27:28,34:36,44,58:59,68,79:81,91:95,105:111,122,152:156,161:162,176:179],1:17);

% Spilt Grain Types to Plot
Snowpit_RHO_DH = TVC_Merged_DH{:,2};
LnF_DH = TVC_Merged_DH{:,15};
L_DH = TVC_Merged_DH{:,9};
FL_DH = (L_DH).*(LnF_DH);

Snowpit_RHO_R = TVC_Merged_R{:,2};
LnF_R = TVC_Merged_R{:,15};
L_R = TVC_Merged_R{:,9};
FL_R = (L_R).*(LnF_R);

Snowpit_RHO_F = TVC_Merged_F{:,2};
LnF_F = TVC_Merged_F{:,15};
L_F = TVC_Merged_F{:,9};
FL_F = (L_F).*(LnF_F);

Snowpit_RHO_N = TVC_Merged_N{:,2};
LnF_N = TVC_Merged_N{:,15};
L_N = TVC_Merged_N{:,9};
FL_N = (L_N).*(LnF_N);

% Plot
figure ()
x = [-5:2.5:5];
subplot(1,3,1) %LH plot - Snowpit density vs. ln(Median F)
hold on
plot(LnF_N, Snowpit_RHO_N,'k+');
plot(LnF_R, Snowpit_RHO_R,'k.','MarkerSize',12);
plot(LnF_F, Snowpit_RHO_F,'ks');
plot(LnF_DH, Snowpit_RHO_DH,'k^');
hold off
pbaspect ([1 1 1]);
ylim([0 500])
set(gca, 'xtick', x);
xlabel('Ln ($$\tilde{F}$$) [N]', 'Interpreter','latex') 
ylabel('Snowpit Density [kg m$$^3$$]', 'Interpreter','latex')  
text(-4.5, 470, 'a)','FontSize', 14) %label
set(gca,'FontSize', 16)

subplot(1,3,2) %middle plot - Snowpit density vs. L
hold on
plot(L_N, Snowpit_RHO_N,'k+');
plot(L_R, Snowpit_RHO_R,'k.','MarkerSize',12);
plot(L_F, Snowpit_RHO_F,'ks');
plot(L_DH, Snowpit_RHO_DH,'k^');
hold off
pbaspect ([1 1 1]);
xlabel('L [mm]', 'Interpreter','latex') 
ylim([0 500])
text(0.1, 470, 'b)','FontSize', 14) %label
set(gca,'FontSize', 16)

subplot(1,3,3) %RH plot - Snowpit density vs. F.L (interaction term)
hold on
plot(FL_N, Snowpit_RHO_N,'k+');
plot(FL_R, Snowpit_RHO_R,'k.','MarkerSize',12);
plot(FL_F, Snowpit_RHO_F,'ks');
plot(FL_DH, Snowpit_RHO_DH,'k^');
hold off
pbaspect ([1 1 1]);
ylim([0 500])
xlim([-5 5]) 
set(gca, 'xtick', x);
text(-4.5, 470, 'c)','FontSize', 14) %label
xlabel('Ln ($$\tilde{F}$$) $$\cdot$$ L [N mm]', 'Interpreter','latex') 
legend({'New Snow','Rounds', 'Facets', 'Depth Hoar'}, 'Location', 'SouthEast','FontSize',12); %'Interpreter','latex');
legend boxoff
set(gca,'FontSize', 16)

%% Fig B1. - Soil Profiles from Spinup

% Import Spin-ups
cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\CLMOutputData\SpinupTests\Baseline'
Run0_s2017_Daily = readtimetable('Run0_Daily.csv');

Run0_S2016_Daily = readtimetable('Run0_S1_Daily.csv');

Run0_S2015_Daily = readtimetable('Run0_S2_Daily.csv');

Run0_S2014_Daily = readtimetable('Run0_S3_Daily.csv');

cd 'D:\PhD Work\Data\Paper1Data_ToUpload\GitRepo_NEW\CLMOutputData\SpinupTests\Alpha=0.3'
STest70_s2017_Daily = readtimetable('STest_70_Daily.csv');

STest70_S2016_Daily = readtimetable('STest70_S1_Daily.csv');

STest70_S2015_Daily = readtimetable('STest70_S2_Daily.csv');

STest70_S2014_Daily = readtimetable('STest70_S3_Daily.csv');


% plot
figure()
t = tiledlayout(3,1,'TileSpacing','Compact'); 
y = [-30:10:20];
nexttile % 10cm
hold on
plot(Run0_Daily.Time, Run0_Daily.SoilTemp_10cm_CLM, 'Color',[0.6350 0.0780 0.1840],'LineWidth', 0.5, 'LineStyle','-');
plot(STest70_Daily.Time, STest70_Daily.SoilTemp_10cm_CLM, 'Color', [0 0.2235 0.3705],'LineWidth', 0.5, 'LineStyle','-');
plot(Run0_S2014_Daily.Time, Run0_S2014_Daily.SoilTemp_10cm_CLM, 'Color',[0.6350 0.0780 0.1840], 'Linestyle', '-.');
plot(STest70_S2014_Daily.Time, STest70_S2014_Daily.SoilTemp_10cm_CLM, 'Color', [0 0.2235 0.3705], 'LineStyle','-.');
plot(Run0_S2015_Daily.Time, Run0_S2015_Daily.SoilTemp_10cm_CLM, 'Color',[0.6350 0.0780 0.1840], 'Linestyle', ':');
plot(STest70_S2015_Daily.Time, STest70_S2015_Daily.SoilTemp_10cm_CLM, 'Color', [0 0.2235 0.3705], 'Linestyle', ':');
plot(Run0_S2016_Daily.Time, Run0_S2016_Daily.SoilTemp_10cm_CLM, 'Color',[0.6350 0.0780 0.1840], 'Linestyle', '--');
plot(STest70_S2016_Daily.Time, STest70_S2016_Daily.SoilTemp_10cm_CLM, 'Color', [0 0.2235 0.3705], 'Linestyle', '--');
plot(Run0_s2017_Daily.Time, Run0_s2017_Daily.SoilTemp_10cm_CLM, 'Color',[0.6350 0.0780 0.1840],'LineWidth', 1.5, 'LineStyle','-');
plot(STest70_s2017_Daily.Time, STest70_s2017_Daily.SoilTemp_10cm_CLM, 'Color', [0 0.2235 0.3705],'LineWidth', 1.5, 'LineStyle','-');
hold off
ylabel('10 cm')
ylim([-25 20])
set(gca, 'ytick', y);
set(gca,'FontSize', 12)
text(20, 15, 'a)','FontSize', 14) %label

nexttile % 1.7m
hold on
plot(Run0_Daily.Time, Run0_Daily.SoilTemp_170cm_CLM, 'Color',[0.6350 0.0780 0.1840],'LineWidth', 0.5, 'LineStyle','-');
plot(STest70_Daily.Time, STest70_Daily.SoilTemp_170cm_CLM, 'Color', [0 0.2235 0.3705],'LineWidth', 0.5, 'LineStyle','-');
plot(Run0_S2014_Daily.Time, Run0_S2014_Daily.SoilTemp_170cm_CLM, 'Color',[0.6350 0.0780 0.1840], 'Linestyle', '-.');
plot(STest70_S2014_Daily.Time, STest70_S2014_Daily.SoilTemp_170cm_CLM, 'Color', [0 0.2235 0.3705], 'LineStyle','-.');
plot(Run0_S2015_Daily.Time, Run0_S2015_Daily.SoilTemp_170cm_CLM, 'Color',[0.6350 0.0780 0.1840], 'Linestyle', ':');
plot(STest70_S2015_Daily.Time, STest70_S2015_Daily.SoilTemp_170cm_CLM, 'Color', [0 0.2235 0.3705], 'Linestyle', ':');
plot(Run0_S2016_Daily.Time, Run0_S2016_Daily.SoilTemp_170cm_CLM, 'Color',[0.6350 0.0780 0.1840], 'Linestyle', '--');
plot(STest70_S2016_Daily.Time, STest70_S2016_Daily.SoilTemp_170cm_CLM, 'Color', [0 0.2235 0.3705], 'Linestyle', '--');
plot(Run0_s2017_Daily.Time, Run0_s2017_Daily.SoilTemp_170cm_CLM, 'Color',[0.6350 0.0780 0.1840],'LineWidth', 1.5, 'LineStyle','-');
plot(STest70_s2017_Daily.Time, STest70_s2017_Daily.SoilTemp_170cm_CLM, 'Color', [0 0.2235 0.3705],'LineWidth', 1.5, 'LineStyle','-');
hold off
ylim([-25 5])
set(gca, 'ytick', y);
ylabel('1.7m')
set(gca,'FontSize', 12)
text(20, 3, 'b)','FontSize', 14) %label

nexttile % 4.3m
y = [-25:5:5];
hold on
plot(Run0_Daily.Time, Run0_Daily.SoilTemp_427cm_CLM, 'Color',[0.6350 0.0780 0.1840],'LineWidth', 0.5, 'LineStyle','-');
plot(STest70_Daily.Time, STest70_Daily.SoilTemp_427cm_CLM, 'Color', [0 0.2235 0.3705],'LineWidth', 0.5, 'LineStyle','-');
plot(Run0_S2014_Daily.Time, Run0_S2014_Daily.SoilTemp_427cm_CLM, 'Color',[0.6350 0.0780 0.1840], 'Linestyle', '-.');
plot(STest70_S2014_Daily.Time, STest70_S2014_Daily.SoilTemp_427cm_CLM, 'Color', [0 0.2235 0.3705], 'LineStyle','-.');
plot(Run0_S2015_Daily.Time, Run0_S2015_Daily.SoilTemp_427cm_CLM, 'Color',[0.6350 0.0780 0.1840], 'Linestyle', ':');
plot(STest70_S2015_Daily.Time, STest70_S2015_Daily.SoilTemp_427cm_CLM, 'Color', [0 0.2235 0.3705], 'Linestyle', ':');
plot(Run0_S2016_Daily.Time, Run0_S2016_Daily.SoilTemp_427cm_CLM, 'Color',[0.6350 0.0780 0.1840], 'Linestyle', '--');
plot(STest70_S2016_Daily.Time, STest70_S2016_Daily.SoilTemp_427cm_CLM, 'Color', [0 0.2235 0.3705], 'Linestyle', '--');
plot(Run0_s2017_Daily.Time, Run0_s2017_Daily.SoilTemp_427cm_CLM, 'Color',[0.6350 0.0780 0.1840],'LineWidth', 1.5, 'LineStyle','-');
plot(STest70_s2017_Daily.Time, STest70_s2017_Daily.SoilTemp_427cm_CLM, 'Color', [0 0.2235 0.3705],'LineWidth', 1.5, 'LineStyle','-');
hold off
ylabel('4.3m')
set(gca, 'ytick', y);
text(20, -1, 'c)','FontSize', 14) %label
ylabel(t,'Soil Temperature [^o C] at a depth of ...','FontSize', 14)
set(gca,'FontSize', 12)
legend({'2013', '2013', '2014', '2014', '2015', '2015','2016', '2016',  '2017', '2017',},'Location', 'SouthOutside', 'NumColumns', 5);
