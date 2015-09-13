dat<-read.table("household_power_consumption.txt",sep=";",head=TRUE,na.strings=c("?"," "))
dates=strptime(as.character(dat[,1]),"%d/%m/%Y")
dates=as.Date(dates)

subset = dat[dates>=as.Date("2007-02-01") & dates<=as.Date("2007-02-02"),]
global_active_power = as.numeric(as.character(subset[,3]))


#plot2
times = paste(as.character(subset[,1]),as.character(subset[,2]))
times = strptime(times,"%d/%m/%Y %H:%M:%S")

png("plot2.png")
plot(times,global_active_power,type='l',xlab=" ",ylab="Global Active Power (kilowatts)")
dev.off()