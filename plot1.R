##Download the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "Dataset.zip")
unzip("Dataset.zip")
file.rename("household_power_consumption.txt","data.txt")

##Input data
data<-read.table("./data.txt",header=T, sep=';', na.strings="?", stringsAsFactors=F)
memory.size() ##a rough estimate of how much memory the dataset will require
data$Date<-as.Date(data$Date,"%d/%m/%Y")
##??????????????????????????data$Time<-strptime(data$Time)
data_use<-data[which(data$Date>="2007-02-01"&data$Date<="2007-02-02"),]

png(file="plot1.png",width=480,height=480)
hist(data_use[,3],col="red",xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()
