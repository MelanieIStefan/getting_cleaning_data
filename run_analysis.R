# Merge the training and the test sets to create one data set.

# Read in training and test data sets and labels

trainData <- read.table("train/X_train.txt")
trainLabels <- read.table("train/y_train.txt")

testData <- read.table("test/X_test.txt")
testLabels <- read.table("test/y_test.txt")

allData <- rbind(trainData,testData)
allLabels <- rbind(trainLabels,testLabels)

# Extracts only the measurements on the mean and standard deviation for each measurement. 

# Uses descriptive activity names to name the activities in the data set

# Appropriately labels the data set with descriptive variable names. 

# Creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject. 