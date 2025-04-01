# Getting and Cleaning Data course project

This repository contains files for the Getting and Cleaning Data course project. 
The files provided by the course are:

- all of the files within the test and train folders
- activity_labels.txt
- features_info.txt
- features.txt
- readme_info_for_data.txt (I renamed this one from README.txt, to avoid confusion with
the README.md we had to create for this project)

Information about these provided files can be found in readme_info_for_data.txt
and features_info.txt. 

The script that I wrote, and which will be assessed for grading, is called "run_analysis.R". 
This script combines the test and train data into a single data set and does data manipulation 
and cleaning to extract the data of interest and get it into a tidy state. After running the 
script, there should be a dataframe called "tidy_summary" in your environment. This dataframe 
is a tidy data set with the average of each of the extracted measurements of interest 
(mean and std) for each subject and activity. Note that the data is in a longer format,
which the project instructions say is acceptable. I chose to convert it to a longer format because
the type of measurement being recorded can be thought of as a variable, and one of the 
principles of tidy data is that each variable should have it's own column.

The script also saves the dataframe as a .txt file called "tidy_summary.txt" in the working 
directory of this project. 
