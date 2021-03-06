plot1 <- function()
{
  header <- read.table("household_power_consumption.txt", nrows = 1, sep = ";", header = T)
  twodays <- read.table("household_power_consumption.txt", header = F, skip = 66637, nrows = 2879, sep = ";", na.strings = "?")
  names(twodays) <- names(header)
  
  twodays$Date <- strptime(as.character(twodays$Date), format = "%e/%m/%Y")
  
  #plot 1
  png("plot1.png") #create the png graph device
  hist(twodays$Global_active_power
       , col = "red"
       , xlab = "Global Active Power (Kilowatts)"
       , main = "Global Active Power"
       )

  dev.off()
}
