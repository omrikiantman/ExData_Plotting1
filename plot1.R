require("data.table")
require("lubridate")
data.file <- "./household_power_consumption.txt"
original.data <- fread(data.file, header = TRUE, sep = ";", na.strings = "?")
data.transformed <- original.data[,c("Date","Time"):=list(dmy(Date),hms(Time))]
data.to.analyze <- data.transformed[Date %in% as.Date(c("2007-02-01","2007-02-02"))]
png(filename = "plot1.png", width = 480, height = 480)
hist(data.to.analyze$Global_active_power, col = "red", 
     ylab = "Frequency", xlab = "Global Active Power (kilowatts)",
     main ="Global Active Power")
dev.off()