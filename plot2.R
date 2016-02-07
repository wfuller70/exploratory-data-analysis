## Getting full dataset
ig <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
ig$Date <- as.Date(ig$Date, format="%d/%m/%Y")

## Subsetting the data
freq <- subset(ig, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(ig)

## Converting dates
hist_ig <- paste(as.Date(freq$Date), freq$Time)
freq$Datetime <- as.POSIXct(hist_ig)

## Plot 2
plot(freq$Global_active_power~freq$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="./plot2.png", height=480, width=480)
dev.off()