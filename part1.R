#load dplyr library to perform subsetting of data
library(dplyr)

#make dataframe where each row is a day and its total steps
actByDate <- group_by(activity, date) %>%
  summarize(steps = sum(steps, na.rm = TRUE))

#total steps per day in pre-imputed data
summaryRawData <- summarize(actByDate, mean.raw = mean(steps), median.raw = median(steps))

#make histogram of steps taken each day
with(actByDate, hist(steps, breaks = 10))

#add vertical lines where the mean and median occur
with(actByDate, abline(v = c(mean(steps), median(steps)), col = c("blue", "red")))
legend("topright", legend = c("Mean steps", "Median steps"), col = c("blue", "red"), lty = 1)