## make sure the data file is in your working dir!

## load data
hpc <- read.csv("./household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, na.strings = "?")

## get data within 2 day window ( 2007-02-01 and 2007-02-02 )
hpc.window <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

## single date/time col, why not
hpc.window$Time <- strptime(paste(hpc.window$Date, hpc.window$Time), "%d/%m/%Y %H:%M:%S")

## open draw devide
png(filename="./plot4.png",width = 480, height = 480, units = "px")
## draw
par(mfrow = c(2,2), mar= c(4,4,2,1), oma = c(0,0,2,0))
with(hpc.window, {
    ## top left
    plot(Time, Global_active_power, type="l", xlab = "", ylab="Global Active Power")
    ## top right
    plot(Time, Voltage, type="l",  ylab="Voltage", xlab="datetime")
    ## bottom left
    plot(Time, Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering")
    lines(Time, Sub_metering_2, col="red")
    lines(Time, Sub_metering_3, col="blue")
    legend("topright", lty = 1, col = c( "black", "red", "blue"), bty = "n",legend = c("Sub_metering_1", "Sub_metering_1", "Sub_metering_3"))
    ## bottome right
    plot(Time, Global_reactive_power, type="l",  ylab="Global_reactive_power", xlab="datetime")
})
## close device
dev.off()