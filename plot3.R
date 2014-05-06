
path = getwd()
directory = "exdata-data-household_power_consumption"
id = "household_power_consumption"
file <- paste(path, '/', directory, '/', id, '.txt', sep="")

data <-read.table(file, header = TRUE, sep=';', na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data_new <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

my_time <- paste(data_new$Date, data_new$Time)

my_time_new <- strptime(x, "%d/%m/%Y %H:%M:%S")

filename <- paste(path , '/' , "plot3.png", sep="")
png(filename, width = 480, height = 480)
plot(my_time_new, data_new$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
lines(my_time_new, data_new$Sub_metering_1, type = "l")
lines(my_time_new, data_new$Sub_metering_2, type = "l", col = 'red')
lines(my_time_new, data_new$Sub_metering_3, type = "l", col = 'blue')
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()