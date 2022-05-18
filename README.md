# TVCSnowCLM
Data & code needed to construct figures for *Impact of measured and simulated tundra snowpack properties on heat transfer*, Dutch et al. (2021). [DOI Pending]

# Abstract 
Snowpack microstructure controls the transfer of heat to, and the temperature of, the underlying soils. In situ measurements of snow and soil properties from four field campaigns during two different winters (March and November 2018, January and March 2019) were compared to an ensemble of CLM5.0 (Community Land Model) simulations, at Trail Valley Creek, Northwest Territories, Canada. Snow MicroPenetrometer profiles allowed snowpack density and thermal conductivity to be derived at higher vertical resolution (1.25 mm) and a larger sample size (n = 1050) compared to traditional snowpit observations (3 cm vertical resolution; n = 115). Comparing measurements with simulations shows CLM overestimated snow thermal conductivity by a factor of 3, leading to a cold bias in wintertime soil temperatures (RMSE = 5.8 ℃). Bias-correction of the simulated thermal conductivity (relative to field measurements) improved simulated soil temperatures (RMSE = 2.1 ℃). Multiple linear regression shows the required correction factor is strongly related to snow depth (R2 = 0.77, RMSE = 0.066) particularly early in the winter. The use of an alternative parameterisation of snow thermal conductivity also improved simulations of wintertime soil temperatures (RMSE = 2.5 ℃). Furthermore, CLM simulations did not adequately represent the observed high proportions of depth hoar. Addressing uncertainty in simulated snow properties and the corresponding heat flux is important, as wintertime soil temperatures act as a control on subnivean soil respiration, and hence impact Arctic winter carbon fluxes and budgets. 

# Read Me
This gitrepo should contain 3 subfolders:
- CLMOutputData
- TVCMetData
- TVCSnowpits

And 3 Files:
- ReadMe.md (This File)
- Paper1Figures.m
- shadedplot.m*

In order to create figures; 
1. Add snowpit data to TVCSnowpits folder from zip file at https://figshare.com/articles/dataset/TVC_Array_09_2021_zip/16685041
2. Run Paper1Figures.m

v1.2 - V. R. Dutch, Jan 2022

*Dave Van Tol (2020). Shaded area plot (https://www.mathworks.com/matlabcentral/fileexchange/18738-shaded-area-plot), MATLAB Central File Exchange. Retrieved October 2020.
