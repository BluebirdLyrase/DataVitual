library("ggplot2")
library("maps")
library("plotly")

# Set working directory
setwd("/Users/por/Documents/PSU/Course/C_DV/Lab/ch09/")

# Load data
unemp <- read.csv("data/unemployment.txt", sep = "\t", header = TRUE)

# Generate us_state map data
us <- map_data("state")

# Merge data (state+unemployment)
us_unemp <- merge(unemp, us, by = "region")

# Plot
map <- ggplot(data=us_unemp, aes(x=long, y=lat, group=COUNTY), 
              fill="#ffffff", color="#636363", size=0.15)

p <- map + 
  geom_polygon(aes(fill = RATE), color = 'white', size = 0.1) +
  scale_fill_gradient(high = "#e34a33", low = "#fee8c8", guide = "colorbar") +
  coord_fixed(1.3) +
  labs(title="Unemployment by State, Aug-2010") +
  # Align title as center
  theme(plot.title = element_text(hjust = 0.5)) +
  # Remove lines and text of x,y axises
  theme(axis.title=element_blank(),
        axis.text=element_blank(),
        panel.grid.major=element_blank(), 
        panel.grid.minor=element_blank(),
        axis.ticks=element_blank())

ggplotly(p, tooltip="text")