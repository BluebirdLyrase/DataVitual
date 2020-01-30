# Load data
unemployment <- read.csv("http://datasets.flowingdata.com/unemployment-rate-1948-2010.csv", sep=",")
unemployment[1:10,]

# Plain scatter plot
plot(1:length(unemployment$Value), unemployment$Value, cex=.3)


# Fitted linear line
lines(c(1,746), c(4.889523,6.42593))

# Scatter plot with loess
scatter.smooth(x=1:length(unemployment$Value), y=unemployment$Value, cex=.3,degree=2,span=0.5,col="blue", 
               lpars = list(col = "red"))
#lower the span more smooth the scatter be
#lpars = list(col = "red", lwd = 3, lty = 3)