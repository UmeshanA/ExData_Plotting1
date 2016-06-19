## Reading & Storing the full Dataset
consumption_data <- read.csv("./data/household_power_consumption.txt", header = T, sep = ';', na.strings = "?", 
                             nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char ="", quote = '\"')
consumption_data$Date <- as.Date(consumption_data$Date, format = "%d/%m/%Y")

## Subsetting the data from dates 2007-02-01 to 2007-02-02 and coverting it 
consumption <- subset(consumption_data, subset =(Date >= "2007-02-01" & Date <= "2007-02-02"))
dateTime <- paste(as.Date(consumption$Date), consumption$Time)
consumption$dateTime <- as.POSIXct(dateTime)

## Plotting Plot 1
hist(consumption$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", col = "Red")

## Saving plot to PNG file of width 480 pixels and height of 480 pixels
dev.copy(png, file="plot1.png", height = 480, width = 480)
dev.off()