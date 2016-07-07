######### Load Data ######################################################################################


HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                  colClasses = c(rep("character",2),rep("numeric",7)), comment.char = "")       ##Read Data
Req.HPC <- HPC[HPC$Date == "1/2/2007" | HPC$Date == "2/2/2007",]                                ##Subset required data
Req.HPC$Date <- as.Date(Req.HPC$Date,"%d/%m/%Y")                                                ##Date class the Date col
Req.HPC$Time <- strptime(paste(Req.HPC$Date, Req.HPC$Time), "%Y-%m-%d %H:%M:%S")                ##Time Class for Time col

Sys.setlocale("LC_TIME", "English")                                                             ##Weekdays for x-axis

######## Plot Data #######################################################################################

png("plot1.png", width = 480, height = 480, type = "windows")                                   ##Create png file

with(Req.HPC, hist(Global_active_power, 
                   type = "l", 
                   xlab = "Global Active Power (kilowatts)", 
                   col = "red",
                   main = "Global Active Power"))                                                           ##Plot Line Graph
dev.off()