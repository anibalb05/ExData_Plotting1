#reading data
x<-read.table("household_power_consumption.txt",header = T, sep = ";", na.strings = "?")
#changing factors to characters
x$Date<- as.character(x$Date)
x$Time<- as.character(x$Time)
#subsetting the information
x<-rbind(x[x$Date=="1/2/2007",],x[x$Date=="2/2/2007",])

x$Date<-as.Date(x$Date,"%d/%m/%Y")

#creating a vector with date and time merged
y<- paste(x$Date, x$Time, sep = " ")
y<-as.POSIXct(paste(x$Date,x$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

#plotting instructions

png("Plot 3.png")
plot(y,x$Sub_metering_1, type = "l", ylab = "Energy sub metering",xlab = "")
lines(y,x$Sub_metering_2, col="red")
lines(y,x$Sub_metering_3, col = "blue")
legend("topright",legend = colnames(x[,7:9]),lwd = 1,col = c("black","red","blue"))
dev.off()