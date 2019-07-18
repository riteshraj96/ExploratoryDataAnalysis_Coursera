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

## Plot 1
FilteredFilteredFilteredFilteredData$Global_active_power <- as.numeric(FilteredFilteredFilteredFilteredData$Global_active_power)## as youu will ##get x must be numeric error 
hist(FilteredFilteredFilteredFilteredFilteredData$Global_active_power, main="Global Active Power", 
     ## Saving to file
     dev.copy(png, file="plot1.png", height=480, width=480)
     dev.off() xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")