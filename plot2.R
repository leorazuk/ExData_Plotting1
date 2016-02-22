powerConsumption = read.csv(file="household_power_consumption.txt", sep = ";", na.strings = "?", 
                            colClasses = c(rep("character", 2), rep("numeric", 7)))
powerConsumption = powerConsumption[powerConsumption$Date %in% c("1/2/2007", "2/2/2007"), ]
powerConsumption$Date_Time = strptime(paste(powerConsumption$Date, powerConsumption$Time), 
                                      format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480)
par(pch = ".")
with(powerConsumption, plot(Date_Time, Global_active_power, xlab="", 
                            ylab="Global Active Power (kilowatts)"))
with(powerConsumption, lines(Date_Time, Global_active_power))
dev.off()