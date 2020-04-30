library("ggplot2")
library("maps")
library("plotly")

# Set working directory
setwd("C:/Users/pisit/Documents/GitHub/DataVitual/Lab-ch09-20200319")

# Load data
covid_data <- read.csv("data/covid19_preprocessed.csv", sep = ",", header = TRUE)

# Generate us_state map data
world_covid <- map_data("world")


#world_covid <- world[covid_data$Country %in% covid_data$Country, ]
world_covid$TotalCases = covid_data$TotalCases[match(world_covid$region, covid_data$Country)]
world_covid$TotalDeaths = covid_data$TotalDeaths[match(world_covid$region, covid_data$Country)]
world_covid$Recovered = covid_data$Recovered[match(world_covid$region, covid_data$Country)]
world_covid$ActiveCases = covid_data$ActiveCases[match(world_covid$region, covid_data$Country)]
world_covid$SeriousCases = covid_data$SeriousCases[match(world_covid$region, covid_data$Country)]


Countries = unique(world_covid$region)
CDF = data.frame(fac_country=Countries)
for(i in CDF){
  world_covid$TotalCases = ifelse(world_covid$region %in% CDF$label1[i],
                                  (covid_data$TotalCases), world_covid$TotalCases)
}

# Plot
map <- ggplot(data=world_covid, aes(x=long, y=lat, group=group), 
              fill="#ffffff", color="#636363", size=0.15)

p <- map + 
  geom_polygon(aes(fill = TotalCases), color = 'white', size = 0.1) +
  scale_fill_gradient(high = "#FF0000", low = "#FFCF96", guide = "colorbar") +
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

ggplotly(p, tooltip="text")

