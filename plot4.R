#require Packages
require("data.table")
require("lubridate")
#load and filter data
data.file <- "./household_power_consumption.txt"
original.data4 <- fread(data.file, header = TRUE, sep = ";", na.strings = "?")
data.transformed4 <- original.data4[,DateTime:=dmy_hms(paste(Date,Time))]
data.to.analyze4 <- data.transformed4[dmy(Date) %in% as.Date(c("2007-02-01","2007-02-02"))]
#create png file
png(filename = "plot4.png", width = 480, height = 480)
#set number of plots
par(mfcol = c(2,2))
#plot Global Active Power versus Datetime
plot(data.to.analyze4$DateTime,data.to.analyze4$Global_active_power, type = "l",
     xlab="", ylab = "Global Active Power (kilowatts)")
#plot Energy Sub Metering versus Datetime
plot(data.to.analyze4$DateTime,data.to.analyze4$Sub_metering_1, type = "l",
     xlab="",ylab="Energy sub metering")
lines(data.to.analyze4$DateTime,data.to.analyze4$Sub_metering_2, col = "red")
lines(data.to.analyze4$DateTime,data.to.analyze4$Sub_metering_3, col = "blue")
legend("topright",lty = 1 ,col=c("black","red","blue"), bty = "n",
       legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
#plot Voltage versus Datetime
with(data.to.analyze4,plot(DateTime,Voltage,xlab ="datetime", ylab="Voltage", type = "l"))
#plot Global reactive power versus Datetime
with(data.to.analyze4,plot(DateTime,Global_reactive_power
                           ,xlab ="datetime", ylab="Global_reactive_power", type = "l"))
#save the png
dev.off()