plot_two <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?") #reading the csv
data2 <- subset(plot_two, Date %in% c("1/2/2007","2/2/2007")) ##setting the duration
data2$Date <- as.Date(data2$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data2$Date), data2$Time)
data2$Datetime <- as.POSIXct(datetime)

## Making the second plot
with(data2, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="") 
})

dev.copy(png, file="plot2.png", height=480, width=480) #creating png
