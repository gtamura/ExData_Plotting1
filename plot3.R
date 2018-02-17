library(dplyr)

# I pre-filtered the rows to those between Feb-01-2007 and Feb-02-2007
dfileFiltered <- "./household-filtered-feb-01-02-2007.txt"

hhData <- read.table(dfileFiltered, header = TRUE, sep = ";", quote = "\"",
                       dec = ".", na.strings = "?")
hhData <- mutate(hhData, obsDate=as.POSIXct(paste(hhData$Date, hhData$Time), format="%d/%m/%Y %H:%M:%S"))
# hhData$Date <- NULL


#
png(filename = "./plot3.png", width = 480, height = 480, units = "px")

plot(hhData$obsDate, hhData$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", cex.lab=1, yaxt = "n", cex.axis = 1)
axis(side = 2, at = seq(0,30, by = 10), cex.axis = 1)
lines(hhData$obsDate, hhData$Sub_metering_1, type = "l", col = "black")
lines(hhData$obsDate, hhData$Sub_metering_2, type = "l", col = "red")
lines(hhData$obsDate, hhData$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty = 1, cex = 0.9)

#
dev.off()