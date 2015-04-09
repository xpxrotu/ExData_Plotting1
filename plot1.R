
# the file below is cleaned up, only dates that interest us
data <- read.csv("data/hpc.txt", sep=";", header=TRUE,
                 na.strings=c("?"),
                 colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric",
                              "numeric", "numeric", "numeric"))

names(data)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")
head(data)

png(filename="plot1.png", width=504, height=504)
par(bg="white", fg="black")
hist(data$Global_active_power, main="Global Active Power", col="red",
     xlab="Global Active Power (kilowatts)")
dev.off()





