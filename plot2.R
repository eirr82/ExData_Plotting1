#Exploratory Data Analysis plot 2

#set wd and load data files

setwd("~/data")
data <- read.csv("C:/Users/Eirr/Downloads/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";" , as.is= TRUE, header= TRUE)

#subset for dates

subDates <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#create plot 

Sys.setlocale(locale = "C") #set locale language to english for have the names days in english instead of spanish

plot2 <- as.numeric(subDates$Global_active_power)
> days <- strptime(paste(subDates$Date, subDates$Time), format="%d/%m/%Y %H:%M:%S")
> plot(days, plot2, xlab="", ylab="Global Active Power (kilowatts)", type="l")  #type is for type of plot u want(l is for lines plot)





#save plot in png

dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()
