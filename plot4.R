# Plot 4

# OS: Windows 10 Pro
# Set the R working directory to the folder where the data file is located
# Example: setwd("C:/Users/<your name>/Desktop/Coursera/exdata")

plot4 <- function()
{
  png_file_name <- "plot4.png"
  png_file_width <- 480
  png_file_height <- 480

  vDataFile <- "./household_power_consumption.txt"
  vData <- read.table(vDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  
  # We need data only for 2007-02-01 and 2007-02-02
  vFilteredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  
  vDatetime <- strptime(paste(vFilteredData$Date, vFilteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  
  vglobalActivePower <- as.numeric(vFilteredData$Global_active_power)
  vGlobalReactivePower  <- as.numeric(vFilteredData$Global_reactive_power)
  vVoltage <- as.numeric(vFilteredData$Voltage)
  
  vSubMetering1 <- as.numeric(vFilteredData$Sub_metering_1)
  vSubMetering2 <- as.numeric(vFilteredData$Sub_metering_2)
  vSubMetering3 <- as.numeric(vFilteredData$Sub_metering_3)
  
  png(png_file_name, width=png_file_width, height=png_file_height)
  
  # create 2 rows 2 columns for 4 plots
  par(mfrow = c(2,2))
 
  # plot for Global Active Power
  plot(vDatetime, vglobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
  
  # plot for Voltage
  plot(vDatetime, vVoltage, type="l", xlab="datetime", ylab="Voltage")
  
  # plot for Sub Meterings with corresponding lines and legend 
  plot(vDatetime, vSubMetering1, type="l", ylab="Energy Submetering", xlab="")
  lines(vDatetime, vSubMetering2, type="l", col="red")
  lines(vDatetime, vSubMetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
  
  # plot for Global Reactive Power
  plot(vDatetime, vGlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power") 
  
  dev.off()

}
