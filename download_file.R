#Getting and Cleaning Data
#Project
# Here are the data for the project: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 
# This file create ./data folder in the working directory and download the zip files there.

#create ./data folder
if(!file.exists("data")){dir.create("data")}

#download file
fileurl="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile="./data/data.zip"
download.file(fileurl,destfile)
datedownloaded=date()