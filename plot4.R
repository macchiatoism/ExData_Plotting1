require(quantreg);
library(ggplot2);
filename='household_power_consumption.txt';
table1<-read.table(filename,header=T,sep=";",na.strings="?"); #read data
table2<-subset.data.frame(table1,Date=='1/2/2007'); # extract only 2 day's data
table3<-subset.data.frame(table1,Date=='2/2/2007'); # extract only 2 day's data
data<-rbind(table2,table3); #rebinding data
data2<-subset.data.frame(x=data,select=c(Global_active_power,Global_reactive_power,Voltage,Sub_metering_1,Sub_metering_2,Sub_metering_3,Date,Time));
data2$Date_and_Time<-strptime(dt,format="%d/%m/%Y %H:%M:%S",tz="GMT");
png("plot4.png",width = 480, height = 480, units = "px");
#divide plot into 2*2 frames
attach(mtcars);
par(mfrow=c(2,2));
#plot 1
plot(data2$Date_and_Time,data2$Global_active_power,type="s",ylab="Global Active Power",xlab="");
#plot 2
plot(data2$Date_and_Time,data2$Voltage,type="s",ylab="Voltage",xlab="datetime");
#plot 3 without legend's boarder
plot(data2$Date_and_Time,data2$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="");
lines(data2$Date_and_Time,data2$Sub_metering_2,col="red");
lines(data2$Date_and_Time,data2$Sub_metering_3,col="blue");
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, bty="n",col=c("black","red","blue"),box.lwd = 0,box.col = "white",bg = "white")
#plot 4
plot(data2$Date_and_Time,data2$Global_reactive_power/10,type="s",ylab="Global_reactive_power",xlab="datetime");
dev.off();#close device
