require(quantreg);
library(ggplot2);
filename='household_power_consumption.txt';
table1<-read.table(filename,header=T,sep=";",na.strings="?"); #read data
table2<-subset.data.frame(table1,Date=='1/2/2007'); # extract only 2 day's data
table3<-subset.data.frame(table1,Date=='2/2/2007'); # extract only 2 day's data
data<-rbind(table2,table3); #rebinding data
png("plot1.png",width = 480, height = 480, units = "px"); #open png file
hist(data$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red');#plot
dev.off();#close device
