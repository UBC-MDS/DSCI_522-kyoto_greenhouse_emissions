# Required libraries
library(readr)
library(broom)

clean_data_GH <- read_csv("data/clean_data_GH.csv")
str(clean_data_GH)

# ANOVA to detect if there is significant difference among the countries

aov_GH <-aov(Value ~ Country, data = clean_data_GH)
summary(aov_GH)
# there is significant difference in greenhouse emission among the countries

tidy_aov <- broom::tidy(aov_GH)

#write ANOVA summary to .csv in results
write_csv(tidy_aov, "results/summarized_data.csv")


# Which countries are difference compared to each other?
TukeyHSD(aov_GH) #THIS PART NEEDS TO BE DISCUSSED.

