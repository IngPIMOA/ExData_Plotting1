# plot3.R

library(data.table)

file_path <- "C:/Users/lenovo/Documents/COURSERA/datasciencecoursera/ExData_Plotting1/household_power_consumption.txt"

data <- fread(file_path, na.strings="?", sep=";")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset_data <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")]

subset_data$DateTime <- strptime(paste(subset_data$Date, subset_data$Time), format="%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480, height=480)

plot(subset_data$DateTime, subset_data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")

lines(subset_data$DateTime, subset_data$Sub_metering_2, col="red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1)

dev.off()
