# CodeBook

This is a code book that describes the variables, the data, and any transformations
or work that  I performed to clean up the data. 


## Original Data Set Info
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The Variables and Data
The "run_analysis.R" script will automatically load the following data : 
- features.txt : List of all variable names in the original data set.

- activity_labels.txt : Links the class labels with their activity name.

- train/X_train.txt : Training set.

- train/y_train.txt : Training labels.

- test/X_test.txt : Test set.

- test/y_test.txt : Test labels.


## Transformations 
run_analysis.R does the following 5 steps :

1. Merges the training and the test sets to create one data set(
X_train, y_train, X_test, y_test, subject_train, subject_test, features, and
activityLavels are loaded data // train_dt : merge of X_train, subject_train, and y_train//
test_dt : merge of X-test, subject_test, and y_test // Data : merge of train_dt and test_dt)

2. Extracts only the measurements on the mean and standard deviation for each measurement( 
subData : extracted data in step 2)

3. Uses descriptive activity names to name the activities in the data set.

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.



