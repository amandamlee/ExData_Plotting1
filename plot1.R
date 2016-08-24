setwd("//prb.org/files/Public/Amanda/Coursera/Exploratory Data Analysis/Assignment1")

# Calculating memory requirements:
# 2,075,259 rows by 9 columns
# 2,075,259 * 9 * 8 bytes = 149,418,648 bytes

#       149,418,648 bytes/ 2^20 MB = 142.4967 MB
#       142.4967 MB= 0.142 GB

# This step reads in the first 100 obs of the dataset, then looks at the class of
# each column, then applies that class when told to re-read in the dataset.
# This allows the data to be read in much faster.
#initial <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", nrows = 100)
#lasses <- sapply(initial, class)

# Reading in the data, converting the Date variable
data_all <- read.table("household_power_consumption.txt", header = TRUE, 
                       sep = ";", dec=".", stringsAsFactors = FALSE, na.strings="?", comment.char="")
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

# Subsetting two only the data we want
data_feb <- subset(data_all, subset=(Date =="2007-02-01" | Date == "2007-02-02"))
head(data_feb)
rm(data_all)

#Converting the date and time variables into one variable
datetime <- paste(as.Date(data_feb$Date), data_feb$Time)
data_feb$datetime <- as.POSIXct(datetime)

#Plot 1
hist(data_feb$Global_active_power, main = "Global Active Power", 
     xlab= "Global Active Power (kilowatts)", ylab="Frequency", col="red", ylim=c(0,1200))

# Save as a PNG
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()



