setwd("//prb.org/files/Public/Amanda/Coursera/Exploratory Data Analysis/Assignment1")

# Reading in the data, converting the Date variable
data_all <- read.table("household_power_consumption.txt", header = TRUE, 
                       sep = ";", dec=".", stringsAsFactors = FALSE, na.strings="?", comment.char="")
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

# Subsetting two only the data we want
data_feb <- subset(data_all, subset=(Date =="2007-02-01" | Date == "2007-02-02"))
rm(data_all)

#Converting the date and time variables into one variable
datetime <- paste(as.Date(data_feb$Date), data_feb$Time)
data_feb$datetime <- as.POSIXct(datetime)

# Creating plot 2
plot(data_feb$datetime, data_feb$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="", type="l")

# Save as a PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()