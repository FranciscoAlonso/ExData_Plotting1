plot2 <- function()
{
  header <- read.table("household_power_consumption.txt", nrows = 1, sep = ";", header = T)
  twodays <- read.table("household_power_consumption.txt", header = F, skip = 66637, nrows = 2879, sep = ";", na.strings = "?")
  names(twodays) <- names(header)
  
  #get the date and time together
  twodays$Date <- as.POSIXct(paste(twodays$Date, twodays$Time), format="%e/%m/%Y %H:%M:%S")
  #create the png graph device
  png("plot2.png")
  #plot 2
  plot(twodays$Date, twodays$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

  dev.off()
}