if (!file.exists("household_power_consumption.txt")) {
  unzip("exdata_data_household_power_consumption.zip")
}

# Getting data

complete_data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
complete_data$Date <- as.Date(complete_data$Date, format="%d/%m/%Y")

# Subsetting

data <- subset(complete_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(complete_data)

# Converting dates

datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot 2

plot(data$Global_active_power~data$Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Saving

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()