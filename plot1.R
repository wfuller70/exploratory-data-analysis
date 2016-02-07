## Getting full dataset
ig <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
ig$Date <- as.Date(ig$Date, format="%d/%m/%Y")

## Subsetting the data
freq <- subset(ig, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(ig)

## Converting dates
hello_ig <- paste(as.Date(freq$Date), freq$Time)
freq$Datetime <- as.POSIXct(hello_ig)

## Plot 1
hist(freq$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="./plot1.png", height=480, width=480)
dev.off()