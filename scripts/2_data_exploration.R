# Required packages
library(readr)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(forcats)

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

<<<<<<< HEAD

write_csv(data_GH, "data/clean_data_GH.csv")
=======
#7. Eploratory visualization that is useful to help the reader/consumer understand that dataset. 

output_viz <- clean_data_GH %>% 
          ggplot(aes(Year, Value, group = Country, colour = fct_reorder(Country, desc(Value)))) +
          geom_line()+
          ylab("Emission Value (kt)") +
          scale_y_continuous(labels = scales::comma) +
          labs(title = "Greenhouse Gas Emission over 25 years", 
               subtitle = "Including Indirect CO2, without LULUCF, in kilotonne CO2 equivalent",
               caption = "Source: Greenhouse Gas Inventory Data | UN Framework Convention on Climate Change") +
          theme(axis.text.x = element_text(angle = 65, hjust = 1, size = 8),
                legend.position = "right", 
                legend.title = element_blank(),
                legend.text=element_text(size=8),
                plot.caption=element_text(size=6),
                plot.subtitle = element_text(size = 8),
                axis.line = element_line(colour = "black"),
                panel.background = element_blank(),
                panel.border = element_rect(colour = "black", fill = NA),
                legend.key=element_blank()
                )


ggsave("image/GHG_exploreView.png", plot = output_viz)



>>>>>>> upstream/master
