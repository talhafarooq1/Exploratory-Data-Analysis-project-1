################################ plot 1 ##############################################
par(mfrow=c(1,1))
data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

title(main="Global Active Power")
png("plot1.png", width=480, height=480)
################################################## plot 2 ###########################
data1 <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data1) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data1 <- subset(data1,data1$Date=="1/2/2007" | data1$Date =="2/2/2007")

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1$Time <- strptime(data1$Time, format="%H:%M:%S")
data1[1:1440,"Time"] <- format(data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data1[1441:2880,"Time"] <- format(data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(data1$Time,as.numeric(as.character(data1$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

title(main="Global Active Power Vs Time")
png("plot2.png", width=480, height=480)


################################ plot 3 #############################################
data2 <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data2) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data1 <- subset(data2,data2$Date=="1/2/2007" | data2$Date =="2/2/2007")

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1$Time <- strptime(data1$Time, format="%H:%M:%S")
data1[1:1440,"Time"] <- format(data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data1[1441:2880,"Time"] <- format(data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(data1$Time,data1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(data1,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(data1,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(data1,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

title(main="Energy sub-metering")
png("plot3.png", width=480, height=480)
################################# plot 4 ###########################################

data2 <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data2) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data1 <- subset(data2,data2$Date=="1/2/2007" | data2$Date =="2/2/2007")
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1$Time <- strptime(data1$Time, format="%H:%M:%S")
data1[1:1440,"Time"] <- format(data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data1[1441:2880,"Time"] <- format(data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
par(mfrow=c(2,2))

with(data1,{
  plot(data1$Time,as.numeric(as.character(data1$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(data1$Time,as.numeric(as.character(data1$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(data1$Time,data1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(data1,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(data1,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(data1,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(data1$Time,as.numeric(as.character(data1$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
png("plot4.png", width=480, height=480)
