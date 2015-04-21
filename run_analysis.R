fixedlenghtvector <- vector(mode="numeric", length=0)
for (k in 1:561) {
        fixedlenghtvector <- append(fixedlenghtvector, c(-1, 15))
}

traindata <- read.fwf(file.path("data", "train", "X_train.txt"), widths = fixedlenghtvector, head = FALSE, buffersize = 100)
testdata <- read.fwf(file.path("data", "test", "X_test.txt"), widths = fixedlenghtvector, head = FALSE, buffersize = 100)
# Exercise 1 
# Merge train and test dataset into a final dataset as requested
finaldataset <- rbind(traindata, testdata)

# Exercise 2
#I exclude Mean columns because they are already tidy data, as they are calculated from other measure (like angle)
features <- read.csv(file.path("data","features.txt"), sep = " ", head = FALSE)
finaldataset <- finaldataset[, grep("std\\(\\)|mean\\(\\)", features$V2)]

# Exercise 3
# Get labels of training and test set
activitylabels <- read.csv(file.path("data","activity_labels.txt"), sep = " ", head = FALSE)
traindatalabel <- read.csv(file.path("data", "train", "y_train.txt"), head = FALSE)
testdatalabel <- read.csv(file.path("data", "test", "y_test.txt"), head = FALSE)

descactivitytrain <- merge(traindatalabel, activitylabels, by = ("V1"), sort = FALSE)
descactivitytest <- merge(testdatalabel, activitylabels, by = ("V1"), sort = FALSE)
overallactivity <- rbind(descactivitytrain, descactivitytest)

# Add column (as first column) with activity description for each row
finaldataset <- cbind(overallactivity$V2, finaldataset)

# Exercise 4
# Get column labels
colname <- c("activity", grep("std\\(\\)|mean\\(\\)", tolower(features$V2), value = TRUE))
# Rename dataset's columns
colnames(finaldataset) <- colname

# Exercise 5
subjecttrain <- read.csv(file.path("data", "train", "subject_train.txt"), head = FALSE)
subjecttest <- read.csv(file.path("data", "test", "subject_test.txt"), head = FALSE)
subjects <- rbind(subjecttrain, subjecttest)

newdataset <- cbind(subjects, finaldataset)
setnames(newdataset, "V1", "subject")

resultdataset <- summarise_each(group_by(newdataset, subject, activity), funs(mean))
write.table(resultdataset, file = "step5.txt", row.names = FALSE)
