#plot3.R
require(data.table)
p3.colClasses <- c("character", "character" ,"numeric" ,  "numeric"  , "numeric"   ,"numeric",   "numeric" ,  "numeric"  
                   , "numeric" )
p3.df <- fread("data/household_power_consumption.txt",
               colClasses=p3.colClasses
               ,dec=".",na.strings="?")
p3.df.onlyDate <- subset(p3.df,Date=="1/2/2007"|Date=="2/2/2007")
p3.df.onlyDate.dimTempo <- strptime(with(p3.df.onlyDate,paste(Date ,Time)),"%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_ALL", "en_US")
p3.dfGraph <- data.frame(p3.df.onlyDate.dimTempo,p3.df.onlyDate$Sub_metering_1,
                         p3.df.onlyDate$Sub_metering_2,p3.df.onlyDate$Sub_metering_3)
names(p3.dfGraph) <- c("time","sm1","sm2","sm3")
with(p3.dfGraph,
     plot(time,sm1,
          type = "l",xlab = "",ylab="Global Active Power (kilowatts)",col="black")
)
with(p3.dfGraph,points(time,sm2,type="l",col="red"))
with(p3.dfGraph,points(time,sm3,type="l",col="blue"))
legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,"plot3.png",width=480,height=480)
dev.off()
