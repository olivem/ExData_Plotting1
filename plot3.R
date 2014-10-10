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

#Plot 3
png("Plot3.png",bg="white",width=480,height=480)
plot(data$Time,data$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
plot.xy(xy.coords(data$Time,data$Sub_metering_2),type="l",col="red")
plot.xy(xy.coords(data$Time,data$Sub_metering_3),type="l",col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()