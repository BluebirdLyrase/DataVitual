#install.packages("tidyverse")
#install.packages("RColorBrewer")

library("tidyverse")
library("RColorBrewer")

#set working directory
setwd("C:/Users/STD-PC/Desktop/Lab_ch04-part1-20200123")

#Clear data
rm(list=ls())

#load data
hd_data <- read.csv("./data/hot-dog-contest-winners.csv",sep=",",header = TRUE)

#show data
hd_data

#rename some column
colnames(hd_data)[3] <- "eaten"
colnames(hd_data)[5] <- "new_rec"

#Convert integer tp factor
hd_data$new_rec <- as.factor(hd_data$new_rec)

#Create geometric object
hd_obj <- ggplot(data=hd_data, aes(x=Year, y=eaten, fill=new_rec)) + xlab("Year") + ylab("Hot dogs and buns (HDB) eaten") + ggtitle("Nathan's Hot Dog Eating Contest Results, 1980-2010") + theme(plot.title = element_text(hjust = 0.5))

#Create bar chart
hd_bar <- hd_obj + geom_bar(stat="identity") + scale_fill_manual(values=c("#FFFFFF","#000000"))+guides(fill = guide_legend(title = "New record"))

#shoe 
hd_bar
