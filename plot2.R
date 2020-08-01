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

df[1:1440,"Time"] <- format(df[1:1440,"Time"],"2007-02-01 %H:%M:%S")
df[1441:2880,"Time"] <- format(df[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png('plot2.png')
plot(df$Time,as.numeric(as.character(df$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")
dev.off()
