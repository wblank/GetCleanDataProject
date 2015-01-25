***
# Getting and Cleaning Data Course Project
## Tidying and averaging a subset of the Human Activity Recognition Using Smartphones Data Set
***

This project makes use of the Human Activity Recognition Using Smartphones Data Set found at <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> 

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.

Useful guidance on strategies for completing this project was given in a [course forum thread](https://class.coursera.org/getdata-010/forum/thread?thread_id=49) established by Community TA David Hood. 

The `run_analysis.R` code is intended to be run from the user's working directory, which also contains a folder called "UCI HAR Dataset" including all data files to be used in this project.

The following sections describe the actions taken by my code as specified by the project instructions.  Additional information may also be found in the code comments.

### Merge the training and the test sets to create one data set.

Working directory is set to "UCI HAR Dataset" and the files containing training & test data along with subject & activity IDs as well as feature & activity names are read.

Descriptive names are assigned to subject & activity vectors, and the second column of the featureName object is used to name columns of the data sets.

Subject, activity, & data are merged separately for training & test using `cbind`, then the two sets are merged with `rbind`. 
    
### Extract only the measurements on the mean and standard deviation for each measurement. 

Other than the **`subject`** and **`activity`** vectors, only those features containing measurement mean or standard deviation values i.e. those containing `mean()` or `std()` in the feature vector name were selected.  `meanFreq()` variables, which are a weighted average of frequency components and `angle` variables (containing "Mean" in their names) were not included. 

I used the logical grep function `grepl` to search for regular expressions for 'subj' or 'activ' or 'mean(' or 'std('

`grepl(("subj|activ|mean\\(|std\\("),names(mergedData))==TRUE`

and used the logical vector to extract the desired 68 columns from the full dataset to an object called **`extractedData`**. 

### Use descriptive activity names to name the activities in the data set

It's important not to simply use the integer value from the **`extractedData$activity`** column of the dataset to draw the activity name from column 2 of **`activityLabels`**, since they are classed as factors and therefore numbered by alphabetical order rather than row number in the table.  Instead I added a 3rd column of descriptive names to **`activityLabels`**, then replaced the integers in **`extractedData$activity`** with the corresponding string.  That column was subsequently coerced as factors.


### Appropriately label the data set with descriptive variable names. 

Names from **`extractedData`** were stored in a vector.  I created the following substitution matrix containing regex patterns and replacements

      pattern    replacement    
 [1,] "^t"       "time"         
 [2,] "^f"       "freq"         
 [3,] "Acc"      "Accelerometer"
 [4,] "Gyro"     "Gyroscope"    
 [5,] "BodyBody" "Body"         
 [6,] "Mag"      "Magnitude"    
 [7,] "mean"     "Mean"         
 [8,] "std"      "StDev"        
 [9,] "-|\\()"   ""             

A for loop through this matrix using `gsub` made the substitutions in the name vector, and the result was used to rename **`extractedData`** .

### From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

This is easily done with a single `ddply` function from the **`plyr`** library, applying the `mean` function columnwise by **`subject`** & **`activity`**.

`tidyData <- ddply(extractedData, .(subject, activity), numcolwise(mean))`

The resulting dataframe is a "Narrow" form of tidy data as described by Hadley Wickham at <http://vita.had.co.nz/papers/tidy-data.pdf>, with the feature averages for each of the 6 activities given in a separate row for each individual subject, resulting in a table 68 columns wide with 180 rows of data.

The tidied data was then written out to a text file & uploaded to the Coursera site.
