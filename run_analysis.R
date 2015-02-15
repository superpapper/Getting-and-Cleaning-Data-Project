#Getting and Cleaning Data
#Project
#This File process the downlaoded data file to creat a tidy data set with mean and std measurement only.
# Here are the data for the project: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 
# You should create one R script called run_analysis.R that does the following. 
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#library
library(dplyr)
library(plyr)

#read the test data
x_train=read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train=read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train=read.table("./data/UCI HAR Dataset/train/subject_train.txt")

x_test=read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test=read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test=read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#read the activity label and feature
label=read.table("./data/UCI HAR Dataset/activity_labels.txt")
features=read.table("./data/UCI HAR Dataset/features.txt")

#clean up feature names and select features with mean or std only
features$V2 = gsub("\\()", "", features$V2)
features$V2 = gsub("-", ".", features$V2)
features1=features[grep("mean|std",features$V2),]

#select data with selected features only
x_train1=x_train[,features1$V1]
x_test1=x_test[,features1$V1]

#reName data columns with descriptive names 
names(x_train1)=features1$V2
names(x_test1)=features1$V2

#reName subject and y data with descriptive name
names(subject_test)="participant"
names(subject_train)="participant"

#merge the activity data with activity label
train_activity=mutate(y_train,activity=label[V1,2])
train_activity=subset(train_activity,select=activity)
test_activity=mutate(y_test,activity=label[V1,2])
test_activity=subset(test_activity,select=activity)
View(test_activity)
#merge x data with participant and activity data
test=cbind(subject_test,test_activity,x_test1)
train=cbind(subject_train,train_activity,x_train1)

#Merge the test and training dataset
data=rbind(test,train)

#calculate mean per participant and activity
tidy= aggregate(data, list(data$participant, data$activity), mean)

#Clean up data
tidy$participant <- NULL
tidy$activity <- NULL
names(tidy)[1] <- "participant"
names(tidy)[2] <- "activity"
#output file
write.table(file = "./data/tidydata.txt", x = tidy, row.names = FALSE)
