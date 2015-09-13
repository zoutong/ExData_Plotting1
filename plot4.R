dat<-read.table("household_power_consumption.txt",sep=";",head=TRUE,na.strings=c("?"," "))
dates=strptime(as.character(dat[,1]),"%d/%m/%Y")
dates=as.Date(dates)

subset = dat[dates>=as.Date("2007-02-01") & dates<=as.Date("2007-02-02"),]

#plot2
global_active_power = as.numeric(as.character(subset[,3]))


#plot3
times = paste(as.character(subset[,1]),as.character(subset[,2]))
times = strptime(times,"%d/%m/%Y %H:%M:%S")

Sub_metering_1 = as.numeric(as.character(subset[,7]))
Sub_metering_2 = as.numeric(as.character(subset[,8]))
Sub_metering_3 = as.numeric(as.character(subset[,9]))

#Voltage plot
Voltage = as.numeric(as.character(subset[,5]))

#Global reactive power
GRP = as.numeric(as.character(subset[,4]))

#multiple plots
png("plot4.png")
par(mfcol=c(2,2))
plot(times,global_active_power,type='l',xlab=" ",ylab="Global Active Power")
plot(times,Sub_metering_1,type='l',xlab=" ",ylab="Energy sub metering",col="black")
lines(times,Sub_metering_2,col="red")
lines(times,Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lty=c(1,1,1),lwd=c(2,2,2), col=c("black","red","blue"))
plot(times,Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(times,GRP,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()