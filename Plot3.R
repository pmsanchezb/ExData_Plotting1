# Plot 3
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
png("Plot3.png",width = 480,height = 480)
plot(as.numeric(graph_data$Sub_metering_1), type = "l",
     ylab = "Energy sub metering",xlab="",xaxt = "n")
lines(as.numeric(graph_data$Sub_metering_2), type = "l",col="red")
lines(as.numeric(graph_data$Sub_metering_3), type = "l",col="blue")
axis(1, at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , 
       lty=1, col=c('black', 'red', 'blue'))
dev.off()