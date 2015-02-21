## 1. Merges the training and the test sets to create one data set

#read data sets
library(data.table)

X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")

X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")

features<-read.table("./UCI HAR Dataset/features.txt")
features <- as.character(features[,2])

subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")

# combine trainning sets and test sets respectively.
# then combine those two data sets
train_dt<-cbind(X_train,subject_train,y_train)
test_dt<-cbind(X_test,subject_test,y_test)
Data <- rbind(train_dt, test_dt)

# set the names of columns
colNames<- c(features,"Subject", "Activity")
setnames(Data, colNames)

## 2. Extracts only the measurements on the mean and standard 
## deviation for each measurement. 

# take names including "mean()" or "std()"
subsetNames<-features[grep("mean\\(\\)|std\\(\\)",features)]
subsetNames <- c(subsetNames, "Subject", "Activity")

# extract data
subData <- subset(Data,select=subsetNames)

## 3. Uses descriptive activity names to name the activities in the data set

#read activity names
activityLabels<-read.table("./UCI HAR Dataset/activity_labels.txt")

# factorize names
subData$Activity <- factor(subData$Activity, activityLabels$V1, labels=activityLabels$V2)


## 4. Appropriately labels the data set with descriptive variable names. 

# replace 
# prefix t by time,  prefix f by frequency, Acc by Accelerometer
# Gyro by Gyroscope, Mag by Magnitude, and BodyBody by Body

names(subData)<-gsub("^t", "time", names(subData))
names(subData)<-gsub("^f", "frequency", names(subData))
names(subData)<-gsub("Acc", "Accelerometer", names(subData))
names(subData)<-gsub("Gyro", "Gyroscope", names(subData))
names(subData)<-gsub("Mag", "Magnitude", names(subData))
names(subData)<-gsub("BodyBody", "Body", names(subData))


## 5. From the data set in step 4, creates a second, 
## independent tidy data set with the average of each variable 
## for each activity and each subject.

library(plyr)

Data2 <- aggregate(.~Subject + Activity, subData, mean)

# order by Subject and then by Activity
Data2 <- Data2[order(Data2$Subject, Data2$Activity),]

# wirte a text file
write.table(Data2, file="tidydata.txt", row.name=FALSE)

