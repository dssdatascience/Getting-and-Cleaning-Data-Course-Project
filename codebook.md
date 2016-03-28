---
title: "Assignment: Getting and Cleaning Data Course Project"
author: "Doug Sparling"
date: "27 March, 2016"
output:
  html_document:
    keep_md: yes
---

## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

##Study design and data processing

###Collection of the raw data
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]()

###Notes on the original (raw) data 
Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
	
Data available here: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]()

##Creating the tidy datafile

###Guide to create the tidy data file

1. Download data file.
2. Merge the training and the test sets to create one data set.
3. Extract only the measurements on the mean and standard deviation for each measurement.
4. Use descriptive activity names to name the activities in the data set
5. Appropriately label the data set with descriptive variable names.
6. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

###Cleaning of the data
1. Merge training and test sets - Merge corresponding training and test data frames into intermidiate data frames. Set column names using provided data in features.txt. Merge intermediate data frames into a master data frame.
2. Extract mean and standard deviation variables - Extact columns that contain mean or std in their name.
3. Use descriptive activity names - Add descriptive activity names using provided fileactivity_labels.txt to name the activities in the data set.
4. Label variables appropriately - Use gsub to make human readable labels, e.g., change "-freq()" to "Frequency."
5. Create a tidy data set - Create tidy data set with the average of each variable for each activity and each subject using write.table function.

##Description of the variables in the tidy.txt file

###Subject
###Activity
###TimeBodyAccelerometerMean()-X
###TimeBodyAccelerometerMean()-Y
###TimeBodyAccelerometerMean()-Z 
###TimeBodyAccelerometerSTD()-X 
###TimeBodyAccelerometerSTD()-Y 
###TimeBodyAccelerometerSTD()-Z 
###TimeGravityAccelerometerMean()-X 
###TimeGravityAccelerometerMean()-Y 
###TimeGravityAccelerometerMean()-Z 
###TimeGravityAccelerometerSTD()-X 
###TimeGravityAccelerometerSTD()-Y 
###TimeGravityAccelerometerSTD()-Z 
###TimeBodyAccelerometerJerkMean()-X 
###TimeBodyAccelerometerJerkMean()-Y 
###TimeBodyAccelerometerJerkMean()-Z 
###TimeBodyAccelerometerJerkSTD()-X 
###TimeBodyAccelerometerJerkSTD()-Y 
###TimeBodyAccelerometerJerkSTD()-Z 
###TimeBodyGyroscopeMean()-X 
###TimeBodyGyroscopeMean()-Y 
###TimeBodyGyroscopeMean()-Z 
###TimeBodyGyroscopeSTD()-X 
###TimeBodyGyroscopeSTD()-Y 
###TimeBodyGyroscopeSTD()-Z 
###TimeBodyGyroscopeJerkMean()-X 
###TimeBodyGyroscopeJerkMean()-Y 
###TimeBodyGyroscopeJerkMean()-Z
###TimeBodyGyroscopeJerkSTD()-X 
###TimeBodyGyroscopeJerkSTD()-Y 
###TimeBodyGyroscopeJerkSTD()-Z 
###TimeBodyAccelerometerMagnitudeMean() 
###TimeBodyAccelerometerMagnitudeSTD() 
###TimeGravityAccelerometerMagnitudeMean() 
###TimeGravityAccelerometerMagnitudeSTD() 
###TimeBodyAccelerometerJerkMagnitudeMean() 
###TimeBodyAccelerometerJerkMagnitudeSTD() 
###TimeBodyGyroscopeMagnitudeMean() 
###TimeBodyGyroscopeMagnitudeSTD() 
###TimeBodyGyroscopeJerkMagnitudeMean() 
###TimeBodyGyroscopeJerkMagnitudeSTD() 
###FrequencyBodyAccelerometerMean()-X 
###FrequencyBodyAccelerometerMean()-Y 
###FrequencyBodyAccelerometerMean()-Z 
###FrequencyBodyAccelerometerSTD()-X 
###FrequencyBodyAccelerometerSTD()-Y 
###FrequencyBodyAccelerometerSTD()-Z 
###FrequencyBodyAccelerometerJerkMean()-X 
###FrequencyBodyAccelerometerJerkMean()-Y 
###FrequencyBodyAccelerometerJerkMean()-Z 
###FrequencyBodyAccelerometerJerkSTD()-X 
###FrequencyBodyAccelerometerJerkSTD()-Y 
###FrequencyBodyAccelerometerJerkSTD()-Z 
###FrequencyBodyGyroscopeMean()-X 
###FrequencyBodyGyroscopeMean()-Y 
###FrequencyBodyGyroscopeMean()-Z 
###FrequencyBodyGyroscopeSTD()-X 
###FrequencyBodyGyroscopeSTD()-Y 
###FrequencyBodyGyroscopeSTD()-Z 
###FrequencyBodyAccelerometerMagnitudeMean() 
###FrequencyBodyAccelerometerMagnitudeSTD() 
###FrequencyBodyAccelerometerJerkMagnitudeMean() 
###FrequencyBodyAccelerometerJerkMagnitudeSTD() 
###FrequencyBodyGyroscopeMagnitudeMean() 
###FrequencyBodyGyroscopeMagnitudeSTD() 
###FrequencyBodyGyroscopeJerkMagnitudeMean() 
###FrequencyBodyGyroscopeJerkMagnitudeSTD()
