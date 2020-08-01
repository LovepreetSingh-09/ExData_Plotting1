df <- read.table('data/household_power_consumption.txt', sep=';', skip=1)
str(df)

names(df) <- c("Date","Time","Global_active_power",
               "Global_reactive_power","Voltage","Global_intensity",
               "Sub_metering_1","Sub_metering_2","Sub_metering_3")

df <- subset(df, df$Date=="1/2/2007" | df$Date =="2/2/2007")
str(df)

df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Time <- strptime(df$Time, format="%H:%M:%S")
str(df)

png('plot1.png')
hist(as.numeric(df$Global_active_power), col="red",main="Global Active Power", xlab="Global Active Power(kilowatts)") 
title(main="Global Active Power")
dev.off()
