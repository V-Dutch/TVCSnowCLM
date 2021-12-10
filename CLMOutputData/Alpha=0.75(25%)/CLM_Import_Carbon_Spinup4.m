% New CLM Import Script - Takes data from NetCDF & Observations and creates
% an array for each model run
%
% V. R. Dutch - March 2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Import Obs
cd 'D:\PhD Work\Data\Trail Valley Creek\Raw Data\Met Data\UoM';
RawObs = readtimetable('TVC_CLASSIC_2013_2020.csv');
RawObs_Hourly = retime(RawObs,'hourly'); % make same hourly resolution
RawObs_Hourly = RawObs_Hourly(1:61344,:);

cd 'D:\PhD Work\Modelling\CLM\Data for PointCLM\MetData';
GapfilledObs = readmatrix('ForcingData.csv');
start_1719 = datetime(2017,01,01);
end_1719 = datetime(2020,01,01);
R = start_1719:hours:end_1719;
R = R(1:26280);
GapfilledObs = array2timetable(GapfilledObs,'RowTimes', R);
RawObs_Hourly = synchronize(RawObs_Hourly,GapfilledObs); % adds forcing data to other obs and makes the same length

cd 'D:\PhD Work\Data\Trail Valley Creek\Raw Data\Met Data\Laurier'
EchosounderData = readtimetable('SnowDepth_Echosounder.csv');
EchosounderData_Hourly = EchosounderData(1:2:end,:); % make same hourly resolution
RawObs_Hourly = synchronize(RawObs_Hourly,EchosounderData_Hourly); % adds echousounder data to other obs and makes the same length

cd 'D:\PhD Work\Data\Trail Valley Creek\Raw Data\Met Data\MSC Snow Station'
MSC_Snowdepth = readtimetable('MSC_Snowdepth.csv'); 
MSC_Snowdepth.SnowDepth = MSC_Snowdepth.SnowDepth/100; % convert to m to match other snow depths
RawObs_Hourly = synchronize(RawObs_Hourly,MSC_Snowdepth); % adds MSC data to other obs and makes the same length

%% Import CLM Output
cd 'D:\PhD Work\Modelling\CLM\Output Data From CLM\Paper 1\GitRepo\SensitivityTests_SpinUp\Alpha=0.75(25%)' % folder for model run, needs changing every time
%% Import Snow Parameters
% Hourly Snow Parameters:
SnowDepth_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h0.2013-01-01-00000.nc','SNOWDP');
Snowfall_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h0.2013-01-01-00000.nc','SNOW');
SWE_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h0.2013-01-01-00000.nc','H2OSNO'); 
SnowCoverFraction_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h0.2013-01-01-00000.nc','FSNO');

% Remove midnight on 1st Jan
SnowDepth_CLM = SnowDepth_CLM(1:61344); 
Snowfall_CLM = Snowfall_CLM(1:61344);
SWE_CLM = SWE_CLM(1:61344);
SnowCoverFraction_CLM = SnowCoverFraction_CLM(1:61344);

% Rotate into columns
SnowDepth_CLM = rot90(SnowDepth_CLM,3);
Snowfall_CLM = rot90(Snowfall_CLM,3);
SWE_CLM = rot90(SWE_CLM,3);
SnowCoverFraction_CLM = rot90(SnowCoverFraction_CLM,3);

% Daily/Snow Layer Parameters:
SnowLayerPresence = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h4.2013-01-01-00000.nc', 'SNO_EXISTENCE'); 
% 1 = Layer Present, 0 = Layer absent, decimal = proportion of hourly timestep layer present for 
SnowLayerDensities = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h4.2013-01-01-00000.nc','SNO_RHO'); %Only in runs 4 and onward
SnowLayerGrainRadii = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h4.2013-01-01-00000.nc','SNO_GS'); %Only in runs 6 and onward
SnowThermalConductivities = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h4.2013-01-01-00000.nc','SNO_TK');
SnowLayerThickness = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h4.2013-01-01-00000.nc','SNO_Z');
SnowLayerTemps = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h4.2013-01-01-00000.nc','SNO_T');
SnowLayerTemps = SnowLayerTemps - 273.15; % convert units
SnowIceContent = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h4.2013-01-01-00000.nc','SNO_ICE'); % hoping this will help explain density/Keff relationship
SnowLiquidWater = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h4.2013-01-01-00000.nc','SNO_LIQH2O'); % hoping this will help explain density/Keff relationship

