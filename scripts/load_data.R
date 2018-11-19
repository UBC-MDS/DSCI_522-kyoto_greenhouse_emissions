# Required packages
library(readr)

# Data analysis on greenhouse gas emission from 10 countries among 26 years

data_GH <- read_csv("data/raw/2018-11-14_DSCI_522_project_UN-data_GH.csv", 
                         col_types = cols(Year = col_character()))
str(data_GH)
