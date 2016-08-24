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

# Creating plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_feb, {
        plot(Global_active_power~datetime, type="l", 
             ylab="Global Active Power", xlab="")
        plot(Voltage~datetime, type="l", 
             ylab="Voltage", xlab="datetime")
        plot(Sub_metering_1~datetime, type="l",
             ylab = "Energy sub metering", xlab="")
        lines(Sub_metering_2~datetime, col="red")
        lines(Sub_metering_3~datetime, col="blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               col=c("black", "red", "blue"), lty = 1, lwd=1.5, bty="n", cex=0.6)
plot(Global_reactive_power~datetime, type="l", ylab="Global_reactive_power", xlab="datetime")
}) 

# Save as a PNG
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()