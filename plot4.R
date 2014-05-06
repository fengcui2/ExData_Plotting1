
path = getwd()
directory = "exdata-data-household_power_consumption"
id = "household_power_consumption"
file <- paste(path, '/', directory, '/', id, '.txt', sep="")

data <-read.table(file, header = TRUE, sep=';', na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data_new <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

my_time <- paste(data_new$Date, data_new$Time)
my_time_new <- strptime(x, "%d/%m/%Y %H:%M:%S")

filename <- paste(path , '/' , "plot4.png", sep="")
png(filename, width = 480, height = 480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))


with(data_new, {

plot(my_time_new, Global_active_power, type="n", ylab = "Global Active Power", xlab = "")
lines(my_time_new, Global_active_power, type = "l")

plot(my_time_new, Voltage, type="n", ylab = "Voltage", xlab = "datetime")
lines(my_time_new, Voltage, type = "l")

plot(my_time_new, Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
lines(my_time_new, Sub_metering_1, type = "l")
lines(my_time_new, Sub_metering_2, type = "l", col = 'red')
lines(my_time_new, Sub_metering_3, type = "l", col = 'blue')
legend("topright", lty = c(1, 1, 1), lwd = c(0.2, 0.2, 0.2), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")	

plot(my_time_new, Global_reactive_power, type="n", ylab = "Global_reactive_power", xlab = "datetime")
lines(my_time_new, Global_reactive_power, type = "l")

})
dev.off()
