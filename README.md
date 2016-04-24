# Coursera-DS-Gathering-Cleaning-Project
## Repo for the course project for Gathering and Cleaning Data in the Data Science Specialization

###Summary Analysis of the Human Activity Recognition Using Smartphones Dataset
V 1.0
Andrew Corboy
acorboy@gmail.com

### Study Design
   The goal of this study is to create summary information on the UCI Machine Learning Repository's
Human Activity Recognition Using Smartphones Data Set.  

 Data Source  
	Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
	Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
	International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

 Details of UCI's study design can be found at:
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Requires dyplr	

1. Load files

	Assume zip file was extracted in working directory
	Assume zip file folder structure was kept			
	
	- Load column names from features.txt into vector for use in reading the train and test data files
	
	Train Data
	- Load subject from subject_train.txt with column name "Subject" 
	- Load the raw data from X_train.txt use the names from features.txt as the column names
	- Load the activity data from y_train.txt with the column name "ActivityNum"
		- Set descriptive Activity names based on the ActivityNum column
			- 1 WALKING
			- 2 WALKING_UPSTAIRS
			- 3 WALKING_DOWNSTAIRS
			- 4 SITTING
			- 5 STANDING
			- 6 LAYING
	
	Test
	- Load subject from subject_test.txt with column name "Subject"
	- Load the raw data from X_test.txt use the names from features.txt as the column names
	- Load the activity data from y_test.txt with the column name "ActivityNum"
		- Set descriptive Activity names based on the ActivityNum column
			- 1 WALKING
			- 2 WALKING_UPSTAIRS
			- 3 WALKING_DOWNSTAIRS
			- 4 SITTING
			- 5 STANDING
			- 6 LAYING

2. Create one data set with only the desired columns

	Select ONLY the variables representing the means and std dev columns from Test and Train
	- grep for "std" or "mean" from the list of column names
	- use the grep result to subset the data

	Merge the subjects, raw data, and activities into a single data set for train and then test

	Merge the train and test sets into a single observations set

	Arrange data set by Subject and the Activity Name
	
3. Clean Column Names
	
	Remove variable number prefix
	- Example = X294.fBodyAcc.meanFreq...X to fBodyAcc.meanFreq...X

	Clean up the period between the metric name and the calcuation
	- Example = fBodyAcc.meanFreq...X to fBodyAcc MeanFreq...X

	Clean up and add "axis" reference
	- Example = fBodyAcc MeanFreq...X to fBodyAcc MeanFreq X axis

	Clean up Angle Variables
	- Remove periods after angle and before gravity	
	- Example = angle.tBodyAccJerkMean..gravityMean to Angle tBodyAccJerkMean GravityMean

	General issues 
	- Remove any number of "." from the end of variable names

	Override observations variable names with cleaned names
	
4. Summarize and export

	Create a new tidy data set with the average of each variable for each activity and each subject
	- Group by Subject, Activity
	- Use the dplyr function summarize_each to call mean for each variable

	Write out the final observationSummary using write.table 
	

	
	


		