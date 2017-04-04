## make sure the data file is in your working dir!

## load data
hpc <- read.csv("./household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, na.strings = "?")

## get data within 2 day window ( 2007-02-01 and 2007-02-02 )
hpc.window <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

## single date/time col, why not
hpc.window$Time <- strptime(paste(hpc.window$Date, hpc.window$Time), "%d/%m/%Y %H:%M:%S")

## open draw devide
png(filename="./plot2.png",width = 480, height = 480, units = "px")
## draw histogram
plot(hpc.window$Time, hpc.window$Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
## close device
dev.off()