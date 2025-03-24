# Load libraries
library(dplyr)

## Load in the test data
activities = read.table("activity_labels.txt", col.names = c("activity_num", "activity_label"))
test_labels = read.table("test/y_test.txt", col.names = c("activity_num"))
subject_test = read.table("test/subject_test.txt", col.names = c("subject"))

## clean data
activities$activity_label = tolower(activities$activity_label)

## combine data into single dataframe
data = left_join(test_labels, activities, by = join_by(activity_num))
data = cbind(subject_test, data)
