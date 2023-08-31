# Matthew Kim 
# 8/27/23
# Main poster code

# NOTE: To load data, you must download both the extract's data and the DDI
# and also set the working directory to the folder with these files (or change the path below).
install.packages('ipumsr')
if (!require("ipumsr")) stop("Reading IPUMS data into R requires the ipumsr package. It can be installed using the following command: install.packages('ipumsr')")
library(ipumsr)
library(dplyr)
library(sf)
library(spData)
library(tidyverse)
library(tmap)
library(usmap)
library(ggplot2)

# NEW DATASET
ddi <- read_ipums_ddi("/Users/matthewkim/Desktop/usa_00006.xml")
data <- read_ipums_micro(ddi)
data

# Importing Shape File of the US by County
us_shape <- read_sf('/Users/matthewkim/Desktop/cb_2022_us_county_20m/cb_2022_us_county_20m.shp')

# Importing Shape File of just the US states
us_shape_states <- read_sf('/Users/matthewkim/Desktop/cb_2022_us_state_20m/cb_2022_us_state_20m.shp')

#### TEXAS ####
# Here, I am selecting for everything after StateFIP and filtering only the texas results)
texas00 <- data |>
  filter(YEAR == 2000) |>
  filter(STATEFIP == 48) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
texas00

# Here, I am selecting for everything after StateFIP and filtering only the texas results)
texas10 <- data |>
  filter(YEAR == 2010) |>
  filter(STATEFIP == 48) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
texas10

texas20 <- data |>
  filter(YEAR == 2020) |>
  filter(STATEFIP == 48) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
texas20

texas <- data |>
  filter(STATEFIP == 48) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
texas


#### Arkansas ####
ark00 <- data |>
  filter(YEAR == 2000) |>
  filter(STATEFIP == 05) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
ark00

ark10 <- data |>
  filter(YEAR == 2010) |>
  filter(STATEFIP == 05) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
ark10

ark20 <- data |>
  filter(YEAR == 2020) |>
  filter(STATEFIP == 05) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
ark20

ark <- data |>
  filter(STATEFIP == 05) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
ark


#### Louisiana ####
lous00 <- data |>
  filter(YEAR == 2000) |>
  filter(STATEFIP == 22) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
lous00

lous10 <- data |>
  filter(YEAR == 2010) |>
  filter(STATEFIP == 22) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
lous10

lous20 <- data |>
  filter(YEAR == 2020) |>
  filter(STATEFIP == 22) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
lous20

lous <- data |>
  filter(STATEFIP == 22) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
lous


#### Oklahoma ####
oak00 <- data |>
  filter(YEAR == 2000) |>
  filter(STATEFIP == 40) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
oak00

oak10 <- data |>
  filter(YEAR == 2010) |>
  filter(STATEFIP == 40) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
oak10

oak20 <- data |>
  filter(YEAR == 2020) |>
  filter(STATEFIP == 40) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
oak20

oak <- data |>
  filter(STATEFIP == 40) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
oak


#### New Mexico ####
nm00 <- data |>
  filter(YEAR == 2000) |>
  filter(STATEFIP == 35) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
nm00

nm10 <- data |>
  filter(YEAR == 2010) |>
  filter(STATEFIP == 35) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
nm10

nm20 <- data |>
  filter(YEAR == 2020) |>
  filter(STATEFIP == 35) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
nm20

nm <- data |>
  filter(STATEFIP == 35) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
nm


#### Mississippi ####
miss00 <- data |>
  filter(YEAR == 2000) |>
  filter(STATEFIP == 28) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
miss00

miss10 <- data |>
  filter(YEAR == 2010) |>
  filter(STATEFIP == 28) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
miss10

miss20 <- data |>
  filter(YEAR == 2020) |>
  filter(STATEFIP == 28) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
miss20

miss <- data |>
  filter(STATEFIP == 28) |>
  select(YEAR, STATEFIP:INCWAGE)
# Checking it works
miss


# Greater Austin Area County FIPS codes
# Williamson 48491
# Travis 48453
# Bastrop 48021
# Hays 48209
# Caldwell 48055
# Comal 48091
# Guadalupe 48187
# Bexar 48029
# GEOIDs, 48491, 48453, 48021, 48209, 48055, 48091, 48187, 48029



