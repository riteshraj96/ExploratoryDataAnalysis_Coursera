
# Loading the NEI & SCC data frames.
NEI <- readRDS("summarySccPM25.rds")
SCC <- readRDS("SourceClassificationCode.rds")

# Subset NEI data with fip = 24510.
BaltimoreNEI <- NEI[NEI$fips=="24510",]

# finding Aggregate
AggTotalOfBaltimore <- aggregate(Emissions ~ year, BaltimoreNEI,sum)

png("plot3.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

GGplot2 <- ggplot(BaltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(GGplot2)

dev.off()
