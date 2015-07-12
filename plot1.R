##Generation of Histogram of household global minute-averaged active power (in kilowatt) 
##Data ONLY from dates 2007-02-01 and 2007-02-02
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

##Creation of the histogram in the plot window and save it as a png file
png(file = "plot1.png", width = 480, height = 480)
hist(as.numeric(selecteddata$Global_active_power),main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")


dev.off() 