# State FIPS codes
# TX = 48
# Ark = 05
# Lous = 22
# Oak = 40
# NM = 35
# Miss = 28
# Together = 48,05,22,40,35,28
########
######## Not Loading Data
########

# Using ggplot2 to plot these
plot_usmap(include = c("48453","48491","48453","48021","48209","48055","48091","48187","48029"), regions = "counties") + 
  labs(title = "US Counties",
       subtitle = "Counties in Austin, TX") + 
  theme(panel.background = element_rect(color = "black", fill = "lightblue"))

### Testing us_shape and us_shape_states file for counties
us_shape 
plot(us_shape) # huge file
us_shape_states
plot(us_shape_states) # huge file

# Creating South Central Geometry for counties
SoCent <- us_shape |>
  filter(STATEFP == 48 | STATEFP == 05 |STATEFP == 22 | STATEFP == 40 | STATEFP == 35 | STATEFP == 28) |>
  select(GEOID, NAMELSAD, STATEFP)
SoCent
plot(SoCent$geometry)

# Creating South Central Geometry for just states
SoCentStates <- us_shape_states |>
  filter(STATEFP == 48 | STATEFP == 05 |STATEFP == 22 | STATEFP == 40 | STATEFP == 35 | STATEFP == 28) |>
  select(GEOID, NAME, STATEFP)
SoCentStates
plot(SoCentStates$geometry)

# Union of the polygons
SoCentAll <- st_union(SoCent)
plot(SoCentAll)

# Changing STATEFP to int
SoCent$STATEFP <- as.integer(SoCent$STATEFP)
SoCentStates$STATEFP <- as.integer(SoCentStates$STATEFP)

### PAY GAP FOR EACH STATE (No restrictions. Just anyone making money, not based on industry or marital status)
### All in one, more efficient
SoCentPay <- data |>
  filter(STATEFIP == 48 | STATEFIP == 05 |STATEFIP == 22 | STATEFIP == 40 | STATEFIP == 35 | STATEFIP == 28) |>
  filter(AGE > 17) |>
  filter(INCWAGE > 0) |>
  filter(INCWAGE != 999999) |>
  group_by(STATEFIP,SEX,YEAR) |>
  summarize(meanWage = mean(INCWAGE))
print(SoCentPay, n = 36)

?left_join
### Making a new variable to plot with
### Matching with state fips codes
SoCentPlot <- SoCentStates |>
  left_join(SoCentPay, by = c("STATEFP" = "STATEFIP")) ## Have to do as.character because STATEFIP is an int
SoCentPlot
print(SoCentPlot, n=30)
plot(SoCentPlot)

### PAY GAP FOR EACH STATE (looking at military!)
SoCentPayMil <- data |>
  filter(STATEFIP == 48 | STATEFIP == 05 |STATEFIP == 22 | STATEFIP == 40 | STATEFIP == 35 | STATEFIP == 28) |>
  filter(AGE > 17) |>
  filter(INCWAGE > 0) |>
  filter(INCWAGE != 999999) |>
  group_by(STATEFIP,SEX,YEAR,IND) |>
  summarize(meanWage = mean(INCWAGE))
print(SoCentPayMil, n = 36)

### Making a new variable to plot with
### Matching with state fips codes
SoCentPlotMil <- SoCentStates |>
  left_join(SoCentPayMil, by = c("STATEFP" = "STATEFIP")) ## Have to do as.character because STATEFIP is an int
SoCentPlotMil
print(SoCentPlotMil, n=30)


## TEST ##
test <- SoCentPayMil |>
  filter(STATEFIP == 48 | STATEFIP == 05 |STATEFIP == 22 | STATEFIP == 40 | STATEFIP == 35 | STATEFIP == 28) |>
  # filter(AGE > 17) |>
  # filter(INCWAGE > 0) |>
  # filter(INCWAGE != 999999) |>
  filter(YEAR == 2000) |>
  filter(STATEFIP == 40) |> # testing NM
  filter(IND == 967| IND == 968| IND == 969| IND == 977| IND == 978| IND == 979| IND == 987) |>
  filter(SEX == 2) |>
  select(STATEFIP, SEX, IND) 
test

