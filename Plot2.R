#load the file
file <- read.csv(file.path(getwd(), "household_power_consumption.txt"), sep = ";", na.strings = "?", header = T, stringsAsFactors = F)
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
file1 <- subset(file, subset = (file$Date >= "2007-02-01"& file$Date <="2007-02-02"))
time <- strptime(paste(file1$Date, file1$Time, sep = " "), "%y-%m%d %H:%M:%S")
datetime <- paste(as.Date(file1$Date), file1$Time)
file1$Datetime <- as.POSIXct(datetime)
rm(file)

#generate plot

png(filename='plot2.png',width=480,height=480,units='px')
plot(file1$Global_active_power ~ file1$Datetime, ylab = "Global Active Power(kilowatts)", xlab = "", type = "l") 


dev.off()