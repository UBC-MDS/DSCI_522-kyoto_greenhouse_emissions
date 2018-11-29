all : results/report.pdf

# script 1: 1_load_data.R
data/data_GH.csv : data/raw/2018-11-14_DSCI_522_project_UN-data_GH.csv scripts/1_load_data.R
	Rscript scripts/1_load_data.R data/raw/2018-11-14_DSCI_522_project_UN-data_GH.csv data/data_GH.csv

# script 2: 2_data_exploration.R
data/clean_data_GH.csv results/fig/GHG_explore.png : data/data_GH.csv scripts/2_data_exploration.R
	Rscript scripts/2_data_exploration.R data/data_GH.csv data/clean_data_GH.csv results/fig/GHG_explore.png

# script 3: 3_analyze_data.R
results/summarized_ANOVA.csv results/glht_GH_letters.csv : data/clean_data_GH.csv scripts/3_analyze_data.R
	Rscript scripts/3_analyze_data.R data/clean_data_GH.csv results/summarized_ANOVA.csv results/glht_GH_letters.csv

# script 4: 4_plot_results.R
results/fig/GH_boxplot.png : data/clean_data_GH.csv results/glht_GH_letters.csv scripts/4_plot_results.R
	Rscript scripts/4_plot_results.R data/clean_data_GH.csv results/glht_GH_letters.csv results/fig/GH_boxplot.png

# script 5: 5_plot_estimates.R
results/fig/GH_est_plot.png : data/clean_data_GH.csv scripts/5_plot_estimates.R
	Rscript scripts/5_plot_estimates.R data/clean_data_GH.csv results/fig/GH_est_plot.png

results/report.pdf : results/report.Rmd data/clean_data_GH.csv results/fig/GHG_explore.png results/fig/GH_boxplot.png results/fig/GH_est_plot.png
	Rscript -e "rmarkdown::render('results/report.Rmd')"

clean :
	rm -f data/*.csv
	rm -f results/fig/*.png
	rm -f results/*.csv
	rm -f results/*.pdf