test <- data |>
  filter(STATEFIP == 48 | STATEFIP == 05 |STATEFIP == 22 | STATEFIP == 40 | STATEFIP == 35 | STATEFIP == 28) |>
  filter(AGE > 17) |>
  filter(INCWAGE > 0) |>
  filter(INCWAGE != 999999) |>
  group_by(STATEFIP,SEX,YEAR,IND) |>
  summarize(meanWage = mean(INCWAGE)) |>
  filter(STATEFIP == 40) |> # testing NM
  filter(IND == 967| IND == 968| IND == 969| IND == 977| IND == 978| IND == 979| IND == 987) |>
  filter(SEX == 2) |>
  select(STATEFIP, SEX, IND, meanWage) 
test

### Making map of whole US
allStates <- us_shape_states |>
  filter(STATEFP != 15 & STATEFP != 72 & STATEFP != "02")
allStates
plot(allStates$geometry)

#### ALASKA ####
alaskaGeo <- us_shape_states |>
  filter(STATEFP == "02")
alaskaGeo
plot(alaskaGeo$geometry)

#### Puerto Rico
prGeo <- us_shape_states |>
  filter(STATEFP == 72)
prGeo
plot(prGeo$geometry)

#### Hawaii
hawaiiGeo <- us_shape_states |>
  filter(STATEFP == 15)
hawaiiGeo
plot(hawaiiGeo$geometry)

# Changing STATEFP to int
us_shape_states$STATEFP <- as.integer(us_shape_states$STATEFP)
allStates$STATEFP <- as.integer(allStates$STATEFP)
alaskaGeo$STATEFP <- as.integer(alaskaGeo$STATEFP)
prGeo$STATEFP <- as.integer(prGeo$STATEFP)
hawaiiGeo$STATEFP <- as.integer(hawaiiGeo$STATEFP)

### PAY GAP FOR EACH STATE (No restrictions. Just anyone making money, not based on industry or marital status)
### All in one, more efficient
allStatesPay <- data |>
  # filter(STATEFIP != 15 & STATEFIP != 72 & STATEFIP != 2) |>
  filter(AGE > 17) |>
  filter(INCWAGE > 0) |>
  filter(INCWAGE != 999999) |>
  group_by(STATEFIP,SEX,YEAR) |>
  summarize(meanWage = mean(INCWAGE))
allStatesPay

# ALL
allStatesPayMen <- allStatesPay |>
  filter(SEX == 1)
allStatesPayMen

allStatesPayWomen <- allStatesPay |>
  filter(SEX == 2)
allStatesPayWomen 

# 2000
allStatesPayMen00 <- allStatesPay |>
  filter(YEAR == 2000) |>
  filter(SEX == 1)
allStatesPayMen00

allStatesPayWomen00 <- allStatesPay |>
  filter(YEAR == 2000) |>
  filter(SEX == 2)
allStatesPayWomen00 

# 2010
allStatesPayMen10 <- allStatesPay |>
  filter(YEAR == 2010) |>
  filter(SEX == 1)
allStatesPayMen10

allStatesPayWomen10 <- allStatesPay |>
  filter(YEAR == 2010) |>
  filter(SEX == 2)
allStatesPayWomen10

# 2020
allStatesPayMen20 <- allStatesPay |>
  filter(YEAR == 2020) |>
  filter(SEX == 1)
allStatesPayMen20

allStatesPayWomen20 <- allStatesPay |>
  filter(YEAR == 2020) |>
  filter(SEX == 2)
allStatesPayWomen20

############################################################################################################################################
##### Joins #############################################################################################################################
############################################################################################################################################

### Making a new variable to plot with
### Matching with state fips codes
finalPlot <- us_shape_states |>
  left_join(allStatesPay, by = c("STATEFP" = "STATEFIP")) ## Have to do as.character because STATEFIP is an int
finalPlot
# plot(finalPlot)

# ALL
finalPlotMen <- us_shape_states |>
  left_join(allStatesPayMen, by = c("STATEFP" = "STATEFIP")) ## Have to do as.character because STATEFIP is an int
finalPlotMen

finalPlotWomen <- us_shape_states |>
  left_join(allStatesPayWomen, by = c("STATEFP" = "STATEFIP")) ## Have to do as.character because STATEFIP is an int
finalPlotWomen

# 2000

