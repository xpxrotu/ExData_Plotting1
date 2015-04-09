# plot 3

# the file below is cleaned up
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

png(filename="plot3.png", width=504, height=504)
par(bg="white", fg="black")
with(data, {
    plot(DateTime, Sub_metering_1, type="l", main=""
        , ylab="Energy sub metering"
        , xlab="", col="black")
    lines(DateTime, Sub_metering_2, type="l", main="",
        col="red")
    lines(DateTime, Sub_metering_3, type="l", main="",
        col="blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
           , col=c("black", "red", "blue"), lwd=1)
})
dev.off()


