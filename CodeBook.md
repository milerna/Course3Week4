# Dataset description
## Data
The tidy_data.txt data file, which is also placed in the repository, is a text file containing space-separated values.

The first row contains the names of the variables, which are listed and described below in the Variables section; the 180 rows after contain the values of these variables.

## Transformations to the data
The script `run_analysis.R`performs the following transformations to the data, which has been downloaded and unzipped "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

* `x_train`, `y_train`, `x_test`, `y_test`, `sub_train` and `sub_test` contain the data from the downloaded files.
* Files, which have the same number of columns, are merged using the `rbind()` function.
* `x`, `y` and `sub` are the merged the datasets.
* `features` contains the correct names for the `x` dataset.
* `features_mean_std` is a numeric vector and contains the desired columns (mean and std).
* A subset of X is created, which only contains those columns with the mean and standard deviation measures.
* After extracting these columns, they are given the correct names, taken from `features.txt`.
* A similar approach is taken with the activity names through the `activity_labels` variable.
* As activity data is addressed with values 1:6, we take the activity names and IDs from `activity_labels.txt` and substitute them in Y.
* 'x','y' and 'sub' are bind together to data
* Finally, we generate a new dataset 'tidy_data.txt' with all the average measures for each subject and activity type.

## Variables

Each row contains, for a given subject and activity, 79 averaged signal measurements.

### Identifiers
- "subject": subject ID ranging von 1 to 30
- "activity": type of activity 

### Activity column is a string with 6 possible values
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

### Measurements
- "tBodyAcc-mean()-X"
- "tBodyAcc-mean()-Y"
- "tBodyAcc-mean()-Z"
- "tBodyAcc-std()-X"
- "tBodyAcc-std()-Y"
- "tBodyAcc-std()-Z"
- "tGravityAcc-mean()-X"
- "tGravityAcc-mean()-Y"
- "tGravityAcc-mean()-Z"
- "tGravityAcc-std()-X"
- "tGravityAcc-std()-Y"
- "tGravityAcc-std()-Z"
- "tBodyAccJerk-mean()-X"
- "tBodyAccJerk-mean()-Y"
- "tBodyAccJerk-mean()-Z"
- "tBodyAccJerk-std()-X"
- "tBodyAccJerk-std()-Y"
- "tBodyAccJerk-std()-Z"
- "tBodyGyro-mean()-X"
- "tBodyGyro-mean()-Y"
- "tBodyGyro-mean()-Z"
- "tBodyGyro-std()-X"
- "tBodyGyro-std()-Y"
- "tBodyGyro-std()-Z"
- "tBodyGyroJerk-mean()-X"
- "tBodyGyroJerk-mean()-Y"
- "tBodyGyroJerk-mean()-Z"
- "tBodyGyroJerk-std()-X"
- "tBodyGyroJerk-std()-Y"
- "tBodyGyroJerk-std()-Z"
- "tBodyAccMag-mean()"
- "tBodyAccMag-std()"
- "tGravityAccMag-mean()"
- "tGravityAccMag-std()"
- "tBodyAccJerkMag-mean()"
- "tBodyAccJerkMag-std()"
- "tBodyGyroMag-mean()"
- "tBodyGyroMag-std()"
- "tBodyGyroJerkMag-mean()"
- "tBodyGyroJerkMag-std()"
- "fBodyAcc-mean()-X"
- "fBodyAcc-mean()-Y"
- "fBodyAcc-mean()-Z"
- "fBodyAcc-std()-X"
- "fBodyAcc-std()-Y"
- "fBodyAcc-std()-Z"
- "fBodyAccJerk-mean()-X"
- "fBodyAccJerk-mean()-Y"
- "fBodyAccJerk-mean()-Z"
- "fBodyAccJerk-std()-X"
- "fBodyAccJerk-std()-Y"
- "fBodyAccJerk-std()-Z"
- "fBodyGyro-mean()-X"
- "fBodyGyro-mean()-Y"
- "fBodyGyro-mean()-Z"
- "fBodyGyro-std()-X"
- "fBodyGyro-std()-Y"
- "fBodyGyro-std()-Z"
- "fBodyAccMag-mean()"
- "fBodyAccMag-std()"
- "fBodyBodyAccJerkMag-mean()"
- "fBodyBodyAccJerkMag-std()"
- "fBodyBodyGyroMag-mean()"
- "fBodyBodyGyroMag-std()"
- "fBodyBodyGyroJerkMag-mean()"
- "fBodyBodyGyroJerkMag-std()"

### Variable units
Subject variable is integer type. Activity variable is factor type. All the other variables are numeric type.
