# Getting data

if (!file.exists("household_power_consumption.txt")) {
  unzip("exdata_data_household_power_consumption.zip")
}


complete_data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
complete_data$Date <- as.Date(complete_data$Date, format="%d/%m/%Y")

# Subsetting 

data <- subset(complete_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(complete_data)

# Converting dates

datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot 3

with(data, {
  
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Saving 

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()