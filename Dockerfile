# Docker file for DSCI_522_greenhouse_emissions_comparisons
# Miliban Keyim, Kera Yucel, Chao Wang
# Dec 6, 2018
# Description: This file create an automatic data analysis pipeline through our Makefile.

# Usage:
#   Docker Pull Command:  docker pull chaomander2018/dsci_522_greenhouse_emissions_comparisons
#   Go into the container:docker run --rm -it -e PASSWORD=test -v <ABSOLUTE PATH OF REPO>:/home/milestone3 chaomander2018/dsci_522_greenhouse_emissions_comparisons /bin/bash
#   To create the report: docker run --rm -e PASSWORD=test -v <ABSOLUTE PATH OF REPO>:/home/milestone3 chaomander2018/dsci_522_greenhouse_emissions_comparisons make -C '/home/milestone3' all
#		To get a clean start: docker run --rm -e PASSWORD=test -v <ABSOLUTE PATH OF REPO>:/home/milestone3 chaomander2018/dsci_522_greenhouse_emissions_comparisons make -C '/home/milestone3' clean

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
