Read Me - TVC_Array_12.2021.zip

This zip file should contain the following files:
_ReadMe_v3.txt (This Document)
TVC_Array_Paper1v3.mat (Snowpit data, see below)
TVC_Structure.png (Visual to explain matlab structure)

In order to create the figures for Dutch et al. 2021 paper, clone/download the gitrepo and place the contents of this folder in .../TVCSnowpits
Then run Paper1Figures.m. 

Once TVC_Array_Paper1.mat is loaded, the workspace will contain:
ZZ_density_FS/WS/DH = All snowpit densities from each respective layer (FS,WS,DH) per campaign.
ZZ_Depths = All magnaprobe depths per campaign.
MedianSMPDensity_ZZ_Normalised = Profile of median densities from the SMP using paper co-effs. per campaign. 
MedianSMPK_eff_C_ZZ_Normalised = Profile of median thermal conductivities from the SMP densities using the equation of Callone (2011) for each campaign. 
MedianSMPK_eff_J_ZZ_Normalised = Profile of median thermal conductivities from the SMP densities using the equation of Jordan (1991) for each campaign. 
MedianSMPK_eff_S_ZZ_Normalised = Profile of median thermal conductivities from the SMP densities using the equation of Sturm (1997) for each campaign. 
NormalisedScale = Values of 0 to 100 in increaments of 0.25. For plotting SMP profiles.
Pitnames_MarchZZ = To loop through snowpits to retrive thermal conductivity measurments for plotting.
Q1_SMPDensity_ZZ_Normalised = Profile of lower quartile densities from the SMP using paper co-effs. per campaign. 
Q1_SMPK_eff_C_ZZ_Normalised = Profile of lower quartile of thermal conductivities from the SMP densities using the equation of Callone (2011) for each campaign. 
Q1_SMPK_eff_J_ZZ_Normalised = Profile of lower quartile of thermal conductivities from the SMP densities using the equation of Jordan (1991) for each campaign. 
Q1_SMPK_eff_S_ZZ_Normalised = Profile of lower quartile thermal conductivities from the SMP densities using the equation of Sturm (1997) for each campaign.
Q3_SMPDensity_ZZ_Normalised = Profile of upper quartile densities from the SMP using paper co-effs. per campaign. 
Q3_SMPK_eff_C_ZZ_Normalised = Profile of upper quartile of thermal conductivities from the SMP densities using the equation of Callone (2011) for each campaign. 
Q3_SMPK_eff_J_ZZ_Normalised = Profile of upper quartile of thermal conductivities from the SMP densities using the equation of Jordan (1991) for each campaign. 
Q3_SMPK_eff_S_ZZ_Normalised = Profile of upper quartile thermal conductivities from the SMP densities using the equation of Sturm (1997) for each campaign.
TVC = Structure of snowpit data from all 4 campaigns. Variables listed below. 

