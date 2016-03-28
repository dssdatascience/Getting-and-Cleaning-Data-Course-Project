library(data.table)

# 1. Merges the training and the test sets to create one data set.

# Load the training data into data frames
trainingFeatures <- read.table("./UCI_HAR_Dataset/train/X_train.txt")
trainingActivities <- read.table("./UCI_HAR_Dataset/train/y_train.txt")
trainingSubjects <- read.table("./UCI_HAR_Dataset/train/subject_train.txt")

# Load the test data into data frames
testFeatures <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
testActivities <- read.table("./UCI_HAR_Dataset/test/y_test.txt")
testSubjects <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")

# Merge corresponding training and test data frames 
mergedFeatures <- rbind(trainingFeatures, testFeatures)
mergedActivities <- rbind(trainingActivities, testActivities)
mergedSubjects <- rbind(trainingSubjects, testSubjects)

# Set column names
featureNames <- read.table("./UCI_HAR_Dataset/features.txt")
colnames(mergedFeatures) <- featureNames$V2
colnames(mergedActivities) <- c("Activity")
colnames(mergedSubjects) <- c("Subject")

# Merge the merged training and test data frames into the master data frame
masterData <- cbind(mergedFeatures, mergedActivities, mergedSubjects)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# We only want columns that contain mean or std in their names
# Use grep to get the desired columns from featureNames data set
meanStdCols <- grep("mean\\(\\)|std\\(\\)", featureNames[,2], ignore.case=TRUE)
# Add "Activity" and "Subject" to the filteredCols data frame
filteredCols <- c(meanStdCols,562:563)
# subset masterData
subsettedData <- masterData[,filteredCols]


# 3. Uses descriptive activity names to name the activities in the data set
# Load activity labels into a data frame
activityLabels <- read.table("./UCI_HAR_Dataset/activity_labels.txt")

# Convert int vector to character vector
subsettedData$Activity <- as.character(subsettedData$Activity)
# Set first six elements of vector to activity labels
for(i in 1:6) {
    subsettedData$Activity[subsettedData$Activity == i] <- as.character(activityLabels[,2])[i]
}
# Convert character vector to factor vector
subsettedData$Activity <- as.factor(subsettedData$Activity)

# 4. Appropriately labels the data set with descriptive variable names.

names(subsettedData)<-gsub("-freq()", "Frequency", names(subsettedData), ignore.case = TRUE)
names(subsettedData)<-gsub("-mean()", "Mean", names(subsettedData), ignore.case = TRUE)
names(subsettedData)<-gsub("-std()", "STD", names(subsettedData), ignore.case = TRUE)
names(subsettedData)<-gsub("^f", "Frequency", names(subsettedData))
names(subsettedData)<-gsub("^t", "Time", names(subsettedData))
names(subsettedData)<-gsub("angle", "Angle", names(subsettedData))
names(subsettedData)<-gsub("gravity", "Gravity", names(subsettedData))
names(subsettedData)<-gsub("tBody", "TimeBody", names(subsettedData))
names(subsettedData)<-gsub("Acc", "Accelerometer", names(subsettedData))
names(subsettedData)<-gsub("BodyBody", "Body", names(subsettedData))
names(subsettedData)<-gsub("Gyro", "Gyroscope", names(subsettedData))
names(subsettedData)<-gsub("Mag", "Magnitude", names(subsettedData))


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Convert subsettedData$Subject from integer vector to factor vector
subsettedData$Subject <- as.factor(subsettedData$Subject)
subsettedData <- data.table(subsettedData)

# Tidy
tidyData <- aggregate(. ~Subject+Activity, subsettedData,mean) 
tidyData <- tidyData[order(tidyData$Subject, tidyData$Activity),]
write.table(tidyData, "tidy.txt", row.names = FALSE)
