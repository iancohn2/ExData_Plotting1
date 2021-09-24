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

data$Global_active_power<-as.numeric(data$Global_active_power)

hist(data$Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
