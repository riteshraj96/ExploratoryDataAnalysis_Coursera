
# Loading the NEI & SCC data frames.
NEI <- readRDS("summarySccPM25.rds")
SCC <- readRDS("SourceClassificationCode.rds")


Vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
VehicleCC <- SCC[Vehicle,]$SCC
VehicleNEI <- NEI[NEI$SCC %in% VehicleCC,]



VehicleBaltimoreNEI <- VehicleNEI[VehicleNEI$fips=="24510",]
VehicleBaltimoreNEI$city <- "Baltimore City"

VehicleLANEI <- VehicleNEI[VehicleNEI$fips=="06037",]
VehicleLANEI$city <- "Los Angeles County"

# Combining the subsets with city name into a data frame
combinedNEI <- rbind(VehicleBaltimoreNEI,VehicleLANEI)

png("plot6.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)
 
GGplot2 <- ggplot(combinedNEI, aes(x=factor(year), y=Emissions, fill=city)) +
 geom_bar(aes(fill=year),stat="identity") +
 facet_grid(scales="free", space="free", .~city) +
 guides(fill=FALSE) + theme_bw() +
 labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
 labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))
 
print(GGplot2)

dev.off()