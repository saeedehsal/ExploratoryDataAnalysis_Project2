#Read the data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC<- readRDS("./data/Source_Classification_Code.rds")

#get a subset related to Baltimore and Type = "ON-ROAD"
NEI_Baltimore_motor <- subset(NEI,(NEI$fips == "24510") & (type == "ON-ROAD"))

#aggregate
aggregate_NEI_Baltimore_motor <- aggregate( NEI_Baltimore_motor$Emissions, by = list(year = NEI_Baltimore_motor$year), FUN = sum)
names(aggregate_NEI_Baltimore_motor) <- c("year", "Emissions")

#create the plot
library("ggplot2")
png('plot5.png', width=480,height=480)

qplot(year, Emissions, data= aggregate_NEI_Baltimore_motor, geom = "line",
main = "Total PM2.5 emissions in Baltimore from motor vehicle for each year", xlab = "year", ylab = "Emissions" )

dev.off()