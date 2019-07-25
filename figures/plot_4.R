###
###     Coursera Exploratory Data Analysis 
###     Course Project 1
###     Plot 4
###     Emiliano Elias Dena
###


###     Step 0.1 Download and unzip data  ----
zip_name <- "household_power_consumption.zip" 
file_name <- "household_power_consumption.txt"

#   Download
if (!file.exists(zip_name)){
    urlzip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(urlzip, zip_name)
}

# Unzip
if (!file.exists(file_name)) { 
    unzip(zip_name) 
}

###     Step 0.2 Read data ----
files <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(files), value=TRUE), sep = ';', col.names = c("Date",
                                                                                                        "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
                                                                                                        "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

###     Step 1 Plot
# Create figures (or not)
if(!file.exists('figures')){
    dir.create('figures')
}

# Make plot
png(filename = './figures/plot4.png', width = 480, height = 480, units='px')
# plot figure
Sys.setlocale(category = "LC_ALL", locale = "english")
par(mfrow = c(2, 2))
plot(data$DateTime, data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
plot(data$DateTime, data$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(data$DateTime, data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(data$DateTime, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
plot(data$DateTime, data$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
# close device
dev.off()
