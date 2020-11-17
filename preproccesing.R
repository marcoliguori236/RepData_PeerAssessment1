#Name of the zip file on local repository
filename <- "./activity.zip"

#unzip it if it hasn't already been unzipped
if (!file.exists("./activity.csv")) { 
  unzip(filename) 
}

#read the activity.csv file
activity <- read.table("./activity.csv", sep = ",", header = TRUE)
#change object type of "date" variable for better manipulation
activity <- mutate(activity, date = as.Date(date))