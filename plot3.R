
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

##plot
with(data, {
    plot(Sub_metering_1~datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~datetime,col='red')
    lines(Sub_metering_3~datetime,col='blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1,lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save to png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
