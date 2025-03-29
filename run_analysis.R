## Load libraries
library(dplyr)
library(tidyr)
library(stringr)

## Load in activities and feature data
activities = read.table("activity_labels.txt", col.names = c("activity_num", "activity_label"))
features = read.table("features.txt", col.names = c("feature_num", "feature_label"))

## load in test data
test_labels = read.table("test/y_test.txt", col.names = c("activity_num"))
subject_test = read.table("test/subject_test.txt", col.names = c("subject"))
test_data = read.table("test/X_test.txt")
## label variables with appropriate variable names from features.txt
names(test_data) = features$feature_label

## Load in the training data
train_labels = read.table("train/y_train.txt", col.names = "activity_num")
subject_train = read.table("train/subject_train.txt", col.names = "subject")
train_data = read.table("train/x_train.txt")
## label variables with appropriate variable names from features.txt
names(train_data) = features$feature_label

## join subject_test, test_labels, and test_data. Do the same for the training data
test = cbind(subject_test, test_labels, test_data)
train = cbind(subject_train, train_labels, train_data)

## join test data and train data into one data set
data = rbind(test, train)

## extract only the measurements on the mean and standard deviation for each  
## measurement
data = data %>% select(subject, activity_num, contains(c("mean", "std")))

## Use descriptive activity names to name the activities in the data set. These 
## come from the activities.txt file provided:
data = left_join(data, activities, by = join_by(activity_num))

## from data above, create a second, independent tidy data set with the average 
## of each variable for each activity and each subject
tidy_data = pivot_longer(data, 
                         cols = contains(c("mean", "std")), 
                         names_to = "measurement_type", 
                         values_to = "value")

# Create a tidy data set with the average of each variable for each activity and 
# each subject here:
tidy_summary = tidy_data %>%
  group_by(subject, activity_label, measurement_type) %>%
  dplyr::summarise(
    avg_val = mean(value)
  )

write.table(tidy_summary, paste0(getwd(), "/tidy_summary.txt"), row.names = FALSE)