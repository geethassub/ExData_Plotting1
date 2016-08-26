
#load the file
file <- read.csv(file.path(getwd(), "household_power_consumption.txt"), sep = ";", na.strings = "?", header = T, stringsAsFactors = F)
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
file1 <- subset(file, subset = (file$Date >= "2007-02-01"& file$Date <="2007-02-02"))
rm(file)


#generating the plot

png(filename='plot1.png',width=480,height=480,units='px')

plot <- hist(file1$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main= "Global Active Power")
png(filename = "Plot1.png", width = 480, height = 480)

dev.off()



