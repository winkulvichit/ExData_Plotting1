#load data
df <- read.delim(file="/Users/winkulvichit/Dropbox/Educations/Visualization/coursera assignment/household_power_consumption.txt", header=TRUE, sep=";",dec=".")

#change format of data
df <- transform(df, Global_active_power = as.numeric(Global_active_power), Date = as.Date(Date, format="%d/%m/%Y"))

#subset data to be between 2007-02-01 to 2007-02-02
df_sub <- subset(df, Date >= as.Date("01/02/2007", format="%d/%m/%Y") & Date <= as.Date("02/02/2007", format="%d/%m/%Y"))

#create variable date-time
df_sub$DT <- paste(df_sub$Date, df_sub$Time, sep = " ")
df_sub$DT <- as.POSIXlt(df_sub$DT)

#set Graphic device to be plot2.PNG 
png(file="/Users/winkulvichit/Dropbox/Educations/Visualization/coursera assignment/ExData_Plotting1/plot2.png", width = 480, height = 480)

#plot 2
with(df_sub, plot(DT, Global_active_power, ylab = "Global Active Power (kilowattes)", xlab="", pch = 20, cex=0))
with(df_sub, lines(DT, Global_active_power))

#close Graphic device
dev.off()
