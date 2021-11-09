
## Load packages
library(here)
library(dplyr)

## Set up working directory and load dataset
here::i_am('R/tidy_data.R')
PM25<-read.csv(here::here('raw_data','processed.csv'))

## Summarize Data for making figures
test<-PM25%>%
  mutate(af_all =case_when(species == "PM25"~ 1-1/exp(concentration*.00032),
                           species == "PM10"~1-1/exp(concentration*.00038),
                           species == "SO2"~1-1/exp(concentration*.00081*2.62),
                           species == "NO2"~1-1/exp(concentration*.0013*1.88),
                           species == "CO"~1-1/exp(concentration*.000037*1.145),
                           species == "O3"~1-1/exp(concentration*.00048*2)),
         M_all= as.numeric(BM)*af_all*10)

## Prepare data for city graph
city<-test%>%  
  group_by(city,status,species,region,city_new)%>%
  summarize(pop_1=sum(as.numeric(pop)),
            M_all=sum(M_all)/as.numeric(pop_1)*1000)

## Prepare data for region graph
region<-test%>%
  group_by(region,status,species)%>%
  summarize(pop_1=sum(as.numeric(pop)),
            M_all=sum(M_all)/as.numeric(pop_1)*1000)

## Output csv file for graph visualization
write.csv(city, file = here::here("data","city.csv"))
write.csv(region, file = here::here("data","region.csv"))
