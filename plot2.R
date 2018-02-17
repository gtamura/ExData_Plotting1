library(dplyr)

# I pre-filtered the rows to those between Feb-01-2007 and Feb-02-2007
dfileFiltered <- "./household-filtered-feb-01-02-2007.txt"

hhData <- read.table(dfileFiltered, header = TRUE, sep = ";", quote = "\"",
                       dec = ".", na.strings = "?")
hhData <- mutate(hhData, obsDate=as.POSIXct(paste(hhData$Date, hhData$Time), format="%d/%m/%Y %H:%M:%S"))
# hhData$Date <- NULL

#
png(filename = "./plot2.png", width = 480, height = 480, units = "px")

plot(hhData$obsDate, hhData$Global_active_power, type = "l", main="", xlab = "", ylab = "Global Active Power (kilowatts)", cex.lab=1, cex.axis = 1)

#
dev.off()