library(data.table)
df <- fread(file= 'household_power_consumption.txt',sep = ';',select = c('Date'))
df$Date <- as.Date(df$Date,format = '%d/%m/%Y')
Date_Filter <- (df$Date>='2007-02-01') & (df$Date<='2007-02-02')
df <- fread(file= 'household_power_consumption.txt',sep = ';')[Date_Filter]
df$Date <- as.Date(df$Date,format = '%d/%m/%Y')
df$Day <- as.factor(weekdays(df$Date))
df$Global_active_power <- as.numeric(df$Global_active_power)

par(mfrow = c(1,1),mar = c(4,4,2,2))
plot(df$Global_active_power,type = 'l',xaxt = 'n',ylab = 'Global_active_power (killowatts')
axis(1,at = c(0,1500,2900),labels = c('Thu','Fri','Sat'))

dev.copy(device = png,file = 'plot2.png')
dev.off()
