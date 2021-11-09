# rule for making report  
R/report.html: figs/city.png figs/region.png R/report.Rmd
	Rscript -e "rmarkdown::render('R/report.Rmd', quiet = TRUE)"

# rule for creating figures
figs/city.png: data/city.csv 
	Rscript R/city_graph.R

figs/region.png: data/region.csv
	Rscript R/region_graph.R

# rule for tidying data
data/city.csv:  raw_data/processed.csv
	Rscript R/tidy_data.R

data/region.csv:  raw_data/processed.csv
	Rscript R/tidy_data.R