finalPlotMen00 <- us_shape_states |>
  left_join(allStatesPayMen00, by = c("STATEFP" = "STATEFIP")) ## Have to do as.character because STATEFIP is an int
finalPlotMen00

finalPlotWomen00 <- us_shape_states |>
  left_join(allStatesPayWomen00, by = c("STATEFP" = "STATEFIP")) ## Have to do as.character because STATEFIP is an int
finalPlotWomen00

# 2010

finalPlotMen10 <- us_shape_states |>
  left_join(allStatesPayMen10, by = c("STATEFP" = "STATEFIP")) ## Have to do as.character because STATEFIP is an int
finalPlotMen10

finalPlotWomen10 <- us_shape_states |>
  left_join(allStatesPayWomen10, by = c("STATEFP" = "STATEFIP")) ## Have to do as.character because STATEFIP is an int
finalPlotWomen10

# 2020

finalPlotMen20 <- us_shape_states |>
  left_join(allStatesPayMen20, by = c("STATEFP" = "STATEFIP")) ## Have to do as.character because STATEFIP is an int
finalPlotMen20

finalPlotWomen20 <- us_shape_states |>
  left_join(allStatesPayWomen20, by = c("STATEFP" = "STATEFIP")) ## Have to do as.character because STATEFIP is an int
finalPlotWomen20

############################################################################################################################################
##### Diff + their plots #############################################################################################################################
############################################################################################################################################

# 2000 #####

diff00 <- allStatesPayMen00 |>
  left_join(allStatesPayWomen00, by = c("STATEFIP" = "STATEFIP")) ## Have to do as.character because STATEFIP is an int
diff00

plotDiff00 <- diff00 |>
  mutate("Pay Gap" = (meanWage.x - meanWage.y)) |>
  select(STATEFIP, "Pay Gap")
plotDiff00 
plot(plotDiff00)

finalDiff00 <- us_shape_states |>
  left_join(plotDiff00 , by = c("STATEFP" = "STATEFIP")) ## Have to do as.character because STATEFIP is an int
finalDiff00

# 2010 #####

diff10 <- allStatesPayMen10 |>
  left_join(allStatesPayWomen10, by = c("STATEFIP" = "STATEFIP")) ## Have to do as.character because STATEFIP is an int
diff10

plotDiff10 <- diff10 |>
  mutate("Pay Gap" = (meanWage.x - meanWage.y)) |>
  select(STATEFIP, "Pay Gap")
plotDiff10 
plot(plotDiff10)

finalDiff10 <- us_shape_states |>
  left_join(plotDiff10 , by = c("STATEFP" = "STATEFIP")) ## Have to do as.character because STATEFIP is an int
finalDiff10
print(finalDiff10, n=52) # puerto Rico is missing

# 2020 #####

diff20 <- allStatesPayMen20 |>
  left_join(allStatesPayWomen20, by = c("STATEFIP" = "STATEFIP")) ## Have to do as.character because STATEFIP is an int
diff20

plotDiff20 <- diff20 |>
  mutate("Pay Gap" = (meanWage.x - meanWage.y)) |>
  select(STATEFIP, "Pay Gap")
plotDiff20 
plot(plotDiff20)

finalDiff20 <- us_shape_states |>
  left_join(plotDiff20 , by = c("STATEFP" = "STATEFIP")) ## Have to do as.character because STATEFIP is an int
finalDiff20
print(finalDiff20, n=52)


############################################################################################################################################
##### Plots #############################################################################################################################
############################################################################################################################################



finalPlotPlot <- tm_shape(finalPlot) + tm_polygons("meanWage", breaks = c(10000, 20000, 30000, 40000, 50000, 60000), palette = "YlGn") + tm_fill() + tm_layout(main.title = "Mean Pay for Men and Women: Census Data from 2000, 2010, 2020 Combined", main.title.size = 1, bg.color = "lightblue")
finalPlotPlot

### MEN WOMEN
allMenPlot <- tm_shape(finalPlotMen) + tm_polygons("meanWage", breaks = c(15000, 30000, 45000, 60000, 75000, 90000), palette = "YlOrBr") + tm_fill() + tm_layout(main.title = "Mean Pay for Men: 2000, 2010, 2020 Combined", main.title.size = 1, bg.color = "lightblue")
allMenPlot

