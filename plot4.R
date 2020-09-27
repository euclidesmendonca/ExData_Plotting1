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

# Plot 4 ---------------

par(mfrow=c(2,2))
# topleft
with(data.trim, plot(Time, Global_active_power, 
                         type="l",
                         xlab="", ylab="Global Active Power", 
                         cex.lab=0.7, cex.axis=0.8))

# topright
with(data.trim, plot(Time, Voltage, 
                         type="l",
                         xlab="", ylab="Voltage", 
                         cex.lab=0.7, cex.axis=0.8))

# bottomleft
plot(data.trim$Time, data.trim$Sub_metering_1, 
     type="l", ylab="Energy sub metering", xlab="", cex.lab=0.7, cex.axis=0.8)
lines(data.trim$Time, data.trim$Sub_metering_2, col="red")
lines(data.trim$Time, data.trim$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red", "blue"), cex=0.7, bty="n")

# bottomright
with(data.trim, plot(Time, Global_reactive_power, 
                         type="l",lwd=0.5,
                         xlab="datetime", ylab="Global_reactive_power", 
                         cex.lab=0.7, cex.axis=0.8))

# PNG
dev.copy(png,'plot4.png',  width = 480, height = 480)
dev.off()
