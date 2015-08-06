plot4 <- function()
{
  header <- read.table("household_power_consumption.txt", nrows = 1, sep = ";", header = T)
  twodays <- read.table("household_power_consumption.txt", header = F, skip = 66637, nrows = 2879, sep = ";", na.strings = "?")
  names(twodays) <- names(header)
  
  twodays$Date <- as.POSIXct(paste(twodays$Date, twodays$Time), format="%e/%m/%Y %H:%M:%S")
  par(mfrow = c(2,2)) #set rows and columns for the graphs
  
  #plot 4.1
  plot(twodays$Date, twodays$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  
  #plot 4.2
  plot(twodays$Date, twodays$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  
  #plot 4.3
  plot(twodays$Date, twodays$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(twodays$Date, twodays$Sub_metering_2, col = "red")
  lines(twodays$Date, twodays$Sub_metering_3, col = "blue")
  legend("topright", lty = c(1, 1, 1), pch = c(NA, NA, NA), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  #plot 4.4
  plot(twodays$Date, twodays$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  #save plot to a PNG file
  dev.copy(png, file = "plot4.png")
  dev.off()
}