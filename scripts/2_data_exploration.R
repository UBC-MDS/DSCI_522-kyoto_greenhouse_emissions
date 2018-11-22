# Required packages
library(readr)
library(ggplot2)
library(tidyverse)
library(dplyr)

# Data analysis on greenhouse gas emission from 10 countries among 26 years

clean_data_GH <- read_csv("data/clean_data_GH.csv", 
                    col_types = cols(Year = col_character()))

#### Data exploration ####

# 1. Outliers
ggplot(clean_data_GH, aes(Year, Value, colour = Country )) +
  geom_point()
# European Union has high values compared to other countries 
# EU will be discarded from the analysis 
clean_data_GH <- clean_data_GH %>% 
  filter(Country != "European Union")

# Are there missing values?
sum(is.na(clean_data_GH$Value))
# No missing value

# 2. Collinearity X
# Not relevant for the dataset
#C Relationships Y vs X
boxplot(Value ~ Year, 
        data = clean_data_GH,
        xlab = "Year",
        ylab = "GH value")
# No relationship between Year and GH value

#3. Spatial/temporal aspects of sampling design
# Not relevant for the data set

# 4. Interactions
# Not relevant for the data set

# 5. Zero inflation Y (Are there many 0s in the data set)
sum(clean_data_GH$Value == 0) #NONE

# 6. Are categorical covariates balanced?
# Not relevant for the data set


write_csv(data_GH, "data/clean_data_GH.csv")
