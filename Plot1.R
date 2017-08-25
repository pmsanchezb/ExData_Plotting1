# Plot 1
#
library(data.table)
library(lubridate)

# Working directory
setwd("C:/Users/Paulo_sanchez/Downloads")
data <- fread("C:/Users/Paulo_sanchez/Downloads/household_power_consumption.txt")

# Filter ans organize data
data$Date <- dmy(data$Date)
graph_data <- data[which(year(data$Date) == 2007 & month(data$Date) == 2 & (day(data$Date) == 1 | day(data$Date) == 2)),] 
rm(data)

# Create Plot
png("Plot1.png",width = 480,height = 480)
with(graph_data,hist(as.numeric(Global_active_power),col = "red",
                     main = "Global Active Power",xlab = "Global Active Power (Kilowatts)"))
#dev.copy(png,'Plot1.png')
dev.off()