
path = getwd()
directory = "exdata-data-household_power_consumption"
id = "household_power_consumption"
file <- paste(path, '/', directory, '/', id, '.txt', sep="")

data <-read.table(file, header = TRUE, sep=';', na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data_new <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

my_time <- paste(data_new$Date, data_new$Time)

my_time_new <- strptime(x, "%d/%m/%Y %H:%M:%S")

plot(my_time_new, data_new$Global_active_power, type="n", ylab = "Global Active Power (kilowatts)", xlab = "", cex.axis = 0.7, cex.lab = 0.7)
lines(my_time_new, data_new$Global_active_power, type = "l")
