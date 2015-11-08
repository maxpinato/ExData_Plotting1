#plot2.R
require(data.table)
p2.colClasses <- c("character", "character" ,"numeric" ,  "numeric"  , "numeric"   ,"numeric",   "numeric" ,  "numeric"  
                      , "numeric" )
p2.df <- fread("data/household_power_consumption.txt",
                  colClasses=p2.colClasses
                  ,dec=".",na.strings="?")
p2.df.onlyDate <- subset(p2.df,Date=="1/2/2007"|Date=="2/2/2007")
p2.df.onlyDate.dimTempo <- strptime(with(p2.df.onlyDate,paste(Date ,Time)),"%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_ALL", "en_US")
p2.dfGraph <- data.frame(p2.df.onlyDate.dimTempo,p2.df.onlyDate$Global_active_power)
names(p2.dfGraph) <- c("time","value")
with(p2.dfGraph,
     plot(time,value,
          type = "l",xlab = "",ylab="Global Active Power (kilowatts)")
)
dev.copy(png,"plot2.png",width=480,height=480)
dev.off()
     