% Reshape - one row per snow layer
SnowLayerPresence = reshape(SnowLayerPresence,12,[]);
SnowLayers = sum(SnowLayerPresence); % number of snowpack layers per timestep
SnowLayerTemps = reshape(SnowLayerTemps,12,[]);
SnowThermalConductivities = reshape(SnowThermalConductivities,12,[]);
SnowLayerThickness = reshape(SnowLayerThickness,12,[]);
SnowLayerDensities = reshape(SnowLayerDensities,12,[]);
SnowLayerGrainRadii = reshape(SnowLayerGrainRadii,12,[]);
SnowIceContent = reshape(SnowIceContent,12,[]);
SnowLiquidWater = reshape(SnowLiquidWater,12,[]);

z = max(SnowLayers,[],'all'); % crop additional rows off of above to get rid of unnessacery NaNs
SnowLayerTemps(all(isnan(SnowLayerTemps),2),:) = []; %removes rows that are all NaN, remaining matrix should have z rows
SnowThermalConductivities(all(isnan(SnowThermalConductivities),2),:) = []; %as above
SnowLayerThickness(all(isnan(SnowLayerThickness),2),:) = []; %as above
SnowLayerDensities(all(isnan(SnowLayerDensities),2),:) = []; %as above
SnowLayerGrainRadii(all(isnan(SnowLayerGrainRadii),2),:) = []; %as above
SnowIceContent(all(isnan(SnowIceContent),2),:) = []; % as above
SnowLiquidWater(all(isnan(SnowLiquidWater),2),:) = []; %as above

% Remove midnight on Jan 1st
SnowLayerTemps(:,2556) = [];
SnowThermalConductivities(:,2556) = [];
SnowLayerThickness(:,2556) = [];
SnowLayerDensities(:,2556) = [];
SnowLayerGrainRadii(:,2556) = [];
SnowIceContent(:,2556) = [];
SnowLiquidWater(:,2556) = [];

% Rotate into columns
SnowLayerTemps = flipud(rot90(SnowLayerTemps));
SnowThermalConductivities = flipud(rot90(SnowThermalConductivities));
SnowLayerThickness = flipud(rot90(SnowLayerThickness));
SnowLayerDensities = flipud(rot90(SnowLayerDensities));
SnowLayerGrainRadii = flipud(rot90(SnowLayerGrainRadii));
SnowLayerGrainRadii = SnowLayerGrainRadii/1000; % convert to mm
SnowIceContent = flipud(rot90(SnowIceContent));
SnowLiquidWater = flipud(rot90(SnowLiquidWater));
%% Import Soil Parameters
% Hourly Soil Parameters:
SoilTemp_10cm_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h1.2013-01-01-00000.nc','TSOI_10CM');
SoilTemp_10cm_CLM = SoilTemp_10cm_CLM - 273.15; % convert units

% Remove midnight on 1st Jan
SoilTemp_10cm_CLM = SoilTemp_10cm_CLM(1:61344); 

% Rotate into columns
SoilTemp_10cm_CLM = rot90(SoilTemp_10cm_CLM,3);

% Soil Layer Parameters:
SoilLayerTemps_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h1.2013-01-01-00000.nc','TSOI');
SoilLayerTemps_CLM = (SoilLayerTemps_CLM - 273.15); %convert units
SoilLayerTemps_CLM = reshape(SoilLayerTemps_CLM,25,[]); %one row per layer
% ADD ICE/WATER CONTENT
SoilLayerPotentialWater_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h1.2013-01-01-00000.nc','SOILPSI');
SoilLayerPotentialWater_CLM = reshape(SoilLayerPotentialWater_CLM,25,[]); %one row per layer

% Remove midnight on 1st Jan
SoilLayerTemps_CLM(:,52585) = [];
SoilLayerPotentialWater_CLM(:,52585) = [];

