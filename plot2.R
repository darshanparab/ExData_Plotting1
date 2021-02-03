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
png("plot2.png")

#Create a plot for Plot 2
with(pc, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))


# Close the device
dev.off()
