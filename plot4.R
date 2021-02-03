library(lubridate)
library(dplyr)

# Read household power consumption data
pc <- read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?")

# Select the data for time period between 2007-02-01 and 2007-02-02
pc <- 
  pc %>% 
  mutate(DateTime = dmy_hms(paste(Date, Time)), Date = dmy(Date), Time = hms(Time)) %>%
  filter(between(Date, ymd("2007-02-01"), ymd("2007-02-02")))

# Create a PNG device to store the plot
png("plot4.png")

#Create a plot for Plot 4
## Divide plot area in 2x2
par(mfrow = c(2,2))

## Plot graph in top left
with(pc, plot(DateTime, Global_active_power, type="l", xlab = "", ylab="Global Active Power"))

## Plot graph in top right
with(pc, plot(DateTime, Voltage, type="l", xlab = "datetime", ylab="Voltage"))

## Plot graph in bottom left
with(pc, plot(DateTime, Sub_metering_1, type="n", ylab ="Energy sub metering", xlab = ""))
with(pc, lines(DateTime, Sub_metering_1, col="black"))
with(pc, lines(DateTime, Sub_metering_2, col="red"))
with(pc, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), pch = '__', bty = "n")

## Plot graph in bottom right
with(pc, plot(DateTime, Global_reactive_power, type="l", xlab = "datetime"))


# Close the device
dev.off()