% Separate out relevant layers (Soil layers 1-5) and name with depths
% do I want to calculate 20 cm soil temp here? other "more standard" depths
% to match Obs? If not, need to export 16 and 26 to CSV to use for SHTM
CLM_SoilLayerDepths = [0.01, 0.04, 0.09, 0.16, 0.26, 0.4, 0.58, 0.8, 1.06, 1.36, 1.7, 2.08, 2.5, 2.99, 3.58, 4.27, 5.06, 5.95, 6.94, 8.03, 9.795, 13.328, 19.483, 28.871, 41.998];

SoilTemp_1cm_CLM = SoilLayerTemps_CLM(1,:);
SoilTemp_4cm_CLM = SoilLayerTemps_CLM(2,:);
SoilTemp_9cm_CLM = SoilLayerTemps_CLM(3,:);
SoilTemp_16cm_CLM = SoilLayerTemps_CLM(4,:);
SoilTemp_26cm_CLM = SoilLayerTemps_CLM(5,:);
SoilTemp_40cm_CLM = SoilLayerTemps_CLM(6,:);
SoilTemp_80cm_CLM = SoilLayerTemps_CLM(8,:);
SoilTemp_136cm_CLM = SoilLayerTemps_CLM(10,:);
SoilTemp_125cm_CLM = SoilLayerTemps_CLM(11,:);
SoilTemp_208cm_CLM = SoilLayerTemps_CLM(12,:);
SoilTemp_250cm_CLM = SoilLayerTemps_CLM(13,:);
SoilTemp_299cm_CLM = SoilLayerTemps_CLM(14,:);
SoilTemp_358cm_CLM = SoilLayerTemps_CLM(15,:);
SoilTemp_427cm_CLM = SoilLayerTemps_CLM(16,:);
% Additional Soil Layer Temps???
PotentialSoilWater_1cm_CLM = SoilLayerPotentialWater_CLM(1,:);
PotentialSoilWater_4cm_CLM = SoilLayerPotentialWater_CLM(2,:);
PotentialSoilWater_9cm_CLM = SoilLayerPotentialWater_CLM(3,:);
PotentialSoilWater_16cm_CLM = SoilLayerPotentialWater_CLM(4,:);
PotentialSoilWater_26cm_CLM = SoilLayerPotentialWater_CLM(5,:);

% Rotate into columns
SoilTemp_1cm_CLM = rot90(SoilTemp_1cm_CLM,3);
SoilTemp_4cm_CLM = rot90(SoilTemp_4cm_CLM,3);
SoilTemp_9cm_CLM = rot90(SoilTemp_9cm_CLM,3);
SoilTemp_16cm_CLM = rot90(SoilTemp_16cm_CLM,3);
SoilTemp_26cm_CLM = rot90(SoilTemp_26cm_CLM,3);
SoilTemp_40cm_CLM = rot90(SoilTemp_40cm_CLM,3);
SoilTemp_80cm_CLM = rot90(SoilTemp_80cm_CLM,3);
SoilTemp_136cm_CLM = rot90(SoilTemp_136cm_CLM,3);
SoilTemp_125cm_CLM = rot90(SoilTemp_125cm_CLM,3);
SoilTemp_208cm_CLM = rot90(SoilTemp_208cm_CLM,3);
SoilTemp_250cm_CLM = rot90(SoilTemp_250cm_CLM,3);
SoilTemp_299cm_CLM = rot90(SoilTemp_299cm_CLM,3);
SoilTemp_358cm_CLM = rot90(SoilTemp_358cm_CLM,3);
SoilTemp_427cm_CLM = rot90(SoilTemp_427cm_CLM,3);
% Additional Soil Layer Temps???
PotentialSoilWater_1cm_CLM = rot90(PotentialSoilWater_1cm_CLM,3);
PotentialSoilWater_4cm_CLM = rot90(PotentialSoilWater_4cm_CLM,3);
PotentialSoilWater_9cm_CLM = rot90(PotentialSoilWater_9cm_CLM,3);
PotentialSoilWater_16cm_CLM = rot90(PotentialSoilWater_16cm_CLM,3);
PotentialSoilWater_26cm_CLM = rot90(PotentialSoilWater_26cm_CLM,3);

%% Import Carbon Parameters
% Hourly Carbon Parameters:
CO2Flux_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h2.2013-01-01-00000.nc','FCO2'); % Includes fires etc not in NEE
CH4Flux_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h2.2013-01-01-00000.nc','FCH4');

