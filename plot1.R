library(datasets)
##reading data file

input<-"household_power_consumption.txt"
x<-read.table(input, sep=";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")

##using data from the dates 2007-02-01 and 2007-02-02
y<-x[(x$Date=="1/2/2007" | x$Date=="2/2/2007"),]

##Construct the plot and save it to a PNG file with width and height of 480 by 480 pixels
png("plot1.png", width=480, height=480)
hist(y$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##close the graph device
dev.off()