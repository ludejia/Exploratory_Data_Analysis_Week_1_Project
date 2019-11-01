#read the data
data = read.table('household_power_consumption.txt', sep = ';', header = T,
                  na.strings = "?", stringsAsFactors=F)

#Create a new column and get the POSIXLT date-time 
data$date_time = strptime(paste(data$Date, data$Time, sep = ' '),"%d/%m/%Y %H:%M:%S")

#subset the data from the required date range
data = subset(data,data$date_time >="2007-02-01" & data$date_time <"2007-02-03")

#create plot4

png(file="plot4.png")
par(mfrow=c(2,2))

plot(data$date_time, data$Global_active_power, type="l", 
     xlab='', ylab="Global Active Power")

plot(data$date_time, data$Voltage, type="l", 
     xlab='datetime', ylab="Voltage")

plot(data$date_time, data$Sub_metering_1, type="l", 
     xlab='', ylab="Energy sub metering")

lines(data$date_time, data$Sub_metering_2, col='red',
      xlab='')

lines(data$date_time, data$Sub_metering_3, col='blue',
      xlab='')

legend("topright", col = c('black','red','blue'), lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty='n')

plot(data$date_time, data$Global_reactive_power, type="l", 
     xlab='datetime', ylab="Global Rreactive Power")


#export png file
dev.off()