allWomenPlot <- tm_shape(finalPlotWomen) + tm_polygons("meanWage", breaks = c(15000, 30000, 45000, 60000, 75000, 90000), palette = "YlOrBr") + tm_fill() + tm_layout(main.title = "Mean Pay for Women: 2000, 2010, 2020 Combined", main.title.size = 1, bg.color = "lightblue")
allWomenPlot

### 2000

allMenPlot00 <- tm_shape(finalPlotMen00) + tm_polygons("meanWage", breaks = c(15000, 30000, 45000, 60000, 75000, 90000), palette = "YlOrBr") + tm_fill() + tm_layout(main.title = "Mean Pay for Men: 2000", main.title.size = 1, bg.color = "lightblue")
allMenPlot00

allWomenPlot00 <- tm_shape(finalPlotWomen00) + tm_polygons("meanWage", breaks = c(15000, 30000, 45000, 60000, 75000, 90000), palette = "YlOrBr") + tm_fill() + tm_layout(main.title = "Mean Pay for Women: 2000", main.title.size = 1, bg.color = "lightblue")
allWomenPlot00

### 2010
allMenPlot10 <- tm_shape(finalPlotMen10) + tm_polygons("meanWage", breaks = c(15000, 30000, 45000, 60000, 75000, 90000), palette = "YlOrBr") + tm_fill() + tm_layout(main.title = "Mean Pay for Men: 2010", main.title.size = 1, bg.color = "lightblue")
allMenPlot10

allWomenPlot10 <- tm_shape(finalPlotWomen10) + tm_polygons("meanWage", breaks = c(15000, 30000, 45000, 60000, 75000, 90000), palette = "YlOrBr") + tm_fill() + tm_layout(main.title = "Mean Pay for Women: 2010", main.title.size = 1, bg.color = "lightblue")
allWomenPlot10

### 2020

allMenPlot20 <- tm_shape(finalPlotMen20) + tm_polygons("meanWage", breaks = c(15000, 30000, 45000, 60000, 75000, 90000), palette = "YlOrBr") + tm_fill() + tm_layout(main.title = "Mean Pay for Men: 2020", main.title.size = 1, bg.color = "lightblue")
allMenPlot20

allWomenPlot20 <- tm_shape(finalPlotWomen20) + tm_polygons("meanWage", breaks = c(15000, 30000, 45000, 60000, 75000, 90000), palette = "YlOrBr") + tm_fill() + tm_layout(main.title = "Mean Pay for Women: 2020", main.title.size = 1, bg.color = "lightblue")
allWomenPlot20

# Difference

finalPlotDiff00 <- tm_shape(finalDiff00) + tm_polygons("Pay Gap", breaks = c(10000, 13000, 16000, 19000, 21000, 24000, 27000), palette = "YlOrBr") + tm_fill() + tm_layout(main.title = "Gender Pay Gap: Difference between Men and Women Mean Pay in 2000", main.title.size = 1, bg.color = "lightblue")
finalPlotDiff00
# Plot to show the pay gap per state (stateFIPs code)
plot(plotDiff00)

finalPlotDiff10 <- tm_shape(finalDiff10) + tm_polygons("Pay Gap", breaks = c(10000, 13000, 16000, 19000, 21000, 24000, 27000), palette = "YlOrBr") + tm_fill() + tm_layout(main.title = "Gender Pay Gap: Difference between Men and Women Mean Pay in 2010", main.title.size = 1, bg.color = "lightblue")
finalPlotDiff10
# Plot to show the pay gap per state (stateFIPs code)
plot(plotDiff10)

finalPlotDiff20 <- tm_shape(finalDiff20) + tm_polygons("Pay Gap", style = "pretty", palette = "YlOrBr") + tm_fill() + tm_layout(main.title = "Gender Pay Gap: Difference between Men and Women Mean Pay in 2020", main.title.size = 1, bg.color = "lightblue")
finalPlotDiff20
# Plot to show the pay gap per state (stateFIPs code)
plot(plotDiff20)

############################################################################################################################################
##### 2000 #############################################################################################################################
############################################################################################################################################
# Plot the wage differences between men and women in the states
SoCentPlot00 <- SoCentPlot |>
  filter(YEAR == 2000)
