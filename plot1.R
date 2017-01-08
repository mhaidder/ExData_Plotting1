library(dplyr)
library(lubridate)

# reading source data
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# open PNG device with a width of 480 pixels and a height of 480 pixels
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot1.png', width = 480, height = 480, units='px')

# Creating numerics
data <- data %>% select(V3) %>% mutate(V3 = as.numeric(as.character(V3)))

# creating histogram with Xaxis and Yaxis labels
with(data, hist(data$V3, xlab = "Global Active Power (kilowatt)", ylab = "Frequency", col = "red", main = "Global Active Power"))


#close PNG file Device
dev.off()