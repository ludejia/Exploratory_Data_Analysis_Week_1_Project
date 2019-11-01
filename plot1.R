#read the data
data = read.table('household_power_consumption.txt', sep = ';', header = T,
                  na.strings = "?", stringsAsFactors=F)

#Create a new column and get the POSIXLT date-time 
data$date_time = strptime(paste(data$Date, data$Time, sep = ' '),"%d/%m/%Y %H:%M:%S")

#subset the data from the required date range
data = subset(data,data$date_time >="2007-02-01" & data$date_time <"2007-02-03")

#create plot1
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

#export png file
dev.copy(png, file = "plot1.png")
dev.off()












