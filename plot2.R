# Plot 2

# OS: Windows 10 Pro
# Set the R working directory to the folder where the data file is located
# Example: setwd("C:/Users/<your name>/Desktop/Coursera/exdata")

plot2 <- function()
{
  png_file_name <- "plot2.png"
  png_file_width <- 480
  png_file_height <- 480

  vDataFile <- "./household_power_consumption.txt"
  vData <- read.table(vDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  
  # We need data only for 2007-02-01 and 2007-02-02
  vFilteredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  
  vDatetime <- strptime(paste(vFilteredData$Date, vFilteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  
  vglobalActivePower <- as.numeric(vFilteredData$Global_active_power)
  
  png(png_file_name, width=png_file_width, height=png_file_height)
  
  plot(vDatetime, vglobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  dev.off()

}
