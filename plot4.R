library(dplyr)

# I pre-filtered the rows to those between Feb-01-2007 and Feb-02-2007
dfileFiltered <- "./household-filtered-feb-01-02-2007.txt"

hhData <- read.table(dfileFiltered, header = TRUE, sep = ";", quote = "\"",
                       dec = ".", na.strings = "?")
hhData <- mutate(hhData, obsDate=as.POSIXct(paste(hhData$Date, hhData$Time), format="%d/%m/%Y %H:%M:%S"))
# hhData$Date <- NULL


#
png(filename = "./plot4.png", width = 480, height = 480, units = "px")

facScale <- 0.8
par(mfrow = c(2,2))
with(hhData, {

  plot(obsDate, Global_active_power, type = "l", main="", xlab = "", ylab = "Global Active Power", cex.lab = facScale+0.1, cex.axis = facScale)
  
  plot(obsDate, Voltage, type = "l", main="", xlab = "datetime", ylab = "Voltage", cex.lab = facScale+0.1, cex.axis = facScale)
  
  plot(obsDate, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", cex.lab = facScale+0.1, yaxt = "n", cex.axis = facScale)
  axis(side = 2, at = seq(0,30, by = 10), cex.axis = facScale)
  lines(obsDate, Sub_metering_1, type = "l", col = "black")
  lines(obsDate, Sub_metering_2, type = "l", col = "red")
  lines(obsDate, Sub_metering_3, type = "l", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty = 1, cex = facScale+0.1, bty = "n")

  plot(obsDate, Global_reactive_power, type = "l", main="", xlab = "datetime", cex.lab = facScale+0.1, cex.axis = facScale)
})

#
dev.off()