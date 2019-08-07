
# Loading the NEI & SCC data frames.
NEI <- readRDS("summarySccPM25.rds")
SCC <- readRDS("SourceClassificationCode.rds")


Vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
VehicleSCC <- SCC[Vehicle,]$SCC
VehicleNEI <- NEI[NEI$SCC %in% VehicleSCC,]


baltimoreVehicleNEI <- VehicleNEI[VehicleNEI$fips=="24510",]

png("plot5.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

GGplot2 <- ggplot(baltimoreVehicleNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(GGplot2)

dev.off()