# getting_cleaning_data_project

This repository is for the course project for the Getting and Cleaning Data Course.

The data set is used for the project :
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Files
run_analysis.R :
- This can be run as long as the unzipped data is in your working directory 
- This R script does the following : 
\ \ \ 1. Merges the training and the test sets to create one data set.
\ \ \ 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
\ \ \ 3. Uses descriptive activity names to name the activities in the data set
\ \ \ 3. Appropriately labels the data set with descriptive variable names. 
\ \ \ 5. From the data set in step 4, creates a second, independent tidy data set with the average of ea\ \ \ ch variable for each activity and each subject.
- The output of this R script is tidydata.txt