Variables within TVC Structure: (Alphabetical Order, Case sensitive)
boundary_btm = Height above ground in cm where the bottom of the density sample was taken. 
boundary_top = Height above ground in cm where the top of the density sample was taken.
Cropped_Profiles = Container for SMP profiles, only including data below the air:snow interface (determined as the point where the measured force first exceeds 0.25N).
Density = Container for variables MeanLayerDensity_FreshSnow, MeanLayerDensity_WindSlab, MeanLayerDensity_DepthHoar, MedianLayerDensity_FreshSnow, MedianLayerDensity_WindSlab, 
density = Container for variables boundary_btm, boundary_top, densityA, densityB & density_layer_ID.
densityA = Profile of density through the snowpack in kg per metre cubed.  
densityB = Repeat profile of density through the snowpack in kg per metre cubed, where avalible. 
density_layer_ID = Stratigraphic layer ID (where 1 = fresh snow, 2 = wind slab and 3 = depth hoar) determined based on density values. 
depth_smp = Depth in the profile in mm at which force exerted by the SMP was measured. 0 is the point above the snow at which the profile was initiated.
density_smp = Profile of recalibrated density measurements at 2.5mm resolution using the coeffiecents generated in the juypter notebooks.  
distanceCropped = length in mm removed from the measured SMP profile, as determined to be above the air:snow interface.
force = Force in Newtons exerted by the SMP.
grain_type = Grain type for each stratigraphic layer, as per Fierz et al (2009). 
height = Height in m above the ground surface for needle probe thermal conductivity measurement (only availible for 2019). 
ice_lens = Container for variables ice_lens_thick and ice_lens_height_top.
ice_lens_height_top = Height in cm of the top of any ice lenses in the snowpit.
ice_lens_thick = Thickness of ice lenses in cm.
K_eff = Effective Thermal Conductivity from Hukseflux needleprobe measurement in W m^-1 K^-1. 
k_eff_C = Approximation of effective thermal conductivity from recalibrated SMP densities, at 2.5mm/0.25% depth resolution, calculated using the equation of Calonne et al (2011).
K_eff_J = Aprroximation of effective thermal conductivity from recalibrated SMP densities, at 2.5mm/0.25% depth resolution, calculated using the equation of Jordan (1991). 
K_eff_S = Aprroximation of effective thermal conductivity from recalibrated SMP densities, at 2.5mm/0.25% depth resolution, calculated using the equation of Sturm et al (1997). 
L_smp = Microstructural element length (Lowe and Van Herwijnen, 2012).
lambda_smp = Deflection of SMP cone at rupture of snow elements (see Lowe and Van Herwijnen, 2012). 
latitude = Latitude in degrees North where measurement was taken/snowpit was located.
layer =  Stratigraphic layer of needle probe thermal conductivity measurement.
layer_thickness = Thickness in cm of each stratigraphic layer present, as defined using strat_layer_ID.
LayerThickness = Container for varibles MeanLayerThickness_FreshSnow_cm, MeanLayerThickness_FreshSnow_percent, MeanLayerThickness_WindSlab_cm, MeanLayerThickness_WindSlab_percent, MeanLayerThickness_DepthHoar_cm, MeanLayerThickness_DepthHoar_percent 
length = Total length in mm of SMP profile. 
lengthscale_SMPmetrics =  Sliding 2.5mm length scale for interpretation of metrics. 
longitude = Longitude in degrees East where measurement was taken/snowpit was located.
Magnaprobe = Container for variables Mean_MgPDepth, Median_MgPDepth, n_MgPDepth, Q1_MgPDepth, Q3_MgPDepth and StdDev_MgPDepth.
magnaprobe = Container for variables MgP_Depth, latitude & longitude. 
max_grain_size = Maximum grain size observed for each stratigraphic layer
MaxLength_RawSMP = Length of the longest raw SMP force profile from each pit/overall campaign.
MaxLength_RecalibratedSMP = Length of the longest raw SMP force profile for a campaign.
MaxLength_RecalibratedDensity = Length of the longest profile of recalibrated metrics (inc. density) from each pit.
MeanDensityProfile = Mean density profile for each snowpit/campaign from the recalibrated/normalised SMP density profiles.
MeanK_eff_Profile_C/_J/_S = Mean K_eff profile per Calonne/Jordan/Sturm equation for each pit.
mean_layer_densityA = Mean densityA for each stratigraphic layer present, as defined using density_layer_ID.
mean_layer_densityB = Mean densityB for each stratigraphic layer present, as defined using density_layer_ID.
MeanLayerDensity_XX = Mean density of the given layer (XX) from all pits in the campaign where that layer was present.
MeanLayerThickness_DepthHoar_cm & MeanLayerThickness_DepthHoar_percent
MeanLayerThickness_XX_cm = Mean thickness of the given layer (XX) as an absolute value (in cm). Pits where the layer is not present are not included in the calculation. 
MeanLayerThickness_XX_percent = Mean relative thickness of the given layer (XX) as a percentage. Pits where the layer is not present are not included in the calculation.
mean_layer_temp = Mean temperature of each stratigraphic layer present, as defined using strat_layer_ID.
MeanLength_RawSMP = Mean length of the raw SMP force profiles from each pit.
MeanLength_RecalibratedSMP = Mean length of the recalibrated SMP profiles from a campaign.
MeanLength_RecalibratedDensity = Mean length of the profiles of recalibrated metrics (inc. density) from each pit.
Mean_MgPDepth = Mean value of all MgPDepths for each pit/campaign
MedianDensityProfile = Median density profile for each snowpit/campaign from the recalibrated/normalised SMP density profiles.
medianforce_smp = Median force over a rolling 2.5mm window with 50% overlap.
MedianK_eff_Profile_C/_J/_S =  Median K_eff profile per Calonne/Jordan/Sturm equation for each pit.
MedianLength_RawSMP = Median length of the raw SMP force profiles from each pit/overall campaign.
MedianLength_RecalibratedSMP = Median length of the recalibrated SMP profiles from a campaign.
MedianLength_RecalibratedDensity = Median length of the profiles of recalibrated metrics (inc. density) from each pit.
Median_MgPDepth = Median values of all MgPDepths for each pit/campaign
MedianLayerDensity_DepthHoar, StdDevLayerDensity_FreshSnow, StdDevLayerDensity_WindSlab, StdDevLayerDensity_DepthHoar.
metrics = Container for variables density_smp, L_smp, lambda_smp, expcorrelationlength_smp and lengthscale_SMPmetrics.
MgP_Depth = Snowpack depths measured in cm using a Magnaprobe instrument in the general vincity of each pit. Location of each measurement is listed. 
MgP_Summary = Container for variables Mean_MgPDepth, Median_MgPDepth, Q1_MgPDepth, Q3_MgPDepth & StdDev_MgPDepth. 
min_grain_size = Minimum observed grain size for each stratigraphic layer.
MinLength_RawSMP = Length of the shortest raw SMP force profile from each pit/overall campaign. 
MinLength_RecalibratedSMP = Length of the shortest raw SMP force profile for a campaign.
MinLength_RecalibratedDensity = Length of the shortest profile of recalibrated metrics (inc. density) from each pit.
n_DensityProfile = Number of non-NaN density measurements at each depth in the density profile.
n_K_effProfile_C/_J/_S = Number of non-NaN measurements of K_eff per Calonne/Jordan/Sturm equation at each depth in the depth-normalised K_eff profile.
n_MgPDepth = Number of magnaprobe measurements taken for each sampling campaign.
n_RecalibratedSMP = Number of recalibrated SMP profiles per campaign.
NormalisedProfiles = Container for the SMP profiles rescaled to 0.25% depth intervals/campaign summary 0.25% depth-scaled profiles.
Profiles = Container for the SMP profiles made in the vincinity of each pit, each the full length the SMP was run (includes measurements above the air:snow interface).
profile_length = Length of the profiles of recalibrated metrics.
Q1DensityProfile = Lower quartile of densities at each depth for each snowpit/campaign.
Q1K_effProfile_C/_J/_S = Lower quartile of K_eff per Calonne/Jordan/Sturm equation at each depth for each snowpit/campaign.
Q1_Length_RawSMP = Lower quartile of the depths of all SMP profiles from that campaign.
Q1_Length_RecalibratedSMP = Lower quartile of the depths of all recalibrated SMP profiles from that campaign.
Q1_MgPDepth = Lower quartile of MgPDepths.
Q3DensityProfile = Upper quartile of densities at each depth for each snowpit/campaign. 
Q3K_effProfile_C/_J/_S = Upper quartile of K_eff per Calonne/Jordan/Sturm equation at each depth for each snowpit/campaign.
Q3_Length_RawSMP = Upper quartile of the depths of all SMP profiles from that campaign. 
Q3_Length_RecalibratedSMP = Upper quartile of the depths of all recalibrated SMP profiles from that campaign.
recalibrated_metrics = Container variable for microstructural metrics recalculated using the coeffiecents derived from the SMP recalibration. 
RecalibratedSMP = Container for variables MeanLength_RecalibratedSMP, MedianLength_RecalibratedSMP, MinLength_RecalibratedSMP, MaxLength_RecalibratedSMP, Q1_Length_RecalibratedSMP, Q3_Length_RecalibratedSMP, StdDev_Length_RecalibratedSMP and NormalisedProfiles.
StdDevDensityProfile = Standard deviation from each point on the mean density profile for each pit/campaign.
StdDevK_effProfile_C/_J/_S = Standard deviation from each point on the mean K_eff profile per Calonne/Jordan/Sturm equation for each pit/campaign.
StdDev_Length_RawSMP = Standard deviation of all the lengths of SMP profiles from a campaign. 
StdDev_Length_RecalibratedSMP = Standard deviation of all the lengths of the recalibrated SMP profiles from a campaign. 
StdDev_MgPDepth = Standard deviation of MgPDepths for each pit/campaign 
SMP = Container for CroppedProfiles and Profiles. 
SMP_XX = Individual SMP profiles. Profiles were assigned to pits using the lat, lon coordinates or notes made within the field. Each profile includes depth_smp, force and additional container variable for microstructural metrics from Proksch et al (2015).
strat_btm = Minimum measured grain size in mm.
strat_layer_ID = Stratigraphic layer ID (where 1 = fresh snow, 2 = wind slab and 3 = depth hoar) determined based stratigraphic comments and hardness values. 
strat_top = Maximum measured grain size in mm.
stratigraphy_comments = Describtion of stratigraphic layer and hardness as measured using knife/pen/pencil/fingers/fist.
stratigraphy_layers = Container for variables grain_type, max_grain_size, min_grain_size, strat_btm, strat_layer_ID & strat_top.
Summary = Container for variables Density, Magnaprobe, SSA, Layer Thickness and SWE. Provides an overview of the average conditions across all pits in each campaign.
temp = Temperature of the snowpack in degrees centigrade, measured using a digtial thermometer. 
temp_height = Height above ground in cm at which snowpack temperature measurements were taken.
temperature = Container for variables temp & temp_height.
thermal_conductivity = Container for variables K_eff, layer and height.

v. 3.0: V. R. Dutch - December 2021
