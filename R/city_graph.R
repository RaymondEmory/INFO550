## Load packages
library(here)
library(dplyr)
library(ggplot2)

## Set up working directory and load dataset
here::i_am('R/city_graph.R')
city<-read.csv(here::here('data','city.csv'))

## Filter data and create city graph
observed<-city%>%
  filter(status == "3.post-observed")

predicted<-city%>%
  filter(status == "3.post-predicted")

ggplot()+
  geom_bar(predicted,mapping= aes(x=city_new,y=M_all,),fill ="red", width=0.3,position = position_stack(),stat = "identity")+
  geom_text(predicted,mapping=aes(x=city_new, y=M_all,label=round(M_all,2),group=species), position=position_stack(vjust= .5),size=2)+
  geom_bar(observed,mapping= aes(x=city_new,y=M_all),fill="blue", width=0.3,position = position_stack(),stat = "identity")+
  geom_text(observed,mapping=aes(x=city_new, y=M_all,label= round(M_all,2),group=species), position=position_stack(vjust=.5),size=2)+
  theme_bw()+
  labs(title = "Health Burden", y ="Mortality Per thousand people" )+ 
  theme(plot.title = element_text(hjust = 0.5),axis.text.x = element_text(vjust = 0.5, hjust=1))+
  coord_flip()
ggsave(file = "city.png",path = here::here("figs"), device = "png",width = 5,height=10)
