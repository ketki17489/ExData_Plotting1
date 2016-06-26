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
household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")

## Subset the data set into smaller data set according to required dates
dt1<-as.Date("2007-02-01","%Y-%m-%d")
dt2<-as.Date("2007-02-02","%Y-%m-%d")
hpc_data<-household_power_consumption[household_power_consumption$Date %in% c(dt1,dt2),]

## Plot histogram Global Active Power
with(hpc_data,hist(Global_active_power,col = "red",main = "Global Active Power",
                   xlab = "Global Active Power (kilowatts)",ylab = "frequency"))

## Copy to png file and close graphics divice
dev.copy(png,file="plot1.png")
dev.off()