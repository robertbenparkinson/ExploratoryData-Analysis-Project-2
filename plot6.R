##Exploratory Data Analysis Project 2
##Question 6

##Import dplry and ggplot2 libraries
library(dplyr)
library(ggplot2)

##Read the two data sets 
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

##merge both the NEI and SCC data.frames
m <- merge(NEI, SCC, by="SCC")
unique(m$Short.Name)


##subset
x <- subset(m, fips == c("24510", "06037") & SCC.Level.One == "Mobile Sources")

##plot
qplot(year, data=x, geom = "histogram", binwidth =1, facets = fips ~.,
      main = "Emissions for Baltimore (24510) and Los Angeles (06037) by Motor Vehicle Sources", 
      fill=I("blue"), xlab = "Year", ylab = "Emissions", xlim=c(1997, 2009))


##print to file
dev.copy(png, file="plot6.png", height=480, width=480)
dev.off()