###
###     Coursera Exploratory Data Analysis 
###     Course Project 1
###     Plot 3
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

# Set the correct values for variables
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data$Global_active_power)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

# Make png
png('./figures/plot_3.png', width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

