setwd("/Users/riddhi/Desktop/Coursera") #setting the working directory
try_one <- read.csv("household_power_consumption.txt", sep=';',header=T, na.strings="?") #reading the file
try1 <- subset(try_one, Date %in% c("1/2/2007","2/2/2007")) #subsetting
try1$Date <- as.Date(try1$Date, format="%d/%m/%Y")
hist(try1$Global_active_power, main="Global Active Power", breaks = 12, ylim = c(0, 1200),
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") #making histogram
dev.copy(png, file="plot1.png", height=480, width=480) #creating the png

