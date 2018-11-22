# Required libraries
library(readr)


clean_data_GH <- read_csv("data/clean_data_GH.csv")
str(clean_data_GH)

# ANOVA to detect if there is significant difference among the countries

aov_GH <-aov(Value ~ Country, data = clean_data_GH)
summary(aov_GH)
# there is significant difference in greenhouse emission among the countries

# Which countries are difference compared to each other?
TukeyHSD(aov_GH) #THIS PART NEEDS TO BE DISCUSSED.

