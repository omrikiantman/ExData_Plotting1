#require Packages
require("data.table")
require("lubridate")
#load and filter data
data.file <- "./household_power_consumption.txt"
original.data2 <- fread(data.file, header = TRUE, sep = ";", na.strings = "?")
data.transformed2 <- original.data2[,DateTime:=dmy_hms(paste(Date,Time))]
data.to.analyze2 <- data.transformed2[dmy(Date) %in% as.Date(c("2007-02-01","2007-02-02"))]
#create png file
png(filename = "plot2.png", width = 480, height = 480)
#plot Global Active Power versus Datetime
plot(data.to.analyze2$DateTime,data.to.analyze2$Global_active_power, type = "l",
     xlab="", ylab = "Global Active Power (kilowatts)")
#save the png
dev.off()