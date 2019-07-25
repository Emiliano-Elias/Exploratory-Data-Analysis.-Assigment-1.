###
###     Coursera Exploratory Data Analysis 
###     Course Project 1
###     Plot 1
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
png(filename = './figures/plot_1.png', width = 480, height = 480, units='px')
with(data, hist(Global_active_power, xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col = 'red'))
dev.off()