SoCentPlot00

SoCentPlot00e <- SoCentPlot |>
  filter(YEAR == 2000) |>
  mutate(payGap = (SoCentPlot00$meanWage[1]-SoCentPlot00$meanWage[2]))
SoCentPlot00e

gap00 <- SoCentPlot00e |>
  select(GEOID,NAME,YEAR,payGap)
payGap <- distinct(gap00)

# manually adding in difference in pay
payGap[2, "payGap"] <- (SoCentPlot00$meanWage[3]-SoCentPlot00$meanWage[4])
payGap[3, "payGap"] <- (SoCentPlot00$meanWage[5]-SoCentPlot00$meanWage[6])
payGap[4, "payGap"] <- (SoCentPlot00$meanWage[7]-SoCentPlot00$meanWage[8])
payGap[5, "payGap"] <- (SoCentPlot00$meanWage[9]-SoCentPlot00$meanWage[10])
payGap

# rename column to look good for graph
payGap <- payGap |>
  rename("Pay Gap ($)" = "Gender Pay Gap")
payGap

# Plotting with tm_shape
plot2000 <- tm_shape(payGap) + tm_polygons("Pay Gap ($)", breaks = c(8000, 11000, 14000, 17000, 20000, 23000), palette = "YlOrBr") + tm_fill() + tm_layout(main.title = "Mean Gender Pay Gap, South Central US in 2000", main.title.size = 1, bg.color = "lightblue")

# Military
# 967	U.S. Army
# 968	U.S. Air Force
# 969	U.S. Navy
# 977	U.S. Marines
# 978	U.S. Coast Guard
# 979	U.S. Armed Forces, branch not specified
# 987	Military reserves or National Guard
#   filter(IND == 967|IND == 968|IND == 969|IND == 977|IND == 978|IND == 979|IND == 987)

## NOTES: Huge lack of data for women in army. only 1 in oklahoma and 6 in Texas
# Plot the wage differences between men and women in the states
################################################################################################################################################################################################################
#ARMY (replacing with general military)
SoCentPlotMil00 <- SoCentPlotMil |>
  filter(IND == 967| IND == 968| IND == 969| IND == 977| IND == 978| IND == 979| IND == 987) |>
  filter(YEAR == 2000) |>
  group_by(STATEFP, SEX) |>
  summarize(meanWage = mean(meanWage))
SoCentPlotMil00

payGap <- SoCentPlotMil00 |>
  mutate(payGap = (SoCentPlotMil00$meanWage[9]-SoCentPlotMil00$meanWage[10]))
payGap

payGap <- payGap |>
  select(GEOID,NAME,YEAR,payGap)

# manually adding in difference in pay
payGap[2, "payGap"] <- (SoCentPlotMil00$meanWage[1]-SoCentPlotMil00$meanWage[2])
payGap[3, "payGap"] <- NA
payGap[4, "payGap"] <- (SoCentPlotMil00$meanWage[3]-SoCentPlotMil00$meanWage[4])
payGap[5, "payGap"] <- NA
payGap

# rename column to look good for graph
payGap <- payGap |>
  rename("Gender Pay Gap" = "payGap")
payGap

# Plotting with tm_shape
plot2000army <- tm_shape(payGap) + tm_polygons("Gender Pay Gap", palette = "YlOrBr") + tm_fill() + tm_layout(main.title = "Mean Gender Pay Gap: Military, South Central US in 2000", main.title.size = 1, bg.color = "lightblue")
plot2000army

############################################################################################################################################
##### 2010 #############################################################################################################################
############################################################################################################################################
# Plot the wage differences between men and women in the states
SoCentPlot10 <- SoCentPlot |>
  filter(YEAR == 2010)
SoCentPlot10

SoCentPlot10e <- SoCentPlot |>
  filter(YEAR == 2010) |>
  mutate(payGap = (SoCentPlot10$meanWage[1]-SoCentPlot10$meanWage[2]))
SoCentPlot10e

gap10 <- SoCentPlot10e |>
  select(GEOID,NAME,YEAR,payGap)
payGap10 <- distinct(gap10)

