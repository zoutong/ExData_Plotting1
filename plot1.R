dat<-read.table("household_power_consumption.txt",sep=";",head=TRUE,na.strings=c("?"," "))
dates=strptime(as.character(dat[,1]),"%d/%m/%Y")
dates=as.Date(dates)

subset = dat[dates>=as.Date("2007-02-01") & dates<=as.Date("2007-02-02"),]
global_active_power = as.numeric(as.character(subset[,3]))


#plot1
png("plot1.png")
hist(global_active_power,col=2,main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()


