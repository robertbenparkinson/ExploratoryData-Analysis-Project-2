##Exploratory Data Analysis Project 2
##Question 5

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
x <- subset(m, fips == "24510" | SCC.Level.Three == "Mobile Sources")

##plot
qplot(year, data=x, facets = type ~., 
      geom = "histogram", binwidth =1,
      main = "Emissions for Baltimore by Motor Vehicle Sources", fill=I("blue"), 
      xlab = "Years", ylab = "Emissions", xlim=c(1997, 2009))


##print to file
dev.copy(png, file="plot5.png", height=480, width=480)
dev.off()