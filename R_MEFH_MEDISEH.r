###############################################################################################################
#                                                                                                             #
#   R_MEFH_MEDISEH (Modelling Essential Fish Habitat) ver 2.0                                                 #
#   R routine for estimating nursery and spawing grounds of demersal species,                                 #
#                                                                                                             #
#   Authors:                                                                                                  #
#   Angela Martiradonna, Walter Zupa, Isabella Bitetto,                                                       #
#   Maria Teresa Facchini, Maria Teresa Spedicato, Giuseppe Lembo                                             #                    
#   Coispa Tecnologia & Ricerca - Stazione sperimentale per lo Studio delle Risorse del Mare                  #                                                                    
#                                                                                                             #
#   For info and suggestions please contact ang.martiradonna@gmail.com                                        #
#                                                                                                             #
#   February 2013                                                                                             #
#                                                                                                             #
###############################################################################################################


rm(list=ls(all=TRUE))

##########################################################################################################################
# 1. Settings                                                                                                            #
##########################################################################################################################

gsa <- 
zone <-     # UTM zone

species <- 

life_stage <-     # "recruits" or "spawners"

# Name of the csv file obtained by R_RSI_MEDISEH and stored in the datasets folder:  
dataset_name <- 

# Name of the grid with columns: lon, lat, lon_utm, lat_utm, depth
grid_name <-


##########################################################################################################################
# 2. Initialization                                                                                                        #
##########################################################################################################################

suppressWarnings( source("scripts\\initializing.r") )

# Select years to leave out from analysis after looking bubble plots
yrs_no_analysis <- c()  

source("scripts\\histogram.r")

# Select the depth range after visualizing the depth distrubution of positive hauls
mindepth <- 
maxdepth <- 

source("scripts\\load.grid.r")


##########################################################################################################################
# 3. Pooled variogram estimation                                                                                         #
##########################################################################################################################

# Select years to esclude from pooled variogram estimation
yrs_no_variogram <- c()

# Select the maximum distance (km) 
max_dist <- 

source("scripts\\variogram.r")

                         

sink(file=paste(out_dir,"\\variogram summary.txt",sep="")) 
summary(mod.nls)
sink(NULL)


##########################################################################################################################
# 4. ZIGAM analysis                                                                                                      #
##########################################################################################################################

# Select years to exclude from zigam analysis
yrs_no_gam <- c() 

# Select the initial degrees of freedom for gam: not too high to avoid overfitting 
K <-       

source("scripts\\zigam.r")


##########################################################################################################################
# 5. Interpolation on residuals: kriging or idw                                                                          #
##########################################################################################################################

# Chose the interpolation type
interpolation_type <-           # "kriging" or "idw"  

source("scripts\\interpolation.r")


##########################################################################################################################
# 6. Hot spots identification with Getis and Ord statistic and mapping                                                   #
#    Choose the criterion: Fisher homogenueous intervals or Getis and Ord test                                           #                                 #
##########################################################################################################################

# Select the radius of neighborhoods (km) for Getis and Ord statistic computation
d <- 

# Choose the hot spots identification criterion 
hs_method <-            # "fisher" or "getis_ord"

source("scripts\\mapping.r") 


##########################################################################################################################
# 7. Persistence analysis                                                                                                         #
##########################################################################################################################

source("scripts\\persistence.r")





