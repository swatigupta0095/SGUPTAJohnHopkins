#######################################################
##CodeBook.MD
## Getting and Cleaning Data Project: Swati Gupta
#######################################################

### Introduction
This project demonstrates the collection and cleaning of a tidy data set that can be used for subsequent analysis for by creation of Reports or Data Mining purposes. A full description of the data used in this project can be found at The UCI Machine Learning Repository , source data for this can be found here:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### Source
source data for this can be found here:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Zip Path: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


### Attributes
For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

#1.Set source directory to the directory C:\Users\Swati\Downloads\getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset, read into tables from this path
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

Assigned column names and merged to create one data set.

#2.Created a logical vector that contains TRUE values for the ID, mean and stdev columns and FALSE values for the others.
Subset this data to keep only the necessary columns.

#3.Merge data subset with the activityType table to cinlude the descriptive activity names

#4.Used gsub function for pattern replacement to clean up the data labels.

#5.Produced a data set with the average of each variable for each activity and subject

