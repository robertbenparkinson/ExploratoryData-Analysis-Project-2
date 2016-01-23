##Exploratory Data Analysis Project 2
##Question 4

##Import dplry and ggplot2 libraries
library(dplyr)
library(ggplot2)

##Read the two data sets 
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

##merge both the NEI and SCC data.frames
m <- merge(NEI, SCC, by="SCC")
unique(m$Short.Name)

##The two categories of coal that were used are below
##unique(m$SCC.Level.Three)
##[1] Anthracite Coal                                                       
##[2] Bituminous/Subbituminous Coal
##test

##subset
x <- subset(m, SCC.Level.Three == "Anthracite Coal" | SCC.Level.Three == "Bituminous/Subbituminous Coal")


##plot
qplot(year, data=x, geom = "histogram", binwidth =1,
      main = "Total Coal Emissions for USA", fill=I("blue"), 
      xlab = "Years", ylab = "Emissions", xlim=c(1997, 2009))


##print to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()