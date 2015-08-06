plot3 <- function()
{
  header <- read.table("household_power_consumption.txt", nrows = 1, sep = ";", header = T)
  twodays <- read.table("household_power_consumption.txt", header = F, skip = 66637, nrows = 2879, sep = ";", na.strings = "?")
  names(twodays) <- names(header)
  
  twodays$Date <- as.POSIXct(paste(twodays$Date, twodays$Time), format="%e/%m/%Y %H:%M:%S")

  #plot 3
  plot(twodays$Date, twodays$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  #add two more lines
  lines(twodays$Date, twodays$Sub_metering_2, col = "red")
  lines(twodays$Date, twodays$Sub_metering_3, col = "blue")
  #add the legend 
  legend("topright", lty = c(1, 1, 1), pch = c(NA, NA, NA), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  #save plot to a PNG file
  dev.copy(png, file = "plot3.png")
  dev.off()
}