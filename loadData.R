library(dplyr)
loadData <- function(){
  data <- read.table("~/Desktop/Coursera/Exploratory_Analysis/household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
  data <- data[complete.cases(data), ]
  dateTime <- paste(data$Date, data$Time)
  dateTime <- setNames(dateTime, "DateTime")
  data <- data[ , -c(1,2)]
  data <- cbind(dateTime, data)
  data$dateTime <- as.POSIXct(dateTime)
  return(data)
}