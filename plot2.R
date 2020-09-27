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

# Plot 2 ---------------

with(data.trim, plot(Time, Global_active_power, 
                         type="l",
                         xlab="",
                         ylab="Global Active Power (in kilowatts)",
                         cex.lab=0.7, cex.axis=0.8))

# save the output to plot2.png
dev.copy(png,'plot2.png',  width = 480, height = 480)
dev.off()