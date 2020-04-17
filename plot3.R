library(dplyr)#for bind_cols
dat<-read.table("D:/exploratory Data Analysis/assignments/week1/ExData_Plotting1/household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
subset2<-subset(dat,dat$Date %in% c("1/2/2007","2/2/2007")) #subsetted the data to only 2 days
subset3<-subset2
subset3$Date<-as.Date(subset3$Date,format ="%d/%m/%Y")

#merging date and time
datetime<-as.POSIXct(paste(subset3$Date, subset3$Time), format="%Y-%m-%d %H:%M:%S")
subset4<-bind_cols(subset3,data.frame(datetime))

#plotting
with(subset4,plot(datetime, Sub_metering_1, type="l", lwd=1, col="black", bty="l", pch=20 , cex=1, ylab = "Energy Sub Metering", ylim = c(0,30)))
par(new=TRUE)
with(subset4,plot(datetime,Sub_metering_2,type="l",lwd=1,col="red",bty="l",pch=20 , cex=1,ylab = "Energy Sub Metering",ylim = c(0,30)))
par(new=TRUE)
with(subset4,plot(datetime,Sub_metering_3,type="l",lwd=1,col="blue",bty="l",pch=20 , cex=1,ylab = "Energy Sub Metering",ylim = c(0,30)))
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"),lty = 1,cex = 0.5)
dev.copy(png, file = "plot3.png")
dev.off()
