library(data.table)
df <- fread(file= 'household_power_consumption.txt',sep = ';',select = c('Date'))
df$Date <- as.Date(df$Date,format = '%d/%m/%Y')
Date_Filter <- (df$Date>='2007-02-01') & (df$Date<='2007-02-02')
df <- fread(file= 'household_power_consumption.txt',sep = ';')[Date_Filter]
df$Global_active_power = as.numeric(df$Global_active_power)
par(mfrow = c(1,1),mar = c(4,2,2,2))
hist(df$Global_active_power,main = 'Global Active Power',col = 'red',xlab = 'Global Active Power (kilowatts)')
dev.copy(device = png,'plot1.png')
dev.off()

