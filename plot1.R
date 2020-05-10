#load data
df <- read.delim(file="/Users/winkulvichit/Dropbox/Educations/Visualization/coursera assignment/household_power_consumption.txt", header=TRUE, sep=";",dec=".")

#change format of data
df <- transform(df, Global_active_power = as.numeric(Global_active_power), Date = as.Date(Date, format="%d/%m/%Y"))

#subset data to be between 2007-02-01 to 2007-02-02
df_sub <- subset(df, Date >= as.Date("01/02/2007", format="%d/%m/%Y") & Date <= as.Date("02/02/2007", format="%d/%m/%Y"))

#set Graphic device to be plot1.PNG 
png(file="/Users/winkulvichit/Dropbox/Educations/Visualization/coursera assignment/ExData_Plotting1/plot1.png", width = 480, height = 480)

#plot 1
hist(df_sub$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)",main="Global Active Power")

#close Graphic device
dev.off()
