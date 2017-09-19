## load the necessary library
library(plyr)

## Read in test data
testData <- read.table( "test/X_test.txt" )
testSubjects <- read.table( "test/subject_test.txt" )
testActivities<- read.table( "test/y_test.txt" )

## add the activity and the subject to the test data
fullTest <- cbind( testSubjects, testActivities, testData )

## Read in training data
trainData <- read.table( "train/X_train.txt" )
trainSubjects <- read.table( "train/subject_train.txt" )
trainActivities<- read.table( "train/y_train.txt" )

## add the activity and the subject to the train data
fullTrain <- cbind( trainSubjects, trainActivities, trainData )

## merge the data sets
mergedData <- rbind( fullTest, fullTrain )

## update the columns to meaningful descriptions 
## first, read in the features file and then set table names
featureNames <- read.table( "features.txt", stringsAsFactors = F )
colnames( mergedData ) <- c( "subject", "activity", featureNames[,2] )

## get the numbers for the columns that are std or mean
colPositions <- grep( "(subject|activity|std|mean[(])", colnames( mergedData ) )

## extract those columns from the merged data frame
extractedData <- mergedData[,colPositions]

## data frame for the activity labels
activityLabels<- read.table( "activity_labels.txt", stringsAsFactors = F )
colnames(activityLabels) <- c("id", "activity")

## replace activity numbers with descriptive identifiers
## this is the final, tidy data set
extractedData$activity <- activityLabels$activity[ match( extractedData$activity, activityLabels$id ) ]

## do not write the intermediate file to disk
##write.table( extractedData, "tidyData.txt")

## use ddply to split the data by subject and activity and then average all numerical columns
avgDF <- ddply( extractedData,.(subject, activity), numcolwise(mean) )

## write to disk
write.table( avgDF, "tidyDataAverages.txt", row.names = F )
