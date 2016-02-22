library(datasets)

##reading data file
input<-"household_power_consumption.txt"
x<-read.table(input, sep=";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")

##using data from the dates 2007-02-01 and 2007-02-02
y<-x[(x$Date=="1/2/2007" | x$Date=="2/2/2007"),]
y$datetime<-strptime(paste(y$Date, y$Time), format="%d/%m/%Y %H:%M:%S") 

##Construct the plot and save it to a PNG file with width and height of 480 by 480 pixels
png("plot4.png", width=480, height=480)

## multiple figures by column - graphs are arranged in 2 columns and 2 rows
par(mfcol=c(2,2))
plot(y$datetime, y$Global_active_power,type="l", xlab="",  ylab="Global Active Power (kilowatts)")
plot(y$datetime, y$Sub_metering_1, type="l", col="black", xlab="",  ylab="Energy sub metering")
lines(y$datetime, y$Sub_metering_2, type="l", col="red")
lines(y$datetime, y$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"),  bty="n", lty=1, lwd=2,  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(y$datetime, y$Voltage,type="l", xlab="datetime",  ylab="Voltage")
plot(y$datetime, y$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

##close the graph device
dev.off()
