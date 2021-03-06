# Plot 1: Global Active Power histogram

# Read in Data, extract 2 days of interest, and reformat dates to POSIXlt
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df_two <- df[df$Date=='1/2/2007' | df$Date=='2/2/2007',]  # subset 2 days
df_two$Date_time <- strptime(paste(df_two$Date, df_two$Time), "%e/%m/%Y %T")
df2 <- df_two[,c(10,3,4,5,6,7,8,9)] # removing superflous date and time columns, replaceing it with POSIX Date_time column

# Plot and save
png("plot1.png", width = 480, height = 480, units = "px")
hist(df2$Global_active_power,
     col="red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
