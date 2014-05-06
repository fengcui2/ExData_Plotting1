
path = getwd()
directory = "exdata-data-household_power_consumption"
id = "household_power_consumption"
file <- paste(path, '/', directory, '/', id, '.txt', sep="")

data <-read.table(file, header = TRUE, sep=';', na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data_new <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

filename <- paste(path , '/' , "plot1.png", sep="")
png(filename, width = 480, height = 480)
hist(data_new$Global_active_power, col = 'red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
