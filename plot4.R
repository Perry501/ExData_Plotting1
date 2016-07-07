######### Load Data ######################################################################################


HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                  colClasses = c(rep("character",2),rep("numeric",7)), comment.char = "")       ##Read Data
Req.HPC <- HPC[HPC$Date == "1/2/2007" | HPC$Date == "2/2/2007",]                                ##Subset required data
Req.HPC$Date <- as.Date(Req.HPC$Date,"%d/%m/%Y")                                                ##Date class the Date col
Req.HPC$Time <- strptime(paste(Req.HPC$Date, Req.HPC$Time), "%Y-%m-%d %H:%M:%S")                ##Time Class for Time col

Sys.setlocale("LC_TIME", "English")                                                             ##Weekdays for x-axis

png("plot4.png", width = 480, height = 480, type = "windows")                                  ##Create png file
par(mfrow = c(2,2))                                                                             ##Set up multiple base plots

######## Plot1 Data #######################################################################################

with(Req.HPC, plot(Time, Global_active_power, 
                   type = "l", 
                   xlab = "", 
                   ylab = "Global Active Power"))                                               ##Plot GAP Line Graph

######## Plot2 Data #######################################################################################

with(Req.HPC, plot(Time, Voltage, 
                   type = "l", 
                   xlab = "datetime", 
                   ylab = "Voltage"))                                                           ##Plot Voltage Line Graph

######## Plot3 Data #######################################################################################

with(Req.HPC, plot(Time, Sub_metering_1, 
                   type = "l", 
                   xlab = "", 
                   ylab = "Energy sub metering",
                   cex.axis = 0.8))                                               ##Plot Line Sub_metering_1
lines(Req.HPC$Time, Req.HPC$Sub_metering_2,
      col = "red")                                                                             ##Add Line Sub_metering_2
lines(Req.HPC$Time, Req.HPC$Sub_metering_3,
      col = "blue")                                                                             ##Add Line Sub_metering_3

legend("topright", 
       lty = c(1,1,1),
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       ##cex = 0.7,
       ##y.intersp = 0.25,
       bty = "n")                                                                               ##Adding Legend

######## Plot4 Data #######################################################################################

with(Req.HPC, plot(Time, Global_reactive_power, 
                   type = "l",
                   lwd = 0.01,
                   xlab = "datetime", 
                   ylab = "Global_reactive_power"))                                             ##Plot GRP Line Graph

dev.off()