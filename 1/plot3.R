setwd("C:/Users/eciuffo/github/jhopkins/eda/1")

pc <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";",stringsAsFactors = FALSE)
pc$Time <- strptime(paste(pc$Date,pc$Time), "%d/%m/%Y %H:%M:%S")

pc[, 1] <- as.Date(pc[, 1],format = "%d/%m/%Y ") 
pc.sub<-subset(pc, subset=(pc$Date>=as.Date("2007/02/01","%Y/%m/%d") & pc$Date<=as.Date("2007/02/02","%Y/%m/%d") ))

pc.sub[, 3] <- as.numeric(pc.sub[, 3])
pc.sub[, 4] <- as.numeric(pc.sub[, 4])
pc.sub[, 5] <- as.numeric(pc.sub[, 5])
pc.sub[, 6] <- as.numeric(pc.sub[, 6])
pc.sub[, 7] <- as.numeric(pc.sub[, 7])
pc.sub[, 8] <- as.numeric(pc.sub[, 8])
pc.sub[, 9] <- as.numeric(pc.sub[, 9])

png(file="plot3.png",width=480,height=480,units="px")
plot (pc.sub$Time, pc.sub$Sub_metering_1,type="l",col = "blue", lwd = 1,ylab="Energy Sub Metering",xlab="")
lines (pc.sub$Time, pc.sub$Sub_metering_2,col="red")
lines (pc.sub$Time, pc.sub$Sub_metering_3,col="green")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=1,col=c("blue","red","green"),lty=1)
dev.off()


