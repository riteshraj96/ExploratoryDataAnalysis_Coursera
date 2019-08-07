
# Loading the NEI & SCC data frames.
NEI <- readRDS("summarySccPM25.rds")
SCC <- readRDS("SourceClassificationCode.rds")

# Subset NEI data with fip = 24510.
BaltimoreNEI <- NEI[NEI$fips=="24510",]

# finding Aggregate
AggTotalOfBaltimore <- aggregate(Emissions ~ year, BaltimoreNEI,sum)

png("plot2.png",width=480,height=480,units="px",bg="transparent")

barplot(
  AggTotalOfBaltimore$Emissions,
  names.arg=AggTotalOfBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From all Baltimore City Sources"
)

dev.off()