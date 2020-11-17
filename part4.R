#change language of environment to get dates in English (instead of native spanish)
Sys.setlocale("LC_TIME", "English")

library(ggplot2)

#vector with weekend days
weekendDays <- c("Saturday", "Sunday")

#create variable "day" which indicates whether the given day is a weekday or weekend
actWeekdays <- activityImputed %>% 
  mutate(day = factor((weekdays(date) %in% weekendDays), levels = c(TRUE, FALSE), labels = c("weekend", "weekday")))

#make dataframe with the average steps taken by interval and day category
actWeekdaysByInt <-  group_by(actWeekdays, interval, day) %>%
  summarize(steps = mean(steps))

plot <- ggplot(data=actWeekdaysByInt, aes(x = interval, y = steps)) + facet_grid(day ~ .) + geom_line(col = "blue") + 
  labs(title="Average number of steps by interval and day category", x ="Interval", y = "Steps") 

print(plot)