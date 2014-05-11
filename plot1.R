#Exploratory Data Analysis plot 1

#set wd and load data files

setwd("~/data")
data <- read.csv("C:/Users/Eirr/Downloads/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";" , as.is= TRUE, header= TRUE)

#subset for dates

subDates <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#create plot 

plot1 <- as.numeric(subDates$Global_active_power)
 hist(plot1, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylab = "Frequency")

#save plot in png

dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()

