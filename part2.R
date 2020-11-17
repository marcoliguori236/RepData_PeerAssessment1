#make dataframe where each row is an interval and its average steps
actByInterval <-  group_by(activity, interval) %>%
  summarize(steps = mean(steps, na.rm = TRUE))

#make time series plot of average steps depending on intervals
with(actByInterval, plot(interval, steps, type = "l", main = "Time series plot of the average number of steps taken"))

#5-minute interval that, on average, contains the maximum number of steps
maxStepInt <- subset(actByInterval, steps == max(steps))

#draw vertical line where max steps happen
with(maxStepInt, abline(v = interval, col = "blue"))
legend("topright", legend = "Max steps", col = "blue", lty = 1)
