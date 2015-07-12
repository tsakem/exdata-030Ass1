##Generation of multiple plots concerning the household electric power consumption
##for the dates 2007-02-01 and 2007-02-02
##Data from the UC Irvine Machine Learning Repository
##Individual household electric power consumption Data Set

## Read the data from the file
## All the data is characterised as "Character" in order to avoid conversion errors of numbers.
allthedata<-read.table("household_power_consumption.txt",sep=";",header = TRUE,colClasses=c(rep("character",9)))

##Conversion of date data from character to Date class
allthedata$Date<-as.Date(allthedata$Date,format="%d/%m/%Y")

##Selection of data only for the corresponding dates.
selecteddata<-subset(allthedata,Date=="2007-02-01" | Date=="2007-02-02")

##Conversion of time data from character to Time class
##Concatenate Date and Time fields in order to use function strtime and get the correct results.
datentime<-paste(selecteddata$Date,selecteddata$Time,sep=" ")
selecteddata$Time<-strptime(datentime, "%Y-%m-%d %H:%M:%S")


##Create multiple graphs (4) in the same plot and Save the plot as a png file
png(file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))


##Plot in 1,1 position
plot(selecteddata$Time,as.numeric(selecteddata$Global_active_power), type="n", ylab="Global Active Power", xlab="")
lines(selecteddata$Time,as.numeric(selecteddata$Global_active_power))

##Plot in 1,2 position
plot(selecteddata$Time,as.numeric(selecteddata$Voltage), type="n", ylab="Voltage", xlab="datetime")
lines(selecteddata$Time,as.numeric(selecteddata$Voltage))

##Plot in 2,1 position
plot(selecteddata$Time,as.numeric(selecteddata$Sub_metering_1), type="n", ylab="Energy sub metering", xlab="")
lines(selecteddata$Time,as.numeric(selecteddata$Sub_metering_1))
lines(selecteddata$Time,as.numeric(selecteddata$Sub_metering_2),col="red")
lines(selecteddata$Time,as.numeric(selecteddata$Sub_metering_3),col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),bty = "n")

##Plot in 2,2 position
plot(selecteddata$Time,as.numeric(selecteddata$Global_reactive_power), type="n", ylab="Global_reactive_power", xlab="datetime")
lines(selecteddata$Time,as.numeric(selecteddata$Global_reactive_power))


dev.off() 
