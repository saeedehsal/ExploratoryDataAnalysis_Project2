#read the data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC<- readRDS("./data/Source_Classification_Code.rds")

#select a subset of data related to Baltimore
NEI_Baltimore <- subset(NEI, NEI$fips == "24510")

#aggregate base on the yaer
aggregate_NEI_Baltimore <- aggregate( Emissions ~ year, NEI_Baltimore, sum)

#open the device, write the plot and the close it
png('plot2.png', width=480,height=480)
plot(aggregate_NEI_Baltimore$year, aggregate_NEI_Baltimore$Emissions
, type = "o", main = "Total PM2.5 emissions in Baltimore from all sources for each year",
 xlab = "Year", ylab = "Total PM2.5 Emissions (tons)", pch = 18, lty = 5)
dev.off()
