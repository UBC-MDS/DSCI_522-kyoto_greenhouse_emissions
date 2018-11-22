# Required packages
library(readr)
library(tidyverse)

# Data analysis on greenhouse gas emission from 10 countries among 26 years

data_GH <- read_csv("data/raw/2018-11-14_DSCI_522_project_UN-data_GH.csv", 
                         col_types = cols(Year = col_character()))
str(data_GH)

# Rename column name `Country or Area`

data_GH <- data_GH %>%
  rename('Country' = 'Country or Area')
data_GH$Country <- as.factor(data_GH$Country)
str(data_GH)
write_csv(data_GH, "data/clean_data_GH.csv")

