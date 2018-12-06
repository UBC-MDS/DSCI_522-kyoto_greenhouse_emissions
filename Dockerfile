# Docker file for DSCI_522_greenhouse_emissions_comparisons
# Miliban Keyim, Kera Yucel, Chao Wang
# Dec 6, 2018
# Description: This file create an automatic data analysis pipeline through our Makefile.

# Usage:
#   To build the docker image: docker build --DSCI_522_greenhouse_emissions_comparisons:0.1 .
#   To create the report: docker run --rm -v PASSWORD=test -v /Users/chao/Documents/MDS-B3/DSCI_522_greenhouse_emissions_comparisons: /home/rstudio/DSCI_522_greenhouse_emissions_comparisons DSCI_522_greenhouse_emissions_comparisons make -C '/home/rstudio/DSCI_522_greenhouse_emissions_comparisons' all
#		To get a clean start: docker run --rm -v PASSWORD=test -v /Users/chao/Documents/MDS-B3/DSCI_522_greenhouse_emissions_comparisons: /home/rstudio/DSCI_522_greenhouse_emissions_comparisons DSCI_522_greenhouse_emissions_comparisons make -C '/home/rstudio/DSCI_522_greenhouse_emissions_comparisons' clean

# use rocker/tidyverse as the base image and
FROM rocker/tidyverse



# get R package dependencies
RUN R -e "install.packages('tidyverse')"
RUN R -e "install.packages('readr')"
RUN R -e "install.packages('ggplot2')"
RUN R -e "install.packages('dplyr')"
RUN R -e "install.packages('forcats')"
RUN R -e "install.packages('broom')"
RUN R -e "install.packages('scales')"
RUN R -e "install.packages('emmeans')"
RUN R -e "install.packages('multcompView')"
RUN R -e "install.packages('multcomp')"
