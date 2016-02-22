powerConsumption = read.csv(file="household_power_consumption.txt", sep = ";", na.strings = "?", 
                            colClasses = c(rep("character", 2), rep("numeric", 7)))
powerConsumption = powerConsumption[powerConsumption$Date %in% c("1/2/2007", "2/2/2007"), ]
powerConsumption$Date_Time = strptime(paste(powerConsumption$Date, powerConsumption$Time), 
                                      format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480)
par(pch = ".")
par(mfcol = c(2, 2))
#Plot [1,1]
with(powerConsumption, plot(Date_Time, Global_active_power, xlab="", 
                            ylab="Global Active Power"))
with(powerConsumption, lines(Date_Time, Global_active_power))
#Plot [1,2]
with(pc, plot(Date_Time, Sub_metering_1, type = "n", ylim = c(0, 40), xlab="", 
              ylab="Energy sub metering"))
with(pc, lines(Date_Time, Sub_metering_1, col="black"))
with(pc, lines(Date_Time, Sub_metering_2, col="red"))
with(pc, lines(Date_Time, Sub_metering_3, col="blue"))
legend("topright", col=c("black", "red", "blue"), bty="n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))
#Plot [2,1]
with(powerConsumption, plot(Date_Time, Voltage, xlab="datetime", ylab="Voltage"))
with(powerConsumption, lines(Date_Time, Voltage))
#Plot [2,2]
with(powerConsumption, plot(Date_Time, Global_reactive_power, xlab="datetime"))
with(powerConsumption, lines(Date_Time, Global_reactive_power))
dev.off()