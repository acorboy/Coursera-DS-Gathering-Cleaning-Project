# Coursera-DS-Gathering-Cleaning-Project

## The following are the variables in ObservationsSummary.txt produced by run_analysis.R.

The original study and data referenced can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
- Additional details for each metric can be found in the features_info.txt

### Key Variables

Subject
- Description - Subject Id from original data set 
- Units - Integer used as an Identifier

ActivityName
- Description - Descriptive name for the activities in the original study

### For each of the remaining variables, the mean of the original variable from the original study was taken with the data grouped by Subject, ActivityName.
- For all metrics prefixed with "t", the units are time
- For all metrics prefixed with "f", the units are frequency
- For all metrics prefixed with "Angle", the units are angle

* tBodyAcc Mean X Axis
* tBodyAcc Mean Y Axis
* tBodyAcc Mean Z Axis
* tBodyAcc STD X Axis
* tBodyAcc STD Y Axis
* tBodyAcc STD Z Axis
* tGravityAcc Mean X Axis
* tGravityAcc Mean Y Axis
* tGravityAcc Mean Z Axis
* tGravityAcc STD X Axis
* tGravityAcc STD Y Axis
* tGravityAcc STD Z Axis
* tBodyAccJerk Mean X Axis
* tBodyAccJerk Mean Y Axis
* tBodyAccJerk Mean Z Axis
* tBodyAccJerk STD X Axis
* tBodyAccJerk STD Y Axis
* tBodyAccJerk STD Z Axis
* tBodyGyro Mean X Axis
* tBodyGyro Mean Y Axis
* tBodyGyro Mean Z Axis
* tBodyGyro STD X Axis
* tBodyGyro STD Y Axis
* tBodyGyro STD Z Axis
* tBodyGyroJerk Mean X Axis
* tBodyGyroJerk Mean Y Axis
* tBodyGyroJerk Mean Z Axis
* tBodyGyroJerk STD X Axis
* tBodyGyroJerk STD Y Axis
* tBodyGyroJerk STD Z Axis
* tBodyAccMag Mean
* tBodyAccMag STD
* tGravityAccMag Mean
* tGravityAccMag STD
* tBodyAccJerkMag Mean
* tBodyAccJerkMag STD
* tBodyGyroMag Mean
* tBodyGyroMag STD
* tBodyGyroJerkMag Mean
* tBodyGyroJerkMag STD
* fBodyAcc Mean X Axis
* fBodyAcc Mean Y Axis
* fBodyAcc Mean Z Axis
* fBodyAcc STD X Axis
* fBodyAcc STD Y Axis
* fBodyAcc STD Z Axis
* fBodyAcc MeanFreq X Axis
* fBodyAcc MeanFreq Y Axis
* fBodyAcc MeanFreq Z Axis
* fBodyAccJerk Mean X Axis
* fBodyAccJerk Mean Y Axis
* fBodyAccJerk Mean Z Axis
* fBodyAccJerk STD X Axis
* fBodyAccJerk STD Y Axis
* fBodyAccJerk STD Z Axis
* fBodyAccJerk MeanFreq X Axis
* fBodyAccJerk MeanFreq Y Axis
* fBodyAccJerk MeanFreq Z Axis
* fBodyGyro Mean X Axis
* fBodyGyro Mean Y Axis
* fBodyGyro Mean Z Axis
* fBodyGyro STD X Axis
* fBodyGyro STD Y Axis
* fBodyGyro STD Z Axis
* fBodyGyro MeanFreq X Axis
* fBodyGyro MeanFreq Y Axis
* fBodyGyro MeanFreq Z Axis
* fBodyAccMag Mean
* fBodyAccMag STD
* fBodyAccMag MeanFreq
* fBodyBodyAccJerkMag Mean
* fBodyBodyAccJerkMag STD
* fBodyBodyAccJerkMag MeanFreq
* fBodyBodyGyroMag Mean
* fBodyBodyGyroMag STD
* fBodyBodyGyroMag MeanFreq
* fBodyBodyGyroJerkMag Mean
* fBodyBodyGyroJerkMag STD
* fBodyBodyGyroJerkMag MeanFreq
* Angle tBodyAccMean Gravity
* Angle tBodyAccJerkMean GravityMean
* Angle tBodyGyroMean GravityMean
* Angle tBodyGyroJerkMean GravityMean
* Angle X GravityMean
* Angle Y GravityMean
* Angle Z GravityMean