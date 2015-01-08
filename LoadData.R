## Read Data
setwd("C:/Project")
mydata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
## Check number of rows & columns 
## Set Date Format
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

## Filter data pertaining 1st and 2nd Feb 2007

datafilter <- mydata[(mydata$Date=="2007-02-01") | (mydata$Date=="2007-02-02"),]

## Set Date & Time Format 
datafilter <- transform(datafilter, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

## Set field as number for active_power, reactive_power and Voltage

datafilter$Global_active_power <- as.numeric(as.character(datafilter$Global_active_power))
datafilter$Global_reactive_power <- as.numeric(as.character(datafilter$Global_reactive_power))
datafilter$Voltage <- as.numeric(as.character(datafilter$Voltage))

## Set field as number for sub_metering
datafilter$Sub_metering_1 <- as.numeric(as.character(datafilter$Sub_metering_1))
datafilter$Sub_metering_2 <- as.numeric(as.character(datafilter$Sub_metering_2))
datafilter$Sub_metering_3 <- as.numeric(as.character(datafilter$Sub_metering_3))


