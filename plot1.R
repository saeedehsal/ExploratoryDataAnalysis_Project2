#read the data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC<- readRDS("./data/Source_Classification_Code.rds")

#aggregate Emissions based on the yaer
aggregate_NEI <- aggregate( Emissions ~ year, NEI, sum)

# open the png connection, create the plot and close the device
png('plot1.png', width=480,height=480)
plot(aggregate_NEI$year, aggregate_NEI$Emissions, type = "o", main = "Total PM2.5 emissions in the US from all sources for each year", 
xlab = "Year", ylab = "Total PM2.5 Emissions (tons)", pch = 18, lty = 5)
dev.off()