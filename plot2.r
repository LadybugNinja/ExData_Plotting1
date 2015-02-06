#
# The file folder from 
# "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# should be downloaded, unzipped and in your working directory.
#

#Create a date format to read in the file
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

# Read in the table
# Be careful! This table is quite large.
data <- read.table(".//exdata-data-household_power_consumption//household_power_consumption.txt",
                   header = TRUE, sep=";", colClasses = c("myDate", "character", rep("numeric", 7)),
                   na.strings = c("?"))

data_dates <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# Create the plot in the window
plot(as.POSIXct(paste(data_dates$Date, data_dates$Time), format="%Y-%m-%d %H:%M:%S"), 
     data_dates$Global_active_power , ylab = "Global Active Power (kilowatts)", 
     xlab=" ", type = "l", cex.lab = .75, cex.axis = .75)

# The date/time merge is handled by a call to 
# "as.POSIXct(paste(data_dates$Date, data_dates$Time), format="%Y-%m-%d %H:%M:%S")"
# which merges the date and time into a POSIXct format with year, month, day, hour,
# minute, second pattern.

# Save the plot as a png
dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off()