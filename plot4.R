# plot4.R

library(data.table)

file_path <- "C:/Users/lenovo/Documents/COURSERA/datasciencecoursera/ExData_Plotting1/household_power_consumption.txt"

data <- fread(file_path, na.strings="?", sep=";")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset_data <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")]

subset_data$DateTime <- strptime(paste(subset_data$Date, subset_data$Time), format="%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(subset_data$DateTime, subset_data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

plot(subset_data$DateTime, subset_data$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

plot(subset_data$DateTime, subset_data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")

lines(subset_data$DateTime, subset_data$Sub_metering_2, col="red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col="blue")

legend("topright", bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1)

plot(subset_data$DateTime, subset_data$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()

