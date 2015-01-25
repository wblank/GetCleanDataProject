***
# Codebook - Getting and Cleaning Data Course Project
***

The purpose of this project is to select a subset of the Human Activity Recognition Using Smartphones Data Set found at <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> 

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 

and to summarize the selected data in a tidy format following the principles outlined by Hadley Wickham at <http://vita.had.co.nz/papers/tidy-data.pdf>.

A description of the data collection and the full range of data features is at the [HAR website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and in the datafiles accessible there.

Details on the merging and processing of the datasets for this project, as well as why particular features were selected, are given in the README.md file also found in this GitHub repo.

## Description of Variables

The final tidied datafile `tidyData.txt` contains means for all selected features averaged by subject for each activity.

***

* **`subject`** 

> ID of the subjects, ranging from 1 to 30, from whom data was collected.  Class: Integer.

***

* **`activity`** 

> 6 activities which were observed for data collection: walking, walkingUpstairs, walkingDownstairs, sitting, standing, laying.  Class: Factor.

***

The remaining variables are the data features which were selected from the full dataset, representing means and standard deviations (named **`Mean`** and **`StDev`**, respectively).  All raw values were normalized and scaled between -1 and 1 by the study authors, therefore no units are given.  The features were renamed with readable English camelCase names without illegal characters.  Class: Numeric.  Note: the following description of the features is edited from the file `features_info.txt` in the [HAR data zip file](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip).
***
* **`timeBodyAccelerometerMeanX`**
* **`timeBodyAccelerometerMeanY`**
* **`timeBodyAccelerometerMeanZ`**
* **`timeBodyAccelerometerStDevX`**
* **`timeBodyAccelerometerStDevY`**
* **`timeBodyAccelerometerStDevZ`**
* **`timeGravityAccelerometerMeanX`**
* **`timeGravityAccelerometerMeanY`**
* **`timeGravityAccelerometerMeanZ`**
* **`timeGravityAccelerometerStDevX`**
* **`timeGravityAccelerometerStDevY`**
* **`timeGravityAccelerometerStDevZ`**

> Accelerometer 3-axial signals in the time domain were separated into body and gravity acceleration signals **`timeBodyAccelerometer`** and **`timeGravityAccelerometer`** in the **`X`**, **`Y`**, and **`Z`** axes.

***

* **`timeBodyAccelerometerJerkMeanX`**
* **`timeBodyAccelerometerJerkMeanY`**
* **`timeBodyAccelerometerJerkMeanZ`**
* **`timeBodyAccelerometerJerkStDevX`**
* **`timeBodyAccelerometerJerkStDevY`**
* **`timeBodyAccelerometerJerkStDevZ`**

> Body linear acceleration was derived in time to obtain Jerk signals **`timeBodyAccelerometerJerk`** in the **`X`**, **`Y`**, and **`Z`** axes. 

***

* **`timeBodyGyroscopeMeanX`**
* **`timeBodyGyroscopeMeanY`**
* **`timeBodyGyroscopeMeanZ`**
* **`timeBodyGyroscopeStDevX`**
* **`timeBodyGyroscopeStDevY`**
* **`timeBodyGyroscopeStDevZ`**

> Gyrometer 3-axial signals in the time domain gave body angular velocity **`timeBodyGyroscope`** in the **`X`**, **`Y`**, and **`Z`** axes.

***

* **`timeBodyGyroscopeJerkMeanX`**
* **`timeBodyGyroscopeJerkMeanY`**
* **`timeBodyGyroscopeJerkMeanZ`**
* **`timeBodyGyroscopeJerkStDevX`**
* **`timeBodyGyroscopeJerkStDevY`**
* **`timeBodyGyroscopeJerkStDevZ`**

> Body angular velocity was derived in time to obtain Jerk signals **`timeBodyGyroscopeJerk`** in the **`X`**, **`Y`**, and **`Z`** axes. 

***

* **`timeBodyAccelerometerMagnitudeMean`**
* **`timeBodyAccelerometerMagnitudeStDev`**
* **`timeGravityAccelerometerMagnitudeMean`**
* **`timeGravityAccelerometerMagnitudeStDev`**
* **`timeBodyAccelerometerJerkMagnitudeMean`**
* **`timeBodyAccelerometerJerkMagnitudeStDev`**
* **`timeBodyGyroscopeMagnitudeMean`**
* **`timeBodyGyroscopeMagnitudeStDev`**
* **`timeBodyGyroscopeJerkMagnitudeMean`**
* **`timeBodyGyroscopeJerkMagnitudeStDev`**

> The **`Magnitude`** of the previously described three-dimensional signals was calculated using the Euclidean norm. 

***

* **`freqBodyAccelerometerMeanX`**
* **`freqBodyAccelerometerMeanY`**
* **`freqBodyAccelerometerMeanZ`**
* **`freqBodyAccelerometerStDevX`**
* **`freqBodyAccelerometerStDevY`**
* **`freqBodyAccelerometerStDevZ`**
* **`freqBodyAccelerometerJerkMeanX`**
* **`freqBodyAccelerometerJerkMeanY`**
* **`freqBodyAccelerometerJerkMeanZ`**
* **`freqBodyAccelerometerJerkStDevX`**
* **`freqBodyAccelerometerJerkStDevY`**
* **`freqBodyAccelerometerJerkStDevZ`**
* **`freqBodyGyroscopeMeanX`**
* **`freqBodyGyroscopeMeanY`**
* **`freqBodyGyroscopeMeanZ`**
* **`freqBodyGyroscopeStDevX`**
* **`freqBodyGyroscopeStDevY`**
* **`freqBodyGyroscopeStDevZ`**
* **`freqBodyAccelerometerMagnitudeMean`**
* **`freqBodyAccelerometerMagnitudeStDev`**
* **`freqBodyAccelerometerJerkMagnitudeMean`**
* **`freqBodyAccelerometerJerkMagnitudeStDev`**
* **`freqBodyGyroscopeMagnitudeMean`**
* **`freqBodyGyroscopeMagnitudeStDev`**
* **`freqBodyGyroscopeJerkMagnitudeMean`**
* **`freqBodyGyroscopeJerkMagnitudeStDev`**

> A Fast Fourier Transform was applied to give a **`freq`**uency domain signal to all of the above features _except_ the **`timeBodyGyroscopeJerk`** axial features and all the **`timeGravityAccelerometer`** features.

***
