powerConsumption = read.csv(file="household_power_consumption.txt", sep = ";", na.strings = "?", 
                            colClasses = c(rep("character", 2), rep("numeric", 7)))
powerConsumption = powerConsumption[powerConsumption$Date %in% c("1/2/2007", "2/2/2007"), ]
powerConsumption$Date_Time = strptime(paste(powerConsumption$Date, powerConsumption$Time), 
                                      format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480)
with(pc, plot(Date_Time, Sub_metering_1, type = "n", ylim = c(0, 40), xlab="", 
              ylab="Energy sub metering"))
with(pc, lines(Date_Time, Sub_metering_1, col="black"))
with(pc, lines(Date_Time, Sub_metering_2, col="red"))
with(pc, lines(Date_Time, Sub_metering_3, col="blue"))
legend("topright", col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))
dev.off()