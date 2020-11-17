# We will impute the missing values with the mean for that interval
activityImputed <- activity %>% group_by(interval) %>%
  mutate(steps=ifelse(is.na(steps),mean(steps,na.rm=TRUE),steps))

#make dataframe where each row is a day and its total steps
actImputedByDate <- group_by(activityImputed, date) %>%
  summarize(steps = sum(steps))

#total steps per day in imputed data. Can be compared to summaryRawData
summmaryImputedData <- summarize(actImputedByDate, mean.imputed = mean(steps), median.imputed = median(steps))

par(mfrow = c(1, 2))
#make histogram of steps taken each day
with(actByDate, hist(steps, breaks = 10, main = "Total steps per day (raw data)"))
#make histogram of steps taken each day
with(actImputedByDate, hist(steps, breaks = 10, main = "Total steps per day (imputed data)"))


