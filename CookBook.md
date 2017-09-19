# CleaningDataProject - Data CookBook

###The output of the run_analysis.R script is a file called tidyDataAverages.txt
that has the following fields :

* subject : the individual the data was measured on (1-30)
* activity : the activity the data was recorded from (STANDING, SITTING, LAYING,
WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)
* averages : the mean of the measurements per subject and activity.  The data is 
described in the file features_info.txt

### The data was calculated by adding the subject and activity labels to the both
the test and train data and then combining the test and train data sets into one.
Next, names were added to the columns from the features.txt file.  The columns 
for subject, activity, standard deviation (std) and mean for each measurement 
were extracted.  The labels found in activity_labels.txt was then used to match 
descriptive labels for each activity.  Finally, each measurement column was
averaged per subject and activity and then the resultant data set was written to
the file "tidyDataAverages.txt".