try_three <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
plot3 <- subset(try_three, Date %in% c("1/2/2007","2/2/2007")) #reading the csv file
plot3$Date <- as.Date(plot3$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(plot3$Date), plot3$Time) #setting the duration
plot3$Datetime <- as.POSIXct(datetime)
##creating the third plot and adding attributes
with(plot3, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
}) 
legend("topright",  lty=1, lwd=2, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) #defining the legend
dev.copy(png, file="plot3.png", height=480, width=480) #exporting it as png
 