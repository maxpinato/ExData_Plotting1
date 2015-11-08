#plot1.R
require(data.table)
plot1.colClasses <- c("character", "character" ,"numeric" ,  "numeric"  , "numeric"   ,"numeric",   "numeric" ,  "numeric"  
                      , "numeric" )
plot1.df <- fread("data/household_power_consumption.txt",
                      colClasses=plot1.colClasses
                      ,dec=".",na.strings="?")
plot1.df.onlyDate <- subset(plot1.df,Date=="1/2/2007"|Date=="2/2/2007")
plot1.gap <- plot1.df.onlyDate$Global_active_power
plot1.gap.notNa <- plot1.gap[!is.na(plot1.gap)]
hist(plot1.gap.notNa,ylim=c(0,1200),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()