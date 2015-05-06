##Download the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "Dataset.zip")
unzip("Dataset.zip")
file.rename("household_power_consumption.txt","data.txt")

##Input data
data<-read.table("./data.txt",header=T, sep=';', na.strings="?", stringsAsFactors=F)
memory.size() ##a rough estimate of how much memory the dataset will require
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data_use<-data[which(data$Date>="2007-02-01"&data$Date<="2007-02-02"),]
rm(data)

##time
data_use$weekdaytime<-paste(data_use$Date,data_use$Time)
data_use$weekdaytime<-strptime(data_use$weekdaytime,"%Y-%m-%d %H:%M:%S")

##plot3
png(file="plot2.png",width=480,height=480)
plot(data_use$weekdaytime,data_use[,7],type="l",xlab=" ",ylab="Energy sub metering")
lines(data_use$weekdaytime,data_use[,8],col="red")
lines(data_use$weekdaytime,data_use[,9],col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=1 )
dev.off()
