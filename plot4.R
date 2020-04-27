library(data.table)
df <- fread(file= 'household_power_consumption.txt',sep = ';',select = c('Date'))
df$Date <- as.Date(df$Date,format = '%d/%m/%Y')
Date_Filter <- (df$Date>='2007-02-01') & (df$Date<='2007-02-02')
df <- fread(file= 'household_power_consumption.txt',sep = ';')[Date_Filter]
df$Global_active_power = as.numeric(df$Global_active_power)

df$Global_active_power <- as.numeric(df$Global_active_power)



par(mfrow = c(2,2))
plot(df$Global_active_power,type = 'l',xaxt = 'n',ylab = 'Global_active_power (killowatts)')
axis(1,at = c(0,1500,2900),labels = c('Thu','Fri','Sat'))

plot(df$Voltage,type = 'l',xaxt = 'n',ylab = 'Voltage',xlab = 'datetime')
axis(1,at = c(0,1500,2900),labels = c('Thu','Fri','Sat'))



plot(df$Sub_metering_1,type = 'n',xaxt = 'n',ylab = 'Energy sub metering')
points(df$Sub_metering_1,type = 'l',xaxt = 'n',ylab = 'Energy sub metering', col = 'black')
points(df$Sub_metering_2,type = 'l',col = 'red')
points(df$Sub_metering_3,type = 'l',col = 'blue')
axis(1,at = c(0,1500,2900),labels = c('Thu','Fri','Sat'))
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
       ,col = c('black','red','blue'),lty = 'solid',lwd = 1,cex = .75)

plot(df$Global_reactive_power,type = 'l',xaxt = 'n',ylab = 'Global Reactive Power',xlab = 'datetime')
axis(1,at = c(0,1500,2900),labels = c('Thu','Fri','Sat'))

dev.copy(device = png,file = 'plot4.png')
dev.off()
