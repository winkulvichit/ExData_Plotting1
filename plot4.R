#load data
df <- read.delim(file="/Users/winkulvichit/Dropbox/Educations/Visualization/coursera assignment/household_power_consumption.txt", header=TRUE, sep=";",dec=".")

#change format of data
df <- transform(df, Sub_metering_1 = as.numeric(Sub_metering_1), Sub_metering_2 = as.numeric(Sub_metering_2),
                Sub_metering_3 = as.numeric(Sub_metering_3), Date = as.Date(Date, format="%d/%m/%Y"))

#subset data to be between 2007-02-01 to 2007-02-02
df_sub <- subset(df, Date >= as.Date("01/02/2007", format="%d/%m/%Y") & Date <= as.Date("02/02/2007", format="%d/%m/%Y"))

#create variable date-time
df_sub$DT <- paste(df_sub$Date, df_sub$Time, sep = " ")
df_sub$DT <- as.POSIXlt(df_sub$DT)

#set Graphic device to be plot4.PNG 
png(file="/Users/winkulvichit/Dropbox/Educations/Visualization/coursera assignment/ExData_Plotting1/plot4.png", width = 480, height = 480)

#plot 4
par(mfrow=c(2,2))

with(df_sub, plot(DT, Global_active_power, ylab = "Global Active Power (kilowattes)", xlab="", pch = 20, cex=0))
with(df_sub, lines(DT, Global_active_power))

with(df_sub, plot(DT, Voltage, xlab="datetime",pch = 20, cex=0))
with(df_sub, lines(DT, Voltage))

with(df_sub, plot(DT, Sub_metering_1, ylab = "Energy sub metering", xlab="", pch = 20, cex=0))
with(df_sub, lines(DT, Sub_metering_1))
with(df_sub, lines(DT, Sub_metering_2, col="red"))
with(df_sub, lines(DT, Sub_metering_3, col="blue"))
legend("topright", lty = 1, col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(df_sub, plot(DT, Global_reactive_power, xlab="datetime",pch = 20, cex=0))
with(df_sub, lines(DT, Global_reactive_power))


#close Graphic device
dev.off()
