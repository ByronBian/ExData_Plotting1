
###This part is the same as Plot1.R
#Read data from text file into a Data Frame
consum<-read.table("E:\\DataScience\\household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
#Convert numerical columns from factors to numbers
consum[,c(3:8)]<-apply(consum[,c(3:8)],2,function(x) as.numeric(x))

#Filter out appropriate entries whose observation time starts from 2007/02/01 to 2007/02/02
starttime=strptime("01/02/2007 00:00:00","%d/%m/%Y %H:%M:%S")
endtime=strptime("02/02/2007 23:59:59","%d/%m/%Y %H:%M:%S")

attach(consum)
#Add a new column combing date and time
consum$DateTime<-strptime(paste(Date,Time,sep=" "),"%d/%m/%Y %H:%M:%S")
#Extract a new data frame by time scope
consum2<-consum[DateTime>=starttime & DateTime<=endtime,]
detach(consum)
###

#par(mfrow=c(2,2))
attach(consum2)
#Draw the first plot
plot(DateTime,Global_active_power,type="l",ann=FALSE)
#Add y-lab
title(ylab="Global Active Power(kilowatts")

#Draw the second plot
plot(DateTime,Voltage,type="l",ann=FALSE)
title(xlab="DateTime",ylab="Voltage")

#Draw the third plot
plot(DateTime,Sub_metering_1,type="l",col="black",ann=FALSE)
lines(DateTime,Sub_metering_2,type="l",col="red")
lines(DateTime,Sub_metering_3,type="l",col="blue")
title(ylab="Energy Sub Metering")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

#Draw the fourth plot
plot(DateTime,Global_reactive_power,type="l",ann=FALSE)
title(xlab="DateTime",ylab="Global_Reactive_Power")

detach(consum2)

#Save current plot into local file named plot4.png
dev.copy(png,file="E:\\DataScience\\plot4.png")
dev.off()