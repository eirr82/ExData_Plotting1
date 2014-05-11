#Exploratory Data Analysis plot 3

#set wd and load data files

setwd("~/data")
data <- read.csv("C:/Users/Eirr/Downloads/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";" , as.is= TRUE, header= TRUE)

#subset for dates

subDates <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

Sys.setlocale(locale = "C") #set locale language to english for have the names days in english instead of spanish


#create the plot

 
plot3a <- as.numeric(subDates$Sub_metering_1)
plot3b <- as.numeric(subDates$Sub_metering_2)
plot3c <- as.numeric(subDates$Sub_metering_3)
days <- strptime(paste(subDates$Date, subDates$Time), format="%d/%m/%Y %H:%M:%S")


plot(days, plot3a, type="n", xlab="", ylab="Energy sub metering")
points(days, plot3a, type="l", col="black")
points(days, plot3b, type="l", col="red")
points(days, plot3c, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## create a .png file of the plot
dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")
dev.off()