# manually adding in difference in pay
payGap10[2, "payGap"] <- (SoCentPlot10$meanWage[3]-SoCentPlot10$meanWage[4])
payGap10[3, "payGap"] <- (SoCentPlot10$meanWage[5]-SoCentPlot10$meanWage[6])
payGap10[4, "payGap"] <- (SoCentPlot10$meanWage[7]-SoCentPlot10$meanWage[8])
payGap10[5, "payGap"] <- (SoCentPlot10$meanWage[9]-SoCentPlot10$meanWage[10])
payGap10

# rename column to look good for graph
payGap10 <- payGap10 |>
  rename("Pay Gap ($)" = "payGap")
payGap10

# Plotting with tm_shape
plot2010 <- tm_shape(payGap10) + tm_polygons("Pay Gap ($)", breaks = c(8000, 11000, 14000, 17000, 20000, 23000), palette = "YlOrBr") + tm_fill() + tm_layout(main.title = "Mean Gender Pay Gap, South Central US in 2010", main.title.size = 1, bg.color = "lightblue")

################################################################################################################################################################################################################
#ARMY 
# 9670	U.S. Army
# 9680	U.S. Air Force
# 9690	U.S. Navy
# 9770	U.S. Marines
# 9780	U.S. Coast Guard
# 9790	U.S. Armed Forces, branch not specified
# 9870	Military reserves or National Guard
#ARMY (replacing with general military)
SoCentPlotMil10 <- SoCentPlotMil |>
  filter(IND == 9670| IND == 9680| IND == 9690| IND == 9770| IND == 9780| IND == 9790| IND == 9870) |>
  filter(YEAR == 2010) |>
  group_by(STATEFP, SEX) |>
  summarize(meanWage = mean(meanWage))
SoCentPlotMil10

payGap10 <- SoCentPlotMil10 |>
  mutate(payGap = (SoCentPlotMil10$meanWage[9]-SoCentPlotMil10$meanWage[10]))
payGap10

# manually adding in difference in pay
payGap10[2, "payGap"] <- (SoCentPlotMil10$meanWage[1]-SoCentPlotMil10$meanWage[2])
payGap10[3, "payGap"] <- (SoCentPlotMil10$meanWage[7]-SoCentPlotMil10$meanWage[8])
payGap10[4, "payGap"] <- NA
payGap10[5, "payGap"] <- (SoCentPlotMil10$meanWage[5]-SoCentPlotMil10$meanWage[6])
payGap10

# rename column to look good for graph
payGap10 <- payGap10 |>
  rename("Gender Pay Gap" = "payGap")
payGap10

# Plotting with tm_shape
plot2010army <- tm_shape(payGap10) + tm_polygons("Gender Pay Gap", palette = "YlOrBr") + tm_fill() + tm_layout(main.title = "Mean Gender Pay Gap: Military, South Central US in 2000", main.title.size = 1, bg.color = "lightblue")
plot2010army


############################################################################################################################################
##### 2020 #############################################################################################################################
############################################################################################################################################
# Plot the wage differences between men and women in the states
SoCentPlot20 <- SoCentPlot |>
  filter(YEAR == 2020)
SoCentPlot20

SoCentPlot20e <- SoCentPlot |>
  filter(YEAR == 2020) |>
  mutate(payGap = (SoCentPlot20$meanWage[1]-SoCentPlot20$meanWage[2]))
SoCentPlot20e

gap20 <- SoCentPlot20e |>
  select(GEOID,NAME,YEAR,payGap)
payGap20 <- distinct(gap20)

# manually adding in difference in pay
payGap20[2, "payGap"] <- (SoCentPlot20$meanWage[3]-SoCentPlot20$meanWage[4])
payGap20[3, "payGap"] <- (SoCentPlot20$meanWage[5]-SoCentPlot20$meanWage[6])
payGap20[4, "payGap"] <- (SoCentPlot20$meanWage[7]-SoCentPlot20$meanWage[8])
payGap20[5, "payGap"] <- (SoCentPlot20$meanWage[9]-SoCentPlot20$meanWage[10])
payGap20

# rename column to look good for graph
payGap20 <- payGap20 |>
  rename("Pay Gap ($)" = "payGap")
payGap20

# Plotting with tm_shape
plot2020 <- tm_shape(payGap20) + tm_polygons("Pay Gap ($)", breaks = c(8000, 11000, 14000, 17000, 20000, 23000), palette = "YlOrBr") + tm_fill() + tm_layout(main.title = "Mean Gender Pay Gap, South Central US in 2020", main.title.size = 1, bg.color = "lightblue")

