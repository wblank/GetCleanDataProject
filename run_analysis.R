# Getting and Cleaning Data Course Project
# 
# 

# Reading datasets, subject & activity vectors, and feature names
setwd("UCI HAR Dataset")

trainData <- read.table("train\\X_train.txt")  
trainSubjects <- read.table("train\\subject_train.txt")
trainActivities <- read.table("train\\y_train.txt")

testData <- read.table("test\\X_test.txt")
testSubjects <- read.table("test\\subject_test.txt")
testActivities <- read.table("test\\y_test.txt")

featureNames <- read.table("features.txt")
activityLabels <- read.table("activity_labels.txt")

# Assigning names to columns
names(trainData) <- featureNames[, 2]  # 2nd column of featureNames as header
names(testData) <- featureNames[, 2]

names(trainSubjects) <- "subject"
names(trainActivities) <- "activity"

names(testSubjects) <- "subject"
names(testActivities) <- "activity"


## Merge the training and the test sets to create one data set. 

mergedTrainData <- cbind(trainSubjects, trainActivities, trainData) 
dim(mergedTrainData)
head(mergedTrainData[, 1:6])  # confirm dimensions & colnames of merged data

mergedTestData <- cbind(testSubjects, testActivities, testData)
dim(mergedTestData)
tail(mergedTestData[, 1:6])

mergedData <- rbind(mergedTrainData,mergedTestData)
dim(mergedData)
head(mergedData[, 1:6])
tail(mergedData[, 1:6])  # confirm data merged in expected order

## Extract only the measurements on the mean and standard deviation for each 
## measurement.
# [Along with subject & activity IDs]
# Do this using logical grep with regular expression for "'subj' or 'activ' 
# or 'mean(' or 'std('" 

wantedColumns <- (grepl(("subj|activ|mean\\(|std\\("),names(mergedData)))

# count how many columns to expect
sum(wantedColumns)

# select TRUE columns into new data frame
extractedData <- mergedData[wantedColumns==TRUE]

summary(extractedData)
names(extractedData)
dim(extractedData)

## Use descriptive activity names to name the activities in the data set

head(extractedData$activity)
class(extractedData$activity)  # currently integers

# First add 3rd column of camelCase activity names to activityLabels dataframe
V3 <- c("walking", "walkingUp", "walkingDown", "sitting", 
        "standing", "laying")
activityLabelsFixed <- cbind(activityLabels, V3)

# Replace integers in $activity with string in corresponding row of 
# activityLabelsFixed
# Labels coerced as character vector; otherwise confusion of factor levels

for(i in seq_along(extractedData$activity)) {
  extractedData$activity[i] <- as.character(activityLabelsFixed
                                            [(extractedData$activity[i]), 3])
}  

head(extractedData$activity)
class(extractedData$activity)  # now character

# coerce into factors
extractedData$activity <- as.factor(extractedData$activity)  

head(extractedData$activity)

## Appropriately label the data set with descriptive variable names in 
## camelCase.

# Store names in a vector, create a substitution matrix containing regex 
# patterns and replacements, loop through matrix to make substitutions, rename
# columns with changed vector.


englishNames <- names(extractedData)
pattern <- c("^t", "^f", "Acc", "Gyro", "BodyBody", "Mag", "mean", "std", 
             "-|\\()")
replacement <- c("time", "freq", "Accelerometer", "Gyroscope", "Body", 
                 "Magnitude", "Mean", "StDev", "")

subMatrix <- cbind(pattern, replacement)
subMatrix

for(i in 1:nrow(subMatrix)) {
  englishNames <- gsub(subMatrix[i, 1], subMatrix[i, 2], englishNames)
}

# Write names to file for codebook and rename columns in extractedData
write.table(englishNames, "Renamed_Column_Headings.txt", row.names = FALSE)
names(extractedData) <- englishNames

## From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

# Do this using ddply function of plyr library, using columnwise mean as the
# function.

library("plyr")
tidyData <- ddply(extractedData, .(subject, activity), numcolwise(mean))
head(tidyData[, 1:5], 15)
View(tidyData)

# Looks good.  Write it to a file.
write.table(tidyData, "Tidied_HAR_Dataset.txt", row.names = FALSE)


