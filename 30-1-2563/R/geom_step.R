library("tidyverse")

rm(list=ls())

postage <- read.csv("data/us-postage.csv",sep=",",header=TRUE)

ggplot(postage,aes(x=postage$Year, y=postage$Price)) + 
  geom_step(color='red',size=1) +
  xlab("Year")+ylab("Population (Billion people)") +
  scale_y_continuous(breaks = c(seq(0.25,0.50,0.05)), 
                     limits = c(0.25,0.50))
  # +scale_x_continuous(breaks = c(seq(min(postage$Year),max(postage$Year)+1,2)), 
   #                  limits = c(min(min(postage$Year),max(postage$Year)+1)))
