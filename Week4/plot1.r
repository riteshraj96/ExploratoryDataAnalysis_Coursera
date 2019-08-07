
# Loading the NEI & SCC data frames.
NEI <- readRDS("summarySccPM25.rds")
SCC <- readRDS("SourceClassificationCode.rds")

# Aggregate by sum the total emissions by year
AggTotal <- aggregate(Emissions ~ year,NEI, sum)

png("plot1.png",width=480,height=480,units="px",bg="transparent")

barplot(
  (AggTotal$Emissions)/10^6,
  names.arg=AggTotal$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions From All US Sources"
)

dev.off()