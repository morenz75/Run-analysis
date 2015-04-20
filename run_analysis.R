fixedlenghtvector <- vector(mode="numeric", length=0)
for (k in 1:561) {
        fixedlenghtvector <- append(fixedlenghtvector, c(-1, 15))
}

traindata <- read.fwf(file.path("data", "train", "X_train.txt"), widths = fixedlenghtvector, head = FALSE, buffersize = 100)
testdata <- read.fwf(file.path("data", "test", "X_test.txt"), widths = fixedlenghtvector, head = FALSE, buffersize = 100)
# Merge train and test dataset into a final dataset
finaldataset <- rbind(traindata, testdata)
#fixedlenghtvector <-vector(mode="numeric", length=0)

features <- read.csv(file.path("data","features.txt"), sep = " ", head = FALSE)

#I exclude Mean columns because they are already tidy data, as they are calculated from other measure (like angle)
finaldataset[, grep("std\\(\\)|mean\\(\\)", features$V2)]

activitylabels <- read.csv(file.path("data","activity_labels.txt"), sep = " ", head = FALSE)
traindatalabel <- read.csv(file.path("data", "train", "y_train.txt"), head = FALSE)
testdatalabel <- read.csv(file.path("data", "test", "y_train.txt"), head = FALSE)