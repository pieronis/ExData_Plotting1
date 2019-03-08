
if (!file.exists("household_power_consumption.txt")) {
  unzip("exdata_data_household_power_consumption.zip")
}

complete_data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
complete_data$Date <- as.Date(complete_data$Date, format="%d/%m/%Y")


## Subsetting the data

data <- subset(complete_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(complete_data)

## Plot 1

hist(data$Global_active_power, main="Global Active Power", 
     
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()