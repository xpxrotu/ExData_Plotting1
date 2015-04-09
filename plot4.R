# plot 4

# the file below is cleaned up, only dates that interest us
data <- read.csv("data/hpc.txt", sep=";", header=TRUE,
                 na.strings=c("?"),
                 colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric",
                              "numeric", "numeric", "numeric"))

# create a new datetime field
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), '%d/%m/%Y %H:%M:%S')
names(data)
head(data)
class(data$DateTime)

png(filename="plot4.png", width=480, height=480)
par(bg="white", fg="black", mfrow=c(2,2))

with(data, plot(DateTime, Global_active_power, type="l", main=""
                , ylab="Global Active Power"
                , xlab=""))
with(data, plot(DateTime, Voltage, type="l", main=""
                , ylab="Voltage"
                , xlab="datetime"))
with(data, {
    plot(DateTime, Sub_metering_1, type="l", main=""
        , ylab="Energy sub metering"
        , xlab="", col="black")
    lines(DateTime, Sub_metering_2, type="l", main="",
        col="red")
    lines(DateTime, Sub_metering_3, type="l", main="",
        col="blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
           , col=c("black", "red", "blue"), lwd=1, bty="n")
})

with(data, plot(DateTime, Global_reactive_power, type="l", main=""
                , ylab="Global_reactive_power"
                , xlab="datetime"))

dev.off()
