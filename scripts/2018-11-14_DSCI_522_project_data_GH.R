# Required packages
library(readr)
library(ggplot2)
library(tidyverse)
library(dplyr)
# Data analysis on greenhouse gas emission from 10 countries among 26 years

data_GH <- read_csv("data/raw/2018-11-14_DSCI_522_project_UN-data_GH.csv", 
                         col_types = cols(Year = col_character()))
str(data_GH)
# Rename column name `Country or Area`

data_GH <- data_GH %>%
  rename(Country = `Country or Area`)


#### Data exploration ####

# 1. Outliers
ggplot(data_GH, aes(Year, Value, colour = Country )) +
  geom_point()
# No outliers
# Are there missing values?
sum(is.na(data_GH$Value))
# No missing value

# 2. Collinearity X
# Not relevant for the dataset
#C Relationships Y vs X
boxplot(Value ~ Year, 
        data = data_GH,
        xlab = "Year",
        ylab = "GH value")
# No relationship between Year and GH value

#3. Spatial/temporal aspects of sampling design
# Not relevant for the data set

# 4. Interactions
# Not relevant for the data set

# 5. Zero inflation Y (Are there many 0s in the data set)
sum(data_GH$Value == 0) #NONE

# 6. Are categorical covariates balanced?
# Not relevant for the data set

