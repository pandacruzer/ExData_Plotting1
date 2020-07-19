library(lubridate)

## Set up working environment and process input
setwd("~/R Coursera/Exploratory Data Analysis")
household_power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
household_power$Date <- dmy(household_power$Date)
household_power <- household_power[household_power$Date == "2007/02/01" | household_power$Date == "2007/02/02", ]

## Plot 1
household_power$Global_active_power <- as.numeric(household_power$Global_active_power)
summary(household_power$Global_active_power)
par(mfrow = c(1,1))
hist(household_power$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     col = 'red', breaks = c(0,250,500,750,1000,1250,1500,1750,2000,2250,2500,2750,3000,3250,3500,3750), freq = TRUE)

dev.copy(png, file = "plot1.png")
dev.off()