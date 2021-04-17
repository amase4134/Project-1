##library###
library(dplyr)
library(readr)
library(lubridate)
###load the data file##
data <- read_delim(file="C:/Users/alexmasenheimer/Desktop/Training/coursera/household_power_consumption.txt",delim=";",na="?")
##add new field datetime to data and filter on Feb 1st and 2nd 2007##
feb_subset <- mutate(data,Date = as.Date(Date, format("%d/%m/%Y"))) %>% 
  filter(Date == "2007-02-01" | Date == "2007-02-02") %>% 
  mutate(datetime = as.POSIXct(ymd(Date) + hms(Time)))


##open png device with dimensions of width=480 and height=480
png(filename="plot_3.png",width=480,height=480)
##write plot to png device
plot(feb_subset$datetime,feb_subset$Sub_metering_1,type="n", xlab = "Date Time",ylab="Energy sub metering", main = "plot 3")
lines(feb_subset$datetime,feb_subset$Sub_metering_1)
lines(feb_subset$datetime,feb_subset$Sub_metering_2, col="red")
lines(feb_subset$datetime,feb_subset$Sub_metering_3, col="blue")
legend("topright",pch=c(4,4,4),col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##DON'T forget to turn off device
dev.off()