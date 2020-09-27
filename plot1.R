# Plotting Assignment 1 for Exploratory Data Analysis
# Johns Hopkins University, Coursera

data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

# Data from the dates 2007-02-01 and 2007-02-02
data.trim <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
rm(data)

# convert the Date to Date class
data.trim$Date <- as.Date(data.trim$Date, format="%d/%m/%Y")

# convert the Time variable to Time class
data.trim$Time <- strptime(paste(data.trim$Date, data.trim$Time), format="%Y-%m-%d %H:%M:%S")
str(data.trim)

# Plot 1 ---------------

with(data.trim, hist(Global_active_power, col="red", 
                         breaks=15,
                         xlab="Global Active Power (kilowatts)",
                         main="Global Active Power",
                         ylim=c(0,1200)))

dev.copy(png,'plot1.png',  width = 480, height = 480)
dev.off()
