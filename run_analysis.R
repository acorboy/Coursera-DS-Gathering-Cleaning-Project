## run_analysis
## Andrew Corboy
## Version 1.0 4/24/2016

## They dplyr package must be installed prior to executing
## The zip file described in the README.txt must be downloaded
##    and unzipped in the working directory

run_analysis <- function() {
  library(dplyr)
  #######################################################################################
  ## Import data Section
  ## Assumes zip file was extracted in working directory
  ## Assumes zip file folder structure was kept
  
  ## Load column names from features.txt into vector for use in reading the data files
  dir <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/"
  variableNames <- read.delim(paste0(dir, "features.txt"), header = FALSE)
  variableNamesVector <- as.vector(variableNames[,1])
  
  ## Train data
  dirTrain <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/"
  trainSubject <- read.table(paste0(dirTrain,"subject_train.txt")
                           , col.names = c("Subject"))
  
  trainRawData <- read.table(paste0(dirTrain,"X_train.txt")
                           ,sep = "", fileEncoding = "UTF-8"
                           , col.names = variableNamesVector)
  trainActivity <- read.table(paste0(dirTrain,"y_train.txt"), col.names = c("ActivityNum"))
  ## Assign the Activity Names
  trainActivity <- mutate(trainActivity, ActivityName = 
                           ifelse(ActivityNum == 1, "WALKING", ""))
  trainActivity$ActivityName[trainActivity$ActivityNum == 2] <- "WALKING UPSTAIRS"
  trainActivity$ActivityName[trainActivity$ActivityNum == 3] <- "WALKING DOWNSTAIRS"                      
  trainActivity$ActivityName[trainActivity$ActivityNum == 4] <- "SITTING"
  trainActivity$ActivityName[trainActivity$ActivityNum == 5] <- "STANDING"
  trainActivity$ActivityName[trainActivity$ActivityNum == 6] <- "LAYING"
  
  
  ## Test data
  dirTest <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/"
  testSubject <- read.table(paste0(dirTest,"subject_test.txt")
                           , col.names = c("Subject"))
  testRawData <- read.table(paste0(dirTest,"X_test.txt")
                             ,sep = "", fileEncoding = "UTF-8"
                             , col.names = variableNamesVector)
  testActivity <- read.table(paste0(dirTest,"y_test.txt"), col.names = c("ActivityNum"))
  ## Assign the Activity Names
  testActivity <- mutate(testActivity, ActivityName = 
                          ifelse(ActivityNum == 1, "WALKING", ""))
  testActivity$ActivityName[testActivity$ActivityNum == 2] <- "WALKING UPSTAIRS"
  testActivity$ActivityName[testActivity$ActivityNum == 3] <- "WALKING DOWNSTAIRS"                      
  testActivity$ActivityName[testActivity$ActivityNum == 4] <- "SITTING"
  testActivity$ActivityName[testActivity$ActivityNum == 5] <- "STANDING"
  testActivity$ActivityName[testActivity$ActivityNum == 6] <- "LAYING"
                        
  #######################################################################################
  ## Reduce and Merge columns in train and test data sets
  
  ## Get the names of the columns, find which are std (standard deviation) or mean
  ## Subset the data so only the std or mean columns remain
  trainColNames <- names(trainRawData)
  trainInd <- grep("std|[Mm]ean",trainColNames) 
  trainData <- trainRawData[,trainInd]
  
  trainMerged <- mutate(trainData, Subject = trainSubject$Subject
                       , ActivityName = trainActivity$ActivityName)
  
  testColNames <- names(testRawData)
  testInd <- grep("std|[Mm]ean",testColNames) 
  testData <- testRawData[,testInd]
  
  testMerged <- mutate(testData, Subject = testSubject$Subject
                       , ActivityName = testActivity$ActivityName)
  
  ## Merge the test and train sets
  observations <- rbind.data.frame(trainMerged,testMerged)
  ## Sort on Subject and Activity Name
  observations <- arrange(observations, Subject, ActivityName)
  
  #######################################################################################
  ## Clean Variable names
  
  cleanColumnNames <- names(observations)
  
  ## Remove leading column number
  cleanColumnNames <- sub("^X[0-9]{1,3}[.]", "", cleanColumnNames)
  
  ## Clean up the period between the metric name and the calcuation
  cleanColumnNames <- sub("[.]m", " M", cleanColumnNames)
  cleanColumnNames <- sub("[.]std", " STD", cleanColumnNames)
  
  ## Clean up and add "axis" reference
  cleanColumnNames <- sub("[.]{3}X", " X Axis", cleanColumnNames)
  cleanColumnNames <- sub("[.]{3}Y", " Y Axis", cleanColumnNames)
  cleanColumnNames <- sub("[.]{3}Z", " Z Axis", cleanColumnNames)
  
  ##Clean up Angle Variables
  cleanColumnNames <- sub("^angle[.]", "Angle ", cleanColumnNames)
  cleanColumnNames <- sub("[.]+gravity", " Gravity", cleanColumnNames)
  
  ## General Issues
  cleanColumnNames <- sub("[.]+$", "", cleanColumnNames)
  
  ## Override observations variable names with cleaned names
  colnames(observations) <- cleanColumnNames
  
  #######################################################################################
  ## Summarize & Create outpu
  
  ## Create a new tidy data set with the average of each variable for each activity 
  ##  and each subject
  
  ## Group by Subject and Activity
  observationSummary <- observations %>% group_by(Subject, ActivityName) %>% summarize_each(funs(mean))
  
  ## Write out the table
  write.table(observationSummary, "ObservationsSummary.txt", row.name=FALSE)
  
}