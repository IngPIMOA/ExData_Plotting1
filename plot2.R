# plot2.R

library(data.table)

file_path <- "C:/Users/lenovo/Documents/COURSERA/datasciencecoursera/ExData_Plotting1/household_power_consumption.txt"

data <- fread(file_path, na.strings="?", sep=";")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset_data <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")]

subset_data$DateTime <- strptime(paste(subset_data$Date, subset_data$Time), format="%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height=480)

plot(subset_data$DateTime, subset_data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()

