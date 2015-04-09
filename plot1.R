
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

#Draw histogram graph
hist(consum2$Global_active_power,main="Global Active Power", xlab="Global Active Power(kilowatts)", ylab="Frequency",col="red")

#Save current plot into local file named plot1.png
dev.copy(png,file="E:\\DataScience\\plot1.png")
dev.off()