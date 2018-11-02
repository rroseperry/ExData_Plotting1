##  Exploratory Data Analysis Plot 3

#  read in data set
household_power_consumption <- read.csv("~/Data Science Course/Data Sets/GraphsWeek1/household_power_consumption.txt", sep=";")
str(household_power_consumption)
# make DateTime variable
household_power_consumption$datetime<- paste(household_power_consumption$Date,household_power_consumption$Time)
# should be char
str(household_power_consumption$datetime)

#   Convert years
library(lubridate)
household_power_consumption$Date <- parse_date_time(x = household_power_consumption$Date,
                                                    orders = c("d/m/Y"))
#   subset data to period 2007-02-01 to 2007-02-02
shortcons <-household_power_consumption[ household_power_consumption$Date >= as.Date("2007-02-01"), ]
shortcons <-shortcons[shortcons$Date < as.Date("2007-02-03"),]
str(shortcons)

#    convert times to days of the week
shortcons$datetime<-as.POSIXct(shortcons$datetime, tryFormats = c("%d/%m/%Y %H:%M%OS"))
str(shortcons$Time)
summary(wday(shortcons$datetime, label=TRUE))

#   convert factors to numbers
shortcons$Sub_metering_1 <-as.numeric(as.character(shortcons$Sub_metering_1))
shortcons$Sub_metering_2 <-as.numeric(as.character(shortcons$Sub_metering_2))
shortcons$Sub_metering_3 <-as.numeric(as.character(shortcons$Sub_metering_3))
plot(shortcons$datetime, shortcons$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(shortcons$datetime, shortcons$Sub_metering_2, col = "red")
lines(shortcons$datetime, shortcons$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty ="n")
dev.copy(png, "plot3.png")
dev.off()

