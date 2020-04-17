library(dplyr)#for bind_cols
dat<-read.table("D:/exploratory Data Analysis/assignments/week1/ExData_Plotting1/household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
subset2<-subset(dat,dat$Date %in% c("1/2/2007","2/2/2007")) #subsetted the data to only 2 days
subset3<-subset2
subset3$Date<-as.Date(subset3$Date,format ="%d/%m/%Y")

#merging date and time
datetime<-as.POSIXct(paste(subset3$Date, subset3$Time), format="%Y-%m-%d %H:%M:%S")
subset4<-bind_cols(subset3,data.frame(datetime))
with(subset4,plot(datetime,Global_active_power,type="l",lwd=1,col="black",bty="l",pch=20 , cex=1))
dev.copy(png, file = "plot2.png")
dev.off()
