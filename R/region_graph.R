## Load packages
library(here)
library(dplyr)
library(ggplot2)

## Set up working directory and load dataset
here::i_am('R/region_graph.R')
region<-read.csv(here::here('data','region.csv'))

## Filter data and create region graph
ggplot()+
  geom_bar(region,mapping= aes(x=region,y=M_all,fill=status), width=0.6,position = position_dodge(),stat = "identity")+
  geom_text(region,mapping=aes(x=region, y=M_all,label=round(M_all,2),group=status), position=position_dodge(width = 0.5),size=2.5)+
  theme_bw()+
  labs(title = "Health Burden", y ="Mortality Per thousand people" )+ 
  theme(plot.title = element_text(hjust = 0.5),axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
ggsave(file = "region.png",path = here::here("figs"),device = "png")
