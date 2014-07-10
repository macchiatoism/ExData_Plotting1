require(quantreg);
library(ggplot2);
filename='household_power_consumption.txt';
table1<-read.table(filename,header=T,sep=";",na.strings="?"); #read data
table2<-subset.data.frame(table1,Date=='1/2/2007'); # extract only 2 day's data
table3<-subset.data.frame(table1,Date=='2/2/2007'); # extract only 2 day's data
data<-rbind(table2,table3); #rebinding data;
data2<-subset.data.frame(x=data,select=c(Sub_metering_1,Sub_metering_2,Sub_metering_3,Date,Time));
data2$Date_and_Time<-strptime(dt,format="%d/%m/%Y %H:%M:%S",tz="GMT");
png("plot3.png",width = 480, height = 480, units = "px");#open png file
plot(data2$Date_and_Time,data2$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="");
lines(data2$Date_and_Time,data2$Sub_metering_2,col="red");#add more graph
lines(data2$Date_and_Time,data2$Sub_metering_3,col="blue");#add more graph
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("black","red","blue"))#add legend
dev.off();#close device
