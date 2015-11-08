#plot4.R
require(data.table)
p4.colClasses <- c("character", "character" ,"numeric" ,  "numeric"  , "numeric"   ,"numeric",   "numeric" ,  "numeric"  
                   , "numeric" )
p4.df <- fread("data/household_power_consumption.txt",
               colClasses=p4.colClasses
               ,dec=".",na.strings="?")
p4.df.onlyDate <- subset(p4.df,Date=="1/2/2007"|Date=="2/2/2007")
p4.df.onlyDate.dimTempo <- strptime(with(p4.df.onlyDate,paste(Date ,Time)),"%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_ALL", "en_US")
p4.dfGraph <- data.frame(p4.df.onlyDate.dimTempo,p4.df.onlyDate$Global_active_power,
  p4.df.onlyDate$Sub_metering_1, p4.df.onlyDate$Sub_metering_2,p4.df.onlyDate$Sub_metering_3,
  p4.df.onlyDate$Voltage, p4.df.onlyDate$Global_reactive_power )
                         
names(p4.dfGraph) <- c("time","gap","sm1","sm2","sm3","volt","grp")
par(mfrow=c(2,2))
# Plot R1 C1
with(p4.dfGraph,
     plot(time,gap,
          type = "l",xlab = "",ylab="Global Active Power (kilowatts)")
)
# Plot R1 C2
with(p4.dfGraph,
     plot(time,volt,
          type = "l",xlab = "datetime",ylab="Voltage")
)
# Plot R2 C1
with(p4.dfGraph,
     plot(time,sm1,
          type = "l",xlab = "",ylab="Global Active Power (kilowatts)",col="black")
)
with(p4.dfGraph,points(time,sm2,type="l",col="red"))
with(p4.dfGraph,points(time,sm3,type="l",col="blue"))
legend("topright",bty="n" , col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Plot R2 C2
with(p4.dfGraph,
     plot(time,grp,
          type = "l",xlab = "datetime",ylab="Global Reactive Power (kilowatts)")
)
dev.copy(png,"plot4.png",width=480,height=480)
dev.off()

