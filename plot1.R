#Set Directory
setwd("C:\\Users\\olivem\\Desktop\\Data Science Course\\4.Exploratory Data Analysis\\Course Project 1")

#Connection
household_power_consumption<-read.delim("household_power_consumption.txt",header=T,sep=";",na.strings="?")

#Transform Data Types
household_power_consumption$Date=as.Date(household_power_consumption$Date,format="%d/%m/%Y")
household_power_consumption$Global_active_power=as.numeric(household_power_consumption$Global_active_power)

#Data Subset
data<-subset(household_power_consumption,Date>="2007-02-01" & Date<="2007-02-02")

#Time
a=paste(as.character(data$Date),as.character(data$Time),sep=" ")
b=strptime(a,format="%Y-%m-%d %H:%M")
data$Time=b

#Plot 1
png(filename="plot1.png",width=480,height=480)
hist(data$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.off()