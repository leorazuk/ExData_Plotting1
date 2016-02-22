powerConsumption = read.csv(file="household_power_consumption.txt", sep = ";", na.strings = "?", 
                            colClasses = c(rep("character", 2), rep("numeric", 7)))
powerConsumption = powerConsumption[powerConsumption$Date %in% c("1/2/2007", "2/2/2007"), ]
png(filename = "plot1.png", width = 480, height = 480)
with(powerConsumption, hist(Global_active_power, col = "red", ylim = c(0, 1200), 
            xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()