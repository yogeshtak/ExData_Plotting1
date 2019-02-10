rm(list=ls())
>cons<-read.table('/Users/yogesh/Desktop/household_power_consumption.txt',sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
# Subsetting the data
sub<- subset(cons, (cons$Date == "1/2/2007" | cons$Date== "2/2/2007"))
# Changing the class of Date variable from character to Date:
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")
# Combining the Date and Time variable 
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))
# Creating the plot2:
png("plot2.png", width = 480, height = 480)
plot(sub$DateTime, sub$Global_active_power, type="l", ylab= "Global Active Power(kilowatts)", xlab="")
dev.off()