NEE_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h2.2013-01-01-00000.nc','NEE'); % NEE = NPP - ER
NPP_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h2.2013-01-01-00000.nc','NPP');
ER_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h2.2013-01-01-00000.nc','ER');
SoilResp_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h1.2013-01-01-00000.nc','SR'); 

% Remove midnight on 1st Jan
CO2Flux_CLM = CO2Flux_CLM(1:61344);
NEE_CLM = NEE_CLM(1:61344);
CH4Flux_CLM = CH4Flux_CLM(1:61344);
NPP_CLM = NPP_CLM(1:61344);
ER_CLM = ER_CLM(1:61344);
SoilResp_CLM = SoilResp_CLM(1:61344);

% CLM units = gC/m^2/s (for NEE, NPP etc)
% CLM units = kgC/m^2/s (for FCO2 & FCH4)
% Obs units = µmol CO2 m-2 s-1

% Convert gramsC to umol
% 12.01g per mol, then mol to umol
NEE_mol_CLM = (NEE_CLM/12.01);
NEE_umol_CLM = NEE_mol_CLM*1000000;

NPP_mol_CLM = (NPP_CLM/12.01);
NPP_umol_CLM = NPP_mol_CLM*1000000;

ER_mol_CLM = (ER_CLM/12.01);
ER_umol_CLM = ER_mol_CLM*1000000;

SoilResp_mol_CLM = (SoilResp_CLM/12.01);
SoilResp_umol_CLM = SoilResp_mol_CLM*1000000;

% Convert kilogramsC to umol
% 12.01g per mol, so 0.01201 kg per mol? Then mol to umol as before
CO2Flux_mol_CLM = (CO2Flux_CLM/(12.01/1000));
CO2Flux_umol_CLM = CO2Flux_mol_CLM*1000000;

CH4Flux_mol_CLM = (CH4Flux_CLM/(12.01/1000));
CH4Flux_umol_CLM = CH4Flux_mol_CLM*1000000;

% Rotate into columns
CO2Flux_umol_CLM = rot90(CO2Flux_umol_CLM,3);
NEE_umol_CLM = rot90(NEE_umol_CLM,3);
CH4Flux_umol_CLM = rot90(CH4Flux_umol_CLM,3);
NPP_umol_CLM = rot90(NPP_umol_CLM,3);
ER_umol_CLM = rot90(ER_umol_CLM,3);
SoilResp_umol_CLM = rot90(SoilResp_umol_CLM,3);

%% Import Meterological Parameters
% Hourly Met Parameters:
AirTemp_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h3.2013-01-01-00000.nc','TBOT');
AirTemp_CLM = AirTemp_CLM - 273.15; % convert units
Rainfall_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h3.2013-01-01-00000.nc','RAIN');
RelativeHumidity_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h3.2013-01-01-00000.nc','RH');
Shortwave_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h3.2013-01-01-00000.nc','FLDS');
Longwave_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h3.2013-01-01-00000.nc','FSDS');
Pressure_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h3.2013-01-01-00000.nc','PBOT');
Pressure_CLM = Pressure_CLM/1000; % convert to KPa to match Obs
Windspeed_CLM = ncread('Ptclm_TVC_lw0512_SnowRHO_Bulk25_Spinup4.clm2.h3.2013-01-01-00000.nc','WIND');

% Remove midnight on 1st Jan
AirTemp_CLM = AirTemp_CLM(1:61344);
Rainfall_CLM = Rainfall_CLM(1:61344);
RelativeHumidity_CLM = RelativeHumidity_CLM(1:61344);
Shortwave_CLM = Shortwave_CLM(1:61344);
Longwave_CLM = Longwave_CLM(1:61344);
Pressure_CLM = Pressure_CLM(1:61344);
Windspeed_CLM = Windspeed_CLM(1:61344);

