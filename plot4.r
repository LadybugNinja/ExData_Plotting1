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


# set the plot region to hold 4 plots (2X2)
par(mfrow = c(2, 2))
      # The plot in the first row, first column
      plot(as.POSIXct(paste(data_dates$Date, data_dates$Time), format="%Y-%m-%d %H:%M:%S"), 
           data_dates$Global_active_power , ylab = "Global Active Power", 
           xlab=" ", type = "l", cex.lab = .75, cex.axis = .75)
      
      # The plot in the first row, second column
      plot(as.POSIXct(paste(data_dates$Date, data_dates$Time), format="%Y-%m-%d %H:%M:%S"), 
           data_dates$Voltage , ylab = "Voltage", 
           xlab="datetime", type = "l", cex.lab = .75, cex.axis = .75)

      # The plot in the second row, first column
      with(data_dates, plot(as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), 
                            Sub_metering_1, type = "l", xlab = " ", 
                            ylab = "Energy sub metering", cex.lab = .75, cex.axis = .75))
      with(data_dates, lines(as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), 
                             Sub_metering_2, type = "l", col = "Red"))
      with(data_dates, lines(as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), 
                             Sub_metering_3, type = "l", col = "Blue"))
      legend("topright", lty=c(1,1,1), col = c("black", "blue", "red"), 
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
             cex=.45, pt.cex = .5, x.intersp=0.5, y.intersp = 0.55, bty = "n",
             inset = -.05)
      
      # The plot in the second row, second column
      plot(as.POSIXct(paste(data_dates$Date, data_dates$Time), format="%Y-%m-%d %H:%M:%S"), 
           data_dates$Global_reactive_power , ylab = "Global_reactive_power", 
           xlab="datetime", type = "l", cex.lab = .75, cex.axis = .75)

# Export the plot to a png
dev.copy(png, file = "plot4.png")
dev.off()
