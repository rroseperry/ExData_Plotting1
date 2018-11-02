#   Exploratory Data Graphics Plot 1

#  read in data set
household_power_consumption <- read.csv("~/Data Science Course/Data Sets/GraphsWeek1/household_power_consumption.txt", sep=";")
str(household_power_consumption)


#   Convert dates
library(lubridate)
household_power_consumption$Date <- parse_date_time(x = household_power_consumption$Date,
                                                    orders = c("b d y", "B d Y", "d/m/Y", "A d B Y", "A d B", 
                                                               "b d Y", "b/d", "d B Y", "A B d"))

#   subset data to period 2007-02-01 to 2007-02-02
shortcons <-household_power_consumption[ household_power_consumption$Date >= as.Date("2007-02-01"), ]
shortcons <-shortcons[shortcons$Date < as.Date("2007-02-03"),]

#   look at data frame
str(shortcons)

#   convert Global Active Power to numeric
shortcons$Global_active_power <-as.numeric(as.character(shortcons$Global_active_power))

#   make histogram
with(shortcons, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.copy(png, "plot1.png")
dev.off()