% Rotate into columns
AirTemp_CLM = rot90(AirTemp_CLM,3);
Rainfall_CLM = rot90(Rainfall_CLM,3);
RelativeHumidity_CLM = rot90(RelativeHumidity_CLM,3);
Shortwave_CLM = rot90(Shortwave_CLM,3);
Longwave_CLM = rot90(Longwave_CLM,3);
Pressure_CLM = rot90(Pressure_CLM,3);
Windspeed_CLM = rot90(Windspeed_CLM,3);
%% Construct Timetable
% Hourly Parameters:
STest25_S4_Hourly = timetable(RawObs_Hourly.TIMESTAMP,RawObs_Hourly{:,6},AirTemp_CLM,RawObs_Hourly{:,7},RelativeHumidity_CLM,...
    RawObs_Hourly{:,37},Shortwave_CLM,RawObs_Hourly{:,38},Longwave_CLM,RawObs_Hourly{:,8},Pressure_CLM,... % insert wind here?
    RawObs_Hourly{:,44},Rainfall_CLM, RawObs_Hourly{:,45},Snowfall_CLM,RawObs_Hourly{:,46},RawObs_Hourly{:,47},SnowDepth_CLM, ... 
    SWE_CLM, SnowCoverFraction_CLM,... % additional CLM Snow Layer Parameters (Snow Layer Thickness, Snow Layer Density, Eff. Grain Size, Keff, Layer Temps)
    RawObs_Hourly{:,15}, RawObs_Hourly{:,16},RawObs_Hourly{:,17},RawObs_Hourly{:,18}, ... %observed soil temps
    SoilTemp_1cm_CLM,SoilTemp_4cm_CLM,SoilTemp_9cm_CLM,SoilTemp_10cm_CLM,SoilTemp_16cm_CLM, SoilTemp_26cm_CLM,... % CLM Soil temps
    SoilTemp_40cm_CLM,SoilTemp_80cm_CLM,SoilTemp_136cm_CLM,SoilTemp_125cm_CLM,SoilTemp_208cm_CLM,SoilTemp_250cm_CLM,SoilTemp_299cm_CLM,SoilTemp_358cm_CLM,SoilTemp_427cm_CLM,...% "Deep" CLM Soil temps
    PotentialSoilWater_1cm_CLM,RawObs_Hourly{:,19},PotentialSoilWater_4cm_CLM,RawObs_Hourly{:,20},PotentialSoilWater_9cm_CLM,RawObs_Hourly{:,21},...
    PotentialSoilWater_16cm_CLM,RawObs_Hourly{:,22},PotentialSoilWater_26cm_CLM,... % Do I want deeper soil parameters as well?    
    RawObs_Hourly{:,28},NEE_umol_CLM,RawObs_Hourly{:,32},CH4Flux_umol_CLM, ... % Carbon variables in final line have no Obs to compare to
    NPP_umol_CLM, ER_umol_CLM,CO2Flux_umol_CLM,SoilResp_umol_CLM); % More carbon variables

% rename columns
STest25_S4_Hourly.Properties.VariableNames{1} = 'AirTemp_Obs';
STest25_S4_Hourly.Properties.VariableNames{2} = 'AirTemp_CLM';
STest25_S4_Hourly.Properties.VariableNames{3} = 'RH_Obs';
STest25_S4_Hourly.Properties.VariableNames{4} = 'RH_CLM';
STest25_S4_Hourly.Properties.VariableNames{5} = 'Shortwave_Obs';
STest25_S4_Hourly.Properties.VariableNames{6} = 'Shortwave_CLM';
STest25_S4_Hourly.Properties.VariableNames{7} = 'Longwave_Obs';
STest25_S4_Hourly.Properties.VariableNames{8} = 'Longwave_CLM';
STest25_S4_Hourly.Properties.VariableNames{9} = 'AirPressure_Obs';
STest25_S4_Hourly.Properties.VariableNames{10} = 'AirPressure_CLM';
STest25_S4_Hourly.Properties.VariableNames{11} = 'Rainfall_Obs';
STest25_S4_Hourly.Properties.VariableNames{12} = 'Rainfall_CLM';
STest25_S4_Hourly.Properties.VariableNames{13} = 'Snowfall_Obs';
STest25_S4_Hourly.Properties.VariableNames{14} = 'Snowfall_CLM';
STest25_S4_Hourly.Properties.VariableNames{15} = 'SnowDepth_Echosounder_obs';
STest25_S4_Hourly.Properties.VariableNames{16} = 'SnowDepth_MSC_obs';
STest25_S4_Hourly.Properties.VariableNames{17} = 'SnowDepth_CLM';
STest25_S4_Hourly.Properties.VariableNames{18} = 'SWE_CLM';
STest25_S4_Hourly.Properties.VariableNames{19} = 'SCF_CLM';
% Want to splice in layer properties at this point
STest25_S4_Hourly.Properties.VariableNames{20} = 'SoilTemp_2cm_Obs';
STest25_S4_Hourly.Properties.VariableNames{21} = 'SoilTemp_5cm_Obs';
STest25_S4_Hourly.Properties.VariableNames{22} = 'SoilTemp_10cm_Obs';
STest25_S4_Hourly.Properties.VariableNames{23} = 'SoilTemp_20cm_Obs';
STest25_S4_Hourly.Properties.VariableNames{24} = 'SoilTemp_1cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{25} = 'SoilTemp_4cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{26} = 'SoilTemp_9cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{27} = 'SoilTemp_10cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{28} = 'SoilTemp_16cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{29} = 'SoilTemp_26cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{30} = 'SoilTemp_40cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{31} = 'SoilTemp_80cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{32} = 'SoilTemp_136cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{33} = 'SoilTemp_125cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{34} = 'SoilTemp_208cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{35} = 'SoilTemp_250cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{36} = 'SoilTemp_299cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{37} = 'SoilTemp_358cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{38} = 'SoilTemp_427cm_CLM';

