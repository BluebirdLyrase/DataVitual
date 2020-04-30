library(ggmap)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(plotly)
setwd("C:/Users/pisit/Documents/GitHub/DataVitual/Lab-ch09-20200319")
# Load data
covid_data <- read.csv("data/covid19_preprocessed.csv", sep = ",", header = TRUE)

# Load worldmap data
world_covid <- map_data("world")

#world_covid <- world[covid_data$Country %in% covid_data$Country, ]
world_covid$CasesPerMil = covid_data$CasesPerMil[match(world_covid$region, covid_data$Country)]

Countries = unique(world_covid$region)
CDF = data.frame(fac_country=Countries)
for(i in CDF){
  world_covid$CasesPerMil = ifelse(world_covid$region %in% CDF$label1[i],
                                   (covid_data$CasesPerMil), world_covid$CasesPerMil)
}


# Plot
map <- ggplot(data=world_covid, aes(x=long, y=lat, group=group, 
                                    text=paste(region, "\n","Cases per Mil: ", CasesPerMil, "\n")), 
              fill="#ffffff", color="#636363", size=0.15)

p <- map + 
  geom_polygon(aes(fill = CasesPerMil), color = 'white', size = 0.1) +
  scale_fill_gradient(high = "#e34a33", low = "#fee8c8", guide = "colorbar") +
  coord_fixed(1.3) +
  labs(title="COVID-19 Cases") +
  # Align title as center
  theme(plot.title = element_text(hjust = 0.5)) +
  # Remove lines and text of x,y axises
  theme(axis.title=element_blank(),
        axis.text=element_blank(),
        panel.grid.major=element_blank(), 
        panel.grid.minor=element_blank(),
        axis.ticks=element_blank())

# Display text on hover
ggplotly(p, tooltip="text")
