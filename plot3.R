wd<-"C:/Users/patzerl/Documents/Coursera/EDA/Project 1/"
setwd(wd)

data<-read.table("household_power_consumption.txt", sep=";", header=T)

######## CLEAN COLUMNS ############
data$Clean_Date<-as.Date(data$Date, "%d/%m/%Y")
data$Clean_Global_active_power<-as.numeric(paste(data$Global_active_power))
data$Clean_Sub_metering_1<-as.numeric(paste(data$Sub_metering_1))
data$Clean_Sub_metering_2<-as.numeric(paste(data$Sub_metering_2))
data$Clean_Sub_metering_3<-as.numeric(paste(data$Sub_metering_3))
data$TimeDate<-as.POSIXct(paste(data$Clean_Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data$Clean_Voltage<-as.numeric(paste(data$Voltage))
data$Clean_Global_reactive_power<-as.numeric(paste(data$Global_reactive_power))

######## SUBSET DATA ##############
two.day<-data[data$Clean_Date>="2007-02-01" & data$Clean_Date <"2007-02-03",]

######## GRAPH 3 ##################
plot(two.day$TimeDate, two.day$Clean_Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="")
lines(two.day$TimeDate, two.day$Clean_Sub_metering_2, type="l", col="red")
lines(two.day$TimeDate, two.day$Clean_Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()
