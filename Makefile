all : doc/report.md

# script 1: 1_load_data.R 
# This very first script loads raw data from the data folder and output clean data int to a csv file.
data/data_GH.csv : data/raw/2018-11-14_DSCI_522_project_UN-data_GH.csv scripts/1_load_data.R
	Rscript scripts/1_load_data.R data/raw/2018-11-14_DSCI_522_project_UN-data_GH.csv data/data_GH.csv

# script 2: 2_data_exploration.R
# The script reads clean data and creates an exploratory visualization of the green house emission dataset.
data/clean_data_GH.csv results/fig/GHG_explore.png : data/data_GH.csv scripts/2_data_exploration.R
	Rscript scripts/2_data_exploration.R data/data_GH.csv data/clean_data_GH.csv results/fig/GHG_explore.png

# script 3: 3_analyze_data.R
# Third script reads clean data and performs an ANOVA test, then writes these numerical data to file in CSV format. 
results/summarized_ANOVA.csv results/glht_GH_letters.csv : data/clean_data_GH.csv scripts/3_analyze_data.R
	Rscript scripts/3_analyze_data.R data/clean_data_GH.csv results/summarized_ANOVA.csv results/glht_GH_letters.csv

# script 4: 4_plot_results.R
# This script reads the output of the third script, and generate a boxplot and save it to results/fig folder. 
results/fig/GH_boxplot.png : data/clean_data_GH.csv results/glht_GH_letters.csv scripts/4_plot_results.R
	Rscript scripts/4_plot_results.R data/clean_data_GH.csv results/glht_GH_letters.csv results/fig/GH_boxplot.png

# script 5: 5_plot_estimates.R
# This script reads the output of the third script, generate a boxplot and save it to results/fig folder. 
results/fig/GH_est_plot.png : data/clean_data_GH.csv scripts/5_plot_estimates.R
	Rscript scripts/5_plot_estimates.R data/clean_data_GH.csv results/fig/GH_est_plot.png

# This command generates a report.md document and a .html document as a report into the /doc folder by reading the .Rmd report
doc/report.md : doc/report.Rmd data/clean_data_GH.csv results/fig/GHG_explore.png results/fig/GH_boxplot.png results/fig/GH_est_plot.png
	Rscript -e "rmarkdown::render('doc/report.Rmd')"

clean :
	rm -f data/*.csv
	rm -f results/fig/*.png
	rm -f results/*.csv
	rm -f doc/*.md
	rm -f doc/*.html
