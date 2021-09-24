household_power_consumption<-read.table("household_power_consumption.txt",
                                        sep=";",header=TRUE) 
##reads file as a table

household_power_consumption$Date<-
        as.Date(household_power_consumption$Date,format="%d/%m/%Y")
##converts Date to a date

data<-subset(household_power_consumption,subset=
                     (Date >= "2007-02-01" & Date <= "2007-02-02"))
#subsets to dates we want

rm(household_power_consumption) ##removes 
##larger table with data we don't want

datetime<-paste(as.Date(data$Date),data$Time)
strptime(data$datetime)
data$Datetime<-as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1))
plot(x=data$Datetime, y=data$Global_active_power,
     ylab = "Global Active Power", 
     xlab = "", type = "l")
plot(x=data$Datetime,y=data$Voltage,ylab="Voltage",
     xlab="datetime",type="l")
plot(x=data$Datetime, y=data$Sub_metering_1,
     ylab = "Energy sub metering", 
     xlab = "", type = "l")
lines(x=data$Datetime, y=data$Sub_metering_2,
      ylab = "Global Active Power (kilowatts)", 
      xlab = "", type = "l",col="red")
lines(x=data$Datetime, y=data$Sub_metering_3,
      ylab = "Global Active Power (kilowatts)", 
      xlab = "", type = "l",col="blue")
legend("topright",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=2,lty=1,bty="n")
plot(x=data$Datetime,y=data$Global_reactive_power,xlab="datetime",
     ylab="Global_reactive_power",type="l")