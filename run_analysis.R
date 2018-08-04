# Getting and Cleaning Data - Major Assignment
# Obtain data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Extract to folder and then change working directory to it

# Set working directory to the same folder where the "UCI HAR Dataset" folder exists and then make sure it returns the correct working directory
setwd("/run/media/george/Data/Nextcloud/Coursera/JHDataSciSpecialization/3.GettingAndCleaningData/GettingAndCleaningDataAssignment/")
getwd()

# Load packages needed for analysis
library(plyr)
library(dplyr)

# Read in the six files required
# Test data
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
test_x <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
# Training data
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

# Obtain some basic information about the data sets 
names(train_subject)
names(train_x)
str(train_subject)
str(train_x)

# Rename variables in training data sets
train_subject <- rename(train_subject, subject = V1)
train_y <- rename(train_y, testLabels = V1)

# Combine subject with y datasets
training_data1 <- cbind(train_subject, train_y)
summary(training_data1)

# Combine initial training data set with x dataset
training_data <- cbind(training_data1, train_x)
names(training_data)
