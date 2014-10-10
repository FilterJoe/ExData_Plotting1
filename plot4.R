# Plot 4: 4 plots

# Read in Data, extract 2 days of interest, and reformat dates to POSIXlt
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df_two <- df[df$Date=='1/2/2007' | df$Date=='2/2/2007',]  # subset 2 days
df_two$Date_time <- strptime(paste(df_two$Date, df_two$Time), "%e/%m/%Y %T")
df2 <- df_two[,c(10,3,4,5,6,7,8,9)] # removing superflous date and time columns, replaceing it with POSIX Date_time column

# Plot and save

png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2), mar = c(4, 4, 5, 2))

plot(df2$Date_time, df2$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

plot(df2$Date_time, df2$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(df2$Date_time, df2$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
points(df2$Date_time, df2$Sub_metering_2, type = "l", col = "red")
points(df2$Date_time, df2$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"), bty = "n")

plot(df2$Date_time, df2$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()