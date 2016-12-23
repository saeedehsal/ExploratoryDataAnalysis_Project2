#read the data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC<- readRDS("./data/Source_Classification_Code.rds")

#find where the source of the Emissions is Coal
SCC_Coal <- SCC[grepl("Coal" , SCC$Short.Name, ignore.case = TRUE), ]
NEI_Coal <- NEI[NEI$SCC %in% SCC_Coal$SCC, ]


#get the subset related to Coal Emissions
aggregate_NEI_Coal <- aggregate( NEI_Coal$Emissions, by = list(year = NEI_Coal$year), FUN = sum)
#aggregate based on the year
names(aggregate_NEI_Coal) <- c("year", "Emissions")

#create the plot
library("ggplot2")
png('plot4.png', width=480,height=480)

qplot(year, Emissions, data= aggregate_NEI_Coal, geom = "line",
main = "Total PM2.5 emissions in the US from Coal for each year", xlab = "year", ylab = "Emissions" )

dev.off()