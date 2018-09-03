#This script can be run as long as the Samsung data is in your working directory:
#download data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#unzip the file
#set working directory to respective folder

#The script:
#1 Merges the training and the test sets to create one data set.
#2 Extracts only the measurements on the mean and standard deviation for each measurement.
#3 Uses descriptive activity names to name the activities in the data set
#4 Appropriately labels the data set with descriptive variable names.
#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)

# read data
X_train <- read.table("./train/X_train.txt")
X_test <- read.table("./test/X_test.txt")
Y_train <- read.table("./train/Y_train.txt")
Y_test <- read.table("./test/Y_test.txt")
sub_train <- read.table("./train/subject_train.txt")
sub_test <- read.table("./test/subject_test.txt")
features <- read.table("./features.txt")
activity_labels <- read.table("./activity_labels.txt")

# 1 Merges the training and the test sets to create one data set.
X <- rbind(X_train, X_test)
Y <- rbind(Y_train, Y_test)
sub <- rbind(sub_train, sub_test)

# 2 Extracts only the measurements on the mean and standard deviation for each measurement
features_mean_std <- grep("mean|std",features[,2])
X <- X[,features_mean_std]

# correct the column names
names(X) <- features[features_mean_std, 2]

# Step 3
# Use descriptive activity names to name the activities in the data set

# update values with correct activity names
Y[, 1] <- activity_labels[Y[, 1], 2]

# assign column name
names(Y) <- "activity"

# Step 4
# Appropriately label the data set with descriptive variable names

# assign column name
names(sub) <- "subject"

# bind all the data in a single data set
data <- cbind(X, Y, sub)

# Step 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

means <- data %>% 
  group_by(subject, activity) %>%
  summarise_all(funs(mean))

# output to file "tidydata.txt" in folder above working directory
setwd('..')
write.table(means, "tidydata.txt", row.names = FALSE, 
            quote = FALSE)