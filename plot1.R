
# I pre-filtered the rows to those between Feb-01-2007 and Feb-02-2007
dfileFiltered <- "./household-filtered-feb-01-02-2007.txt"

hhData <- read.table(dfileFiltered, header = TRUE, sep = ";", quote = "\"",
                       dec = ".", na.strings = "?")

png(filename = "./plot1.png", width = 480, height = 480, units = "px")

hist(hhData$Global_active_power, col = "red", ylim = c(0, 1200), main="", xlab = "", ylab = "", cex.axis = 0.9)
title(main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     cex.main = 1.2, cex.lab=1)

dev.off()