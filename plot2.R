require(quantreg);
library(ggplot2);
filename='household_power_consumption.txt';
table1<-read.table(filename,header=T,sep=";",na.strings="?"); #read data
table2<-subset.data.frame(table1,Date=='1/2/2007'); # extract only 2 day's data
table3<-subset.data.frame(table1,Date=='2/2/2007'); # extract only 2 day's data
data<-rbind(table2,table3); #rebinding data
data2<-subset.data.frame(x=data,select=c(Global_active_power,Date,Time));
png("plot2.png",width = 480, height = 480, units = "px");#open png file
data2$Date_and_Time<-strptime(dt,format="%d/%m/%Y %H:%M:%S",tz="GMT"); #convert date and time into Posix type
plot(data2$Date_and_Time,data2$Global_active_power,type="s",ylab="Global Active Power (kilowatts)",xlab=""); #plot
dev.off();
