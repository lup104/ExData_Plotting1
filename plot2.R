library(datasets)

##reading data file
input<-"household_power_consumption.txt"
x<-read.table(input, sep=";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")

##using data from the dates 2007-02-01 and 2007-02-02
y<-x[(x$Date=="1/2/2007" | x$Date=="2/2/2007"),]
y$datetime<-strptime(paste(y$Date, y$Time), format="%d/%m/%Y %H:%M:%S") 

##Construct the plot and save it to a PNG file with width and height of 480 by 480 pixels
png("plot2.png", width=480, height=480)
plot(y$datetime, y$Global_active_power,type="l", xlab="",  ylab="Global Active Power (kilowatts)")

##close the graph device
dev.off()
