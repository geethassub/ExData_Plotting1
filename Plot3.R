#load the file
file <- read.csv(file.path(getwd(), "household_power_consumption.txt"), sep = ";", na.strings = "?", header = T, stringsAsFactors = F)
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
file1 <- subset(file, subset = (file$Date >= "2007-02-01"& file$Date <="2007-02-02"))
time <- strptime(paste(file1$Date, file1$Time, sep = " "), "%y-%m%d %H:%M:%S")
datetime <- paste(as.Date(file1$Date), file1$Time)
file1$Datetime <- as.POSIXct(datetime)
rm(file)

#generating the plot

png(filename='plot3.png',width=480,height=480,units='px')

with (file1, plot(file1$Sub_metering_1~file1$Datetime, xlab = "", ylab = "Energy sub metering", type = "l"))
lines(file1$Sub_metering_2~file1$Datetime, col = "red")
lines(file1$Sub_metering_3~file1$Datetime, col = "blue")

legend("topright", col =c("black", "red", "blue"),lty = 1 , lwd = 2, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = .50)


dev.off()    