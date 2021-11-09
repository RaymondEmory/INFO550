# INFO550

## My project

This project aims to look into the long term impact of COVID-19 on China's regional air quality through health perspectives. The data in this directory has already been pre-processed (missing data cleaning, grouping by variables) The Rmd document here deals with summarizing pre-liminary results and plotting figures for eventual visualiztion purposes. 

To analyze the data you will need to install some R packages. The required packages can be installed using R commands.

```
installed_pkgs <- row.names(installed.packages())
pkgs <- c( "tidyverse", "ggplot2" )
for(p in pkgs){
	if(!(p %in% install_pkgs)){
		install.packages(p)
	}
}
```


## Execute the analysis
To execute the analysis, from the project folder you can run

`Rscript -e "rmarkdown::render('HW2_HC.Rmd')"`

The output html file can be found in the directory R/report.html

## Makefile
The makefile contains 5 output. To view them separately, type

```
make R/report.html
make figs/city.png
make figs/region.png
make data/city.csv
make data/region.csv
```
## Restore package environment
To keep track of the version of package used in the analysis, run the following code

```
renv::restore()
```
