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

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(FilteredFilteredData, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power",xlab="datetime")
})


## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()