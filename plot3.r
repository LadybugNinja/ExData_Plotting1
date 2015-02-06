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


# Plot the Sub-metering-1 data
with(data_dates, plot(as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), 
                      Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering", 
                      cex.lab = .75, cex.axis = .75))

# Add the sub-metering-2 data to the same graph, in red
with(data_dates, lines(as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), 
                       Sub_metering_2, type = "l", col = "Red"))

# Add the sub-metering-3 data to the same graph, in blue
with(data_dates, lines(as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), 
                       Sub_metering_3, type = "l", col = "Blue"))

# Create/format the legend to match the example files
legend("topright", lty=c(1,1,1), col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=.75,
       pt.cex = .75, x.intersp=0.5, y.intersp = 0.55)

# Export the plot as a png
dev.copy(png, file = "plot3.png")
dev.off()