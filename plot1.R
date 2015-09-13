
##read the file
data0<-read.table("./data/household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors=FALSE)
head(data0,3)

##subest the data
data<-data0[data0$Date %in% c("1/2/2007","2/2/2007"),]
head(data,3)

##plot and copy to png file
data$Global_active_power<-as.numeric(data$Global_active_power)
hist(data$Global_active_power,col="red",main="Gloabl Active POwer", xlab="Global Active Power (kilowatts)",breaks=11)
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

