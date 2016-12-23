#read the data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC<- readRDS("./data/Source_Classification_Code.rds")

#get subsets of data related to Baltimore and Los Angeles
NEI_Baltimore_motor <- subset(NEI,(NEI$fips == "24510") & (type == "ON-ROAD"))
NEI_LosAngeles_motor <- subset(NEI,(NEI$fips == "06037") & (type == "ON-ROAD"))

#aggregate
aggregate_NEI_Baltimore_motor <- aggregate( NEI_Baltimore_motor$Emissions, by = list(year = NEI_Baltimore_motor$year), FUN = sum)
names(aggregate_NEI_Baltimore_motor) <- c("year", "Emissions")
aggregate_NEI_Baltimore_motor$City <- "Baltimore"

aggregate_NEI_LosAngeles_motor <- aggregate( NEI_LosAngeles_motor$Emissions, by = list(year = NEI_LosAngeles_motor$year), FUN = sum)
names(aggregate_NEI_LosAngeles_motor) <- c("year", "Emissions")
aggregate_NEI_LosAngeles_motor$City <- "LosAngeles"
aggregat_NEI_Both_motor <- rbind(aggregate_NEI_Baltimore_motor, aggregate_NEI_LosAngeles_motor)

#create the plot
library("ggplot2")
png('plot6.png', width=480,height=480)

ggp <- ggplot(aggregat_NEI_Both_motor, aes(x=factor(year), y=Emissions, fill=City))
ggp + geom_bar(stat = "identity", position=position_dodge()) +  facet_grid(scales="free", space="free", .~City) + labs(x = "year", y = "Emissions")

dev.off()