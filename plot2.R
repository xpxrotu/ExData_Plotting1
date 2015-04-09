# plot 2

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

png(filename="plot2.png", width=480, height=480)
par(bg="white", fg="black")
with(data, plot(DateTime, Global_active_power, type="l", main=""
                , ylab="Global Active Power (kilowatts)"
                , xlab=""))
dev.off()


