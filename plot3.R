library(lubridate)

## Set up working environment and process input
setwd("~/R Coursera/Exploratory Data Analysis")
household_power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
household_power$Date <- dmy(household_power$Date)
household_power <- household_power[household_power$Date == "2007/02/01" | household_power$Date == "2007/02/02", ]


## Plot 3
household_power$date_time <- with(household_power, Date + hms(Time))
household_power$Sub_metering_1 <- as.numeric(household_power$Sub_metering_1)
household_power$Sub_metering_2 <- as.numeric(household_power$Sub_metering_2)
household_power$Sub_metering_3 <- as.numeric(household_power$Sub_metering_3)

par(mfrow = c(1,1))
plot(household_power$date_time, household_power$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(household_power$date_time, household_power$Sub_metering_2, ylab = "Energy sub metering", xlab = "", type = "l", col = "red")
lines(household_power$date_time, household_power$Sub_metering_3, ylab = "Energy sub metering", xlab = "", type = "l", col = "blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),lty = 1)

dev.copy(png, file = "plot3.png")
dev.off()

