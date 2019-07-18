#Complete FilteredFilteredFilteredFilteredFilteredData Set
?read.table

FullFilteredFilteredFilteredFilteredFilteredData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="NA", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
FullFilteredFilteredFilteredFilteredFilteredData$Date <- as.Date(FullFilteredFilteredFilteredFilteredFilteredData$Date, format="%d/%m/%Y")
write.csv(FullFilteredFilteredFilteredFilteredFilteredData, file = "household_power_consumption.csv")


## Filtering or Subsetting the FilteredFilteredFilteredFilteredFilteredData According to Date 
FilteredFilteredFilteredFilteredFilteredFilteredData <- subset(FullFilteredFilteredFilteredFilteredFilteredData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#rm(FullFilteredFilteredFilteredFilteredFilteredData)
head(FilteredFilteredFilteredFilteredFilteredData)

## Converting dates
datetime <- paste(as.Date(FilteredFilteredFilteredFilteredFilteredData$Date), FilteredFilteredFilteredFilteredFilteredData$Time)
FilteredFilteredFilteredFilteredFilteredData$Datetime <- as.POSIXct(datetime)
##plotting graph
with(FilteredFilteredFilteredData, {
  plot(Sub_metering_1~Datetime,type="l",xlab="",ylab="Energy sub metering")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright",lty=1, lwd=2, col = c("black", "red","blue"), legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))
## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()