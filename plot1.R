library(lubridate)
library(dplyr)

# Read household power consumption data
pc <- read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?")

# Select the data for time period between 2007-02-01 and 2007-02-02
pc <- 
  pc %>% 
  mutate(Date = dmy(Date), Time = hms(Time)) %>%
  filter(between(Date, ymd("2007-02-01"), ymd("2007-02-02")))

# Create a PNG device to store the plot
png("plot1.png")

#Create a plot for Plot 1
with(pc, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

# Close the device
dev.off()
