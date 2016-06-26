##Read text file in a data frame
household_power_consumption <- read.csv("~/household_power_consumption.txt", header=FALSE, 
                                        sep=";", na.strings="?",
                                        col.names = c("Date","Time","Global_active_power",
                                                      "Global_reactive_power","Voltage",
                                                      "Global_intensity","Sub_metering_1",
                                                      "Sub_metering_2","Sub_metering_3"),skip = 1,
                                        colClasses = c("character","character","numeric","numeric",
                                                       "numeric","numeric","numeric","numeric",
                                                       "numeric"))
View(household_power_consumption)

## Convert Date and Time into DateTime object
library(lubridate)
household_power_consumption$Time<-paste(household_power_consumption$Date,
                                        household_power_consumption$Time,sep = " ")
household_power_consumption$Time<-dmy_hms(household_power_consumption$Time)
household_power_consumption$Date<-dmy(household_power_consumption$Date)

## Subset the data set into smaller data set according to required dates
dt1<-ymd("2007-02-01")
dt2<-ymd("2007-02-02")
hpc_data<-household_power_consumption[household_power_consumption$Date %in% c(dt1,dt2),]

## Plot line plot
with(hpc_data,plot(Time,Global_active_power,type="l",xlab = " ",ylab = 
                     "Global Activity Power (kiowatts)"))

## Copy to png file and close graphics divice
dev.copy(png,file="plot2.png")
dev.off()