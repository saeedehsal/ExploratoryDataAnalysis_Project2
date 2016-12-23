# read the data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC<- readRDS("./data/Source_Classification_Code.rds")

#select a subset of the data related to Baltimore
NEI_Baltimore <- subset(NEI, NEI$fips == "24510")

#aggregate based on the year and type
aggregate_NEI_Baltimore_year_Type <- aggregate( NEI_Baltimore$Emissions, by = list(type = NEI_Baltimore$type, year = NEI_Baltimore$year ), FUN = sum)
names(aggregate_NEI_Baltimore_year_Type) <- c("type", "year", "Emissions")

#create the plot
library("ggplot2")
png('plot3.png', width=480,height=480)

qplot(year, Emissions, data= aggregate_NEI_Baltimore_year_Type, color = type, geom = "line",
main = "Total PM2.5 emissions in Baltimore based on year and type", xlab = "year", ylab = "Emissions" )

dev.off()