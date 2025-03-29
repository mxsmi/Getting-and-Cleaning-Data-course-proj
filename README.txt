# Getting and Cleaning Data course project

This repository contains files for the Getting and Cleaning Data course project. 
The files provided by the course are:

activity_labels.txt
features_info.txt
features.txt
readme_info_for_data.txt (I renamed this one)

and all of the files within the folders test and train.

information about these provided files can be found in readme_info_for_data.txt
and features_info.txt. 

The script that I wrote, and which will be assessed for 
grading, is called "run_analysis.R". This script combines the data provided into
a single data set and does some data manipulation and cleaning to extract the data
of interest and get it into a tidy state. After running the script, there should be 
a dataframe called "tidy_summary" in your environment. This dataframe is a tidy
data set with the average of each variable for each activity and each subject.
