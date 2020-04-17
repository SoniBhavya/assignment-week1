dat<-read.table("D:/exploratory Data Analysis/assignments/week1/ExData_Plotting1/household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
trial2<-subset(dat,dat$Date %in% c("1/2/2007","2/2/2007")) #subsetted the data to only 2 days
hist(trial2$Global_active_power,col = "red", main = "Global Active Power",xlab = "Global ACtive Power(kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
