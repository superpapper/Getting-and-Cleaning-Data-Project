Tidy data for smartphone sensors
===================================
###How to use the script
-download the run_analysis.R and download_file.R to your working directory  
-run the download_file.R and it will downlaod the original data to ./data folder in your working directory  
-unzip the downloaded file in the ./data folder  
-run the run_analysis.R and it will create the "tidydata.txt" file in the ./data folder with mean and std measurement only. 

### Introduction
One of the most exciting areas in all of data science right now is wearable computing. The data we study here was collected from the accelerometers from the Samsung Galaxy S smartphone. The data was taken from a study conducted by Jorge L. et al. called ["Human Activity Recognition Using Smartphones Dataset"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The link to the data is [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).The data is processed here to create a tidy data set with mean and std measurments only.

### Raw data
Their data was obtained from an experiment carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

Original data zip file has the following data files:  
- subject_test.txt: the participant number (1-30) for the test set  
- y_test.txt: the activity number (1-6) for the test set  
- x_test.txt: the sensor captured information (1-531) for the test set  
- subject_training.txt:  the participant number (1-30) for the training set  
- y_training.txt:  the activity number (1-6) for the training set  
- x_trainingt.txt:  the sensor captured information (1-531) for the training set    
- features.txt: the descriptive names of the sensor captured information  
- activity_labels: the mapping the activity number to descriptive activity names   

For more information please refer to the the README.txt and features_info.txt in the original data zip file.
 
### Data Processing
The data was processed to produced a tidy data set that contains measurement on mean and std only:  
1.The eight txt data files were read into the R with read.table function.  
2.Clean up the names in features.txt:  
  a. remove "()"  
  b. replace "-" with "."  
3.select only names contain "mean" or "std" in the features  
4.use the new feature name list to select the desired column for the traing and test data set  
5.then the new train and test data set variable names are rename with the new features names  
6.rename participant and activity data with descriptive names  
7.add descriptive names for activity data next to activity name according to the mapping from activity_lable  
8.column combine participant and activity data with train and test data  
9.row combine the train and test data  
10. calculate the mean for each data variable according to different participant and activities with aggregate function.  
11.clean up final data names and output to "tidydata.txt"  




