#Exploratory Data Analysis plot 4

#set wd and load data files

setwd("~/data")
data <- read.csv("C:/Users/Eirr/Downloads/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";" , as.is= TRUE, header= TRUE)

#subset for dates

subDates <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")


Sys.setlocale(locale = "C") #set locale language to english for have the names days in english instead of spanish


#create the plot


# create 2x2 plot space

par(mfrow = c(2,2))

## top left plot
plot1 <- as.numeric(subDates$Global_active_power)
days <- strptime(paste(subDates$Date, subDates$Time), format="%d/%m/%Y %H:%M:%S")
plot(days, plot1, xlab="", ylab="Global Active Power", type="l")

## top right plot
plot2 <- as.numeric(subDates$Voltage)
days <- strptime(paste(subDates$Date, subDates$Time), format="%d/%m/%Y %H:%M:%S")
plot(days, plot2, xlab="datetime", ylab="Voltage", type="l")

## lower left plot
plot3a <- as.numeric(subDates$Sub_metering_1)
plot3b <- as.numeric(subDates$Sub_metering_2)
plot3c <- as.numeric(subDates$Sub_metering_3)
days <- strptime(paste(subDates$Date, subDates$Time), format="%d/%m/%Y %H:%M:%S")
plot(days, plot3a, type="n", xlab="", ylab="Energy sub metering")
points(days, plot3a, type="l", col="black")
points(days, plot3b, type="l", col="red")
points(days, plot3c, type="l", col="blue")
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## lower right plot
plot4 <- as.numeric(subDates$Global_reactive_power)
days <- strptime(paste(subDates$Date, subDates$Time), format="%d/%m/%Y %H:%M:%S")
plot(days, plot4, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")
dev.off()


dev.off()

