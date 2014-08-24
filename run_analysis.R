## load necessary libraries

library(stringr)

## Merge the training and the test sets to create one data set.

# Read in training and test data sets and labels

trainData <- read.table("train/X_train.txt")
trainLabels <- read.table("train/y_train.txt")

testData <- read.table("test/X_test.txt")
testLabels <- read.table("test/y_test.txt")

# Merge test and train data

allData <- rbind(trainData,testData)
allLabels <- rbind(trainLabels,testLabels)

# Remove datasets no longer used

rm(testData)
rm(testLabels)
rm(trainData)
rm(trainLabels)

# Extract only the measurements on the mean and standard deviation for each measurement. 

# Get columns with mean or std in their names only

features <- read.table("features.txt")

mean_std <- features[str_detect(features[ ,2], "mean") | str_detect(features[,2], "std"), ]
dim(mean_std)

allData=allData[ ,mean_std[ ,1]]

# Use descriptive activity names to name the activities in the data set
            
label_names <- read.table("activity_labels.txt")

for (i in 1:dim(label_names)[1]) {
  allLabels[allLabels==i] <- tolower(label_names[label_names[,1]==i, 2])
  }



# Appropriately labels the data set with descriptive variable names. 

# Creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject. 