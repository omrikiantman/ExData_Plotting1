#require Packages
require("data.table")
require("lubridate")
#load and filter data
data.file <- "./household_power_consumption.txt"
original.data3 <- fread(data.file, header = TRUE, sep = ";", na.strings = "?")
data.transformed3 <- original.data3[,DateTime:=dmy_hms(paste(Date,Time))]
data.to.analyze3 <- data.transformed3[dmy(Date) %in% as.Date(c("2007-02-01","2007-02-02"))]
#create png file
png(filename = "plot3.png", width = 480, height = 480)
#plot Energy Sub Metering versus Datetime
plot(data.to.analyze3$DateTime,data.to.analyze3$Sub_metering_1, type = "l",
     xlab="",ylab="Energy sub metering")
lines(data.to.analyze3$DateTime,data.to.analyze3$Sub_metering_2, col = "red")
lines(data.to.analyze3$DateTime,data.to.analyze3$Sub_metering_3, col = "blue")
legend("topright",lty = 1 ,col=c("black","red","blue"),
        legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
#save the png
dev.off()