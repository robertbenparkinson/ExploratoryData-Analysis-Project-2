##Exploratory Data Analysis Project 2
##Question 2

##Import dplry and ggplot2 libraries
library(dplyr)
library(ggplot2)

##Read the two data sets 
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")


##subset
x <- subset(NEI, fips == "24510")
hist(x$year)


##plot
hist(x$year, col ="blue", main = "PM2.5 Emissions in Baltimore from all Sources", 
     xlab = "Years", ylab = "Emissions")


##print to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()