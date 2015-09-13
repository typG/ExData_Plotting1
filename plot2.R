
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
plot(data$Global_active_power~data$datetime, type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
