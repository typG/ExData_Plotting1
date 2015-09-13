
##read the file
data0<-read.table("./data/household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors=FALSE)
head(data0,3)

##subest the data
data<-data0[data0$Date %in% c("1/2/2007","2/2/2007"),]
head(data,3)

##convert date/time
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
datetime <- paste(data$Date, data$Time)
data$datetime <- as.POSIXct(datetime)


##Plot
png("plot4.png")
par(mfrow=c(2,2),mar=c(4,4,1,1),oma=c(0,0,0,0))
with(data, {plot(data$Global_active_power~data$datetime, type="l",xlab="",ylab="Global Active Power (kilowatts)")
            plot(data$Voltage~data$datetime,type="l",xlab="datatime",ylab="Voltage")
            plot(Sub_metering_1~datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
                lines(Sub_metering_2~datetime,col='red')
                lines(Sub_metering_3~datetime,col='blue')
                legend("topright",col=c("black","red","blue"),lty=1,lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.8)
            plot(data$Global_reactive_power~data$datetime,xlab="datetime",ylab="Global_reactive_power",type="l")
})

dev.off()