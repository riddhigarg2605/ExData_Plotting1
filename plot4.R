setwd("/Users/riddhi/Desktop/Coursera") #setting the working directory
plot_four <- read.csv("household_power_consumption.txt", stringsAsFactors=F, sep=';', 
                      nrows=2075259, check.names=F, header=T, comment.char="", na.strings="?", quote='\"') #reading the csv file and setting parameters
plot4 <- subset(plot_four, Date %in% c("1/2/2007","2/2/2007")) #substting the dataframe
plot4$Date <- as.Date(plot4$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(plot4$Date), plot4$Time)
plot4$Datetime <- as.POSIXct(datetime) #date time conversions

par(mfrow=c(2,2),  oma=c(0,0,2,0), mar=c(4,4,2,1)) #setting the parameters
with(plot4, {
  plot(Global_active_power~Datetime, 
       ylab="Global Active Power (kilowatts)", xlab="",type="l")
  plot(Voltage~Datetime, 
       ylab="Voltage", xlab="", type="l")
  plot(Sub_metering_1~Datetime, 
       ylab="Energy sub metering", xlab="", type="l")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"),  lwd=2,lty=1, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_reactive_power",xlab="")
}) #creating four plots with given specifications
dev.copy(png, file="plot4.png", height=480, width=480) #saving the plots as a png