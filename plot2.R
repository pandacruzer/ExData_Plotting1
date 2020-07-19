library(lubridate)

## Set up working environment and process input
setwd("~/R Coursera/Exploratory Data Analysis")
household_power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
household_power$Date <- dmy(household_power$Date)
household_power <- household_power[household_power$Date == "2007/02/01" | household_power$Date == "2007/02/02", ]


## Plot 2
household_power$date_time <- with(household_power, Date + hms(Time))
par(mfrow = c(1,1))
plot(household_power$date_time, household_power$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "line")

dev.copy(png, file = "plot2.png")
dev.off()