STest25_S4_Hourly.Properties.VariableNames{39} = 'PotentialSoilWater_1cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{40} = 'SoilMoisture_2cm_Obs';
STest25_S4_Hourly.Properties.VariableNames{41} = 'PotentialSoilWater_4cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{42} = 'SoilMoisture_5cm_Obs';
STest25_S4_Hourly.Properties.VariableNames{43} = 'PotentialSoilWater_9cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{44} = 'SoilMoisture_10cm_Obs'; 
STest25_S4_Hourly.Properties.VariableNames{45} = 'PotentialSoilWater_16cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{46} = 'SoilMoisture_20cm_Obs';
STest25_S4_Hourly.Properties.VariableNames{47} = 'PotentialSoilWater_26cm_CLM';
STest25_S4_Hourly.Properties.VariableNames{48} = 'NEE_Obs';
STest25_S4_Hourly.Properties.VariableNames{49} = 'NEE_CLM';
STest25_S4_Hourly.Properties.VariableNames{50} = 'CH4_Obs';
STest25_S4_Hourly.Properties.VariableNames{51} = 'CH4_CLM';
STest25_S4_Hourly.Properties.VariableNames{52} = 'NPP_CLM';
STest25_S4_Hourly.Properties.VariableNames{53} = 'EcosysResp_CLM';
STest25_S4_Hourly.Properties.VariableNames{54} = 'CO2Flux_CLM'; 
STest25_S4_Hourly.Properties.VariableNames{55} = 'SoilResp_CLM';

% export
cd 'D:\PhD Work\Modelling\CLM\Output Data From CLM\Paper 1\GitRepo\SensitivityTests_SpinUp\Alpha=0.75(25%)'
writetimetable(STest25_S4_Hourly,'STest25_S4_Hourly.csv');

% Daily Parameters:
STest25_S4_Daily = retime(STest25_S4_Hourly,'Daily');
STest25_S4_Daily(end,:) = []; % creates empty row for first of Jan, remove it

STest25_S4_Daily = addvars(STest25_S4_Daily,SnowLayerGrainRadii,'Before','SoilTemp_1cm_CLM');
STest25_S4_Daily = addvars(STest25_S4_Daily,SnowLayerDensities,'Before','SnowLayerGrainRadii');
STest25_S4_Daily = addvars(STest25_S4_Daily,SnowLayerThickness,'Before','SnowLayerDensities');
STest25_S4_Daily = addvars(STest25_S4_Daily,SnowThermalConductivities,'Before','SoilTemp_1cm_CLM');
STest25_S4_Daily = addvars(STest25_S4_Daily,SnowLayerTemps,'Before','SoilTemp_1cm_CLM');
STest25_S4_Daily = addvars(STest25_S4_Daily,SnowIceContent, 'Before','SoilTemp_1cm_CLM');
STest25_S4_Daily = addvars(STest25_S4_Daily,SnowLiquidWater,'Before','SoilTemp_1cm_CLM');

%export
writetimetable(STest25_S4_Daily,'STest25_S4_Daily.csv');