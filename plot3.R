## Reading & Storing the full Dataset
consumption_data <- read.csv("./data/household_power_consumption.txt", header = T, sep = ';', na.strings = "?",
                             nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char ="", quote = '\"')
consumption_data$Date <- as.Date(consumption_data$Date, format = "%d/%m/%Y")

## Subsetting the data from dates 2007-02-01 to 2007-02-02 and converting it 
consumption <- subset(consumption_data, subset =(Date >= "2007-02-01" & Date <= "2007-02-02"))
dateTime <- paste(as.Date(consumption$Date), consumption$Time)
consumption$dateTime <- as.POSIXct(dateTime)

## Plotting Plot 3 and adding legend on topright corner
with(consumption, {
  plot(Sub_metering_1~dateTime, type ="l",
       ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2~dateTime, col = 'Red')
  lines(Sub_metering_2~dateTime, col = 'Blue')
})

legend("topright", col = c("black", "red", "blue"), lty=1, lwd= c(2.5,2.5),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving plot to PNG file of width 480 pixels and height of 480 pixels
dev.copy(png, file="plot3.png", height = 480, width = 480)
dev.off()


