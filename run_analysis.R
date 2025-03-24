## Load libraries
library(dplyr)
library(tidyr)

## Load in the test data
activities = read.table("activity_labels.txt", col.names = c("activity_num", "activity_label"))
test_labels = read.table("test/y_test.txt", col.names = c("activity_num"))
subject_test = read.table("test/subject_test.txt", col.names = c("subject"))
features = read.table("features.txt", col.names = c("feature_num", "feature_label"))

test_data = read.table("test/X_test.txt")
body_acc_x_test = read.table("test/Inertial Signals/body_acc_x_test.txt")

## clean data
activities$activity_label = tolower(activities$activity_label)

## combine data into single dataframe
data = left_join(test_labels, activities, by = join_by(activity_num))
data = cbind(subject_test, data)

colnames(test_data) = features$feature_label
data = cbind(data, test_data)
