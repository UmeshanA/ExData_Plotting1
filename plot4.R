## Reading & Storing the full Dataset
consumption_data <- read.csv("./data/household_power_consumption.txt", header = T, sep = ';', na.strings = "?",
                             nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char ="", quote = '\"')
consumption_data$Date <- as.Date(consumption_data$Date, format = "%d/%m/%Y")

## Subsetting the data from dates 2007-02-01 to 2007-02-02 and converting it 
consumption <- subset(consumption_data, subset =(Date >= "2007-02-01" & Date <= "2007-02-02"))
dateTime <- paste(as.Date(consumption$Date), consumption$Time)
consumption$dateTime <- as.POSIXct(dateTime)

## Plotting Plot 4
## Setting up the plot window
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

## Plotting the data
with(consumption, {
## Plotting top left graph 
    plot(Global_active_power~dateTime, type = "l",
        ylab = "Global Active Power (kilowatts)", xlab = "")
## Plotting top right graph     
    plot(Voltage~dateTime, type = "l",
         ylab = "Voltage", xlab = "datetime")
  
## Plotting bottom left graph
    plot(Sub_metering_1~dateTime, type = 'l',
         ylab = "Energy sub metering", xlab ="")
    lines(Sub_metering_2~dateTime, col = 'Red')
    lines(Sub_metering_3~dateTime, col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd =2, bty = "n",
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
## Plotting bottom right graph
    plot(Global_reactive_power~dateTime, type = "l",
         ylab = "Global_reactive_power", xlab = "datetime")
    
})

## Saving plot to PNG file of width 480 pixels and height of 480 pixels
dev.copy(png, file="plot4.png", height = 480, width = 480)
dev.off()

