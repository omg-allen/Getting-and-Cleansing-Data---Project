##
## Student: Al Shain
## Email: al_shain@me.com
## Course Project Assignment: Getting and Cleaning Data 
## Description: 
## The purpose of this project is to demonstrate your ability to collect, work
## with, and clean a data set. The goal is to prepare tidy data that can be used
## for later analysis. You will be graded by your peers on a series of yes/no
## questions related to the project. You will be required to submit: 1) a tidy
## data set as described below, 2) a link to a Github repository with your
## script for performing the analysis, and 3) a code book that describes the
## variables, the data, and any transformations or work that you performed to
## clean up the data called CodeBook.md. You should also include a README.md in
## the repo with your scripts. This repo explains how all of the scripts work
## and how they are connected.
## 
## One of the most exciting areas in all of data science right now is wearable
## computing - see for example this article . Companies like Fitbit, Nike, and
## Jawbone Up are racing to develop the most advanced algorithms to attract new
## users. The data linked to from the course website represent data collected
## from the accelerometers from the Samsung Galaxy S smartphone. A full
## description is available at the site where the data was obtained:
##   
##   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
## 
## Here are the data for the project: 
##   
##   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
##

## set workding directory to project
setwd("~/Desktop/Coursera/GettingAndCleansingData/Project")

## make sure the library "reshape2" is loaded
library(reshape2)

## set the download, URL, and unzip file name
downloadFile <- "data/getdata_dataset.zip"

## download and unzip the filename
downloadURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## set variables for URL, file and download locations
trainXFile <- "./data/UCI HAR Dataset/train/X_train.txt"
trainLabels <- "./data/UCI HAR Dataset/train/y_train.txt"
trainSubjectFile <- ".data/UCI HAR Dataset/train/subject_train.txt"
testXFile <- "./data/UCI HAR Dataset/test/X_test.txt"
testLabels <- "./data/UCI HAR Dataset/test/y_test.txt"
testSubjectFile <- ".data/UCI HAR Dataset/test/subject_test.txt"

## test for data foloder and zip file, if NOT found create
if(!file.exists("./data")) { dir.create("./data")}
if (!file.exists(downloadFile)) {
  download.file(downloadURL, downloadFile, method = "curl");
  unzip(downloadFile, overwrite = T, exdir = ".")
}

## Load activity labels - Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("./data/UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

## Extract only the data on mean and standard deviation
featuresWanted <- grep(".*mean.*|.*std.*", features[,2])
featuresWanted.names <- features[featuresWanted,2]
featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)

## Load the data sets
train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")[featuresWanted]
trainActivities <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)
test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")[featuresWanted]
testActivities <- read.table("./data/UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

## merge train and test data sets and add thier labels
combinedData <- rbind(train, test)
colnames(combinedData) <- c("subject", "activity", featuresWanted.names)

## turn activities & subjects into factors
combinedData$activity <- factor(combinedData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
combinedData$subject <- as.factor(combinedData$subject)
combinedData.melted <- melt(combinedData, id = c("subject", "activity"))
combinedData.mean <- dcast(combinedData.melted, subject + activity ~ variable, mean)

## Write out the tidy data set
write.table(combinedData.mean, "tidy.txt", row.names=FALSE, quote=FALSE)







