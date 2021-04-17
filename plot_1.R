##library###
library(dplyr)
library(readr)
###load the data file##
data <- read_delim(file="C:/Users/alexmasenheimer/Desktop/Training/coursera/household_power_consumption.txt",delim=";",na="?")
###take a subset of the data file for Feb 1st and 2nd 2007
feb_subset <- data %>% mutate(Date = as.Date(Date, format("%d/%m/%Y"))) %>% 
               filter(Date == "2007-02-01" | Date == "2007-02-02")
##open png device with dimensions of width=480 and height=480
png(filename="plot_1.png",width=480,height=480)
##write plot to png device
with(feb_subset,hist(Global_active_power,col = "red", 
                     main = "Global Active Power"))
##DON'T forget to turn off device
dev.off()
