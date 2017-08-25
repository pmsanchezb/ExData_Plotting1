# Plot 2
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
graph_data$Day <- weekdays(graph_data$Date)
png("Plot2.png",width = 480,height = 480)
plot(as.numeric(graph_data$Global_active_power), type = "l",
                     ylab = "Global Active Power (Kilowatts)",xlab="",xaxt = "n")
axis(1, at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
#dev.copy(png,'Plot1.png')
dev.off()