### MILITARY
# 9670-9870
################################################################################################################################################################################################################

# 9670	U.S. Army
# 9680	U.S. Air Force
# 9690	U.S. Navy
# 9770	U.S. Marines
# 9780	U.S. Coast Guard
# 9790	U.S. Armed Forces, branch not specified
# 9870	Military reserves or National Guard
#ARMY (replacing with general military)
SoCentPlotMil20 <- SoCentPlotMil |>
  filter(IND == 9670| IND == 9680| IND == 9690| IND == 9770| IND == 9780| IND == 9790| IND == 9870) |>
  filter(YEAR == 2020) |>
  group_by(STATEFP, SEX) |>
  summarize(meanWage = mean(meanWage))
SoCentPlotMil20

SoCentPlot20all <- SoCentPlotMil20 |>
  mutate(payGap = (SoCentPlotMil20$meanWage[9]-SoCentPlotMil20$meanWage[10]))
SoCentPlot20all

# manually adding in difference in pay
payGap20[2, "payGap"] <- (SoCentPlotMil20$meanWage[1]-SoCentPlotMil20$meanWage[2])
payGap20[3, "payGap"] <- (SoCentPlotMil20$meanWage[7]-SoCentPlotMil20$meanWage[8])
payGap20[4, "payGap"] <- (SoCentPlotMil20$meanWage[3]-SoCentPlotMil20$meanWage[4])
payGap20[5, "payGap"] <- (SoCentPlotMil20$meanWage[5]-SoCentPlotMil20$meanWage[6])
payGap20

# rename column to look good for graph
payGap20 <- payGap20 |>
  rename("Gender Pay Gap" = "payGap")
payGap20

# Plotting with tm_shape
plot2020 <- tm_shape(payGap20) + tm_polygons("Gender Pay Gap", palette = "YlOrBr") + tm_fill() + tm_layout(main.title = "Mean Gender Pay Gap: Military, South Central US in 2020", main.title.size = 1, bg.color = "lightblue")
plot2020


############################################################################################################################################
##### SAVING IMAGES #############################################################################################################################
############################################################################################################################################

tmap_save(plot2000, filename = "plot2000.png",height = 8, width = 12.72, dpi=300)
tmap_save(plot2010, filename = "plot2010.png",height = 8, width = 12.72, dpi=300)
tmap_save(plot2020, filename = "plot2020.png",height = 8, width = 12.72, dpi=300)

tmap_save(finalPlotPlot, filename = "finalPlotPlot.png",height = 8, width = 18, dpi=1200)
tmap_save(allMenPlot, filename = "allMenPlot.png",height = 8, width = 12.72, dpi=1200)


tmap_save(allWomenPlot, filename = "allWomenPlot.png",height = 8, width = 12.72, dpi=800)

tmap_save(allMenPlot00, filename = "allMenPlot00.png",height = 8, width = 12.72, dpi=800)

tmap_save(allWomenPlot00, filename = "allWomenPlot00.png",height = 8, width = 12.72, dpi=800)

tmap_save(allMenPlot10, filename = "allMenPlot10.png",height = 8, width = 12.72, dpi=800)

tmap_save(allWomenPlot10, filename = "allWomenPlot10.png",height = 8, width = 12.72, dpi=800)

tmap_save(allMenPlot20, filename = "allMenPlot20.png",height = 8, width = 12.72, dpi=800)

tmap_save(allWomenPlot20, filename = "allWomenPlot20.png",height = 8, width = 12.72, dpi=800)

tmap_save(finalPlotDiff00, filename = "finalPlotDiff00.png",height = 8, width = 12.72, dpi=800)

tmap_save(finalPlotDiff20, filename = "finalPlotDiff20.png",height = 8, width = 12.72, dpi=800)

plot(plotDiff00)
png("plotDiff00.png", width = 6, height = 6, units = "in", res = 800)

plot(plotDiff10)
png("plotDiff00.png", width = 6, height = 6, units = "in", res = 800)

plot(plotDiff20)
png("plotDiff00.png", width = 6, height = 6, units = "in", res = 800)
