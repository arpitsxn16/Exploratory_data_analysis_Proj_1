library(data.table)
library(readr)
library(dplyr)
library(ggplot2)

data_file <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Time <-  strptime(paste(data$Date,data$Time),format= "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data<- na.omit(data)
data_final <- subset(data, ((Date >= as.Date("2007-02-01")) & (Date <= as.Date("2007-02-02"))))
data_final$Global_active_power <- as.numeric(data_final$Global_active_power)
png("plot1.png", width = 480, height = 480)
with(data_final,hist(Global_active_power, xlab="Global Active Power (kilowatts)", main= "Global Active Power", col = "red"))
dev.off()


