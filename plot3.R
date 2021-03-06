rm(list=ls())
setwd("D:\\CoureseraR\\ExploratoryDataAnalysis\\Fhousehold_power_consumption")
getwd()
data <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
data$datetime1 <- strptime(paste(as.Date(data$Date,"%d/%m/%Y"),data$Time),"%Y-%m-%d %H:%M:%S")
data2 <- subset(data,data$datetime1 >= "2007-02-01 00:00:00" & data$datetime1 <= "2007-02-02 23:59:59")
png(file="./plot3.png",    width = 480, height = 480, units = "px")
with(data2,
     {
       plot(y=Sub_metering_1,x=datetime1,type="S",col="black",xlab="",ylab="Energy sub metering")
       lines(y=Sub_metering_2,x=datetime1,type="S",col="red")
       lines(y=Sub_metering_3,x=datetime1,type="S",col="blue")
     })
legend("topright", lty=1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()