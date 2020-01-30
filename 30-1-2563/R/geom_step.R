library("tidyverse")

setwd("")

rm(list=ls())

pop <- read.csv("data/us-postage.csv",sep=",",header=TRUE)

ggplot(pop,aes(x=pop$Year, y=pop$Price)) + 
  geom_step(color='red',size=1) +
  xlab("Year")+ylab("Population (Billion people)") +
  scale_y_continuous(breaks = c(seq(0.25,0.50,0.05)), 
                     labels = c(seq(0.25,0.50,0.05)),
                     limits = c(0.25,0.50))
