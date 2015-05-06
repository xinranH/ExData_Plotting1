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

##get the time
data_use$weekdaytime<-paste(data_use$Date,data_use$Time)
data_use$weekdaytime<-strptime(data_use$weekdaytime,"%Y-%m-%d %H:%M:%S")

##plot2
png(file="plot2.png",width=480,height=480)
plot(data_use$datetime,data_use[,3],type="l",xlab=" ",ylab="Global Active Power(kilowatts)")
dev.off()
