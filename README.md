#Getting and Cleaning Data

In my repositories you'll find a single .R file that I used to get and clean data to solve all exercises of the course.

As the data file is a fixed length file, I've created a vector that contains every widths of texts used to split file data in columns.

With that vector I've read train and test file, merging their data in a single data.frame (*finaldataset*).

Then I've extracted all measurements on the mean and standard deviation for each measurement. 
In this case I've decided to select only measurements containing mean() and sd() because they contain tidy data.

In fact:
* meanFreq()
* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

measurements describe more than one variable, so they're messy data.

Starting from activity labels csv, I've attached a column for each row that describe the related activity.

In order to complete the data set, I've modified columns name of the data.frame.

To accomplish the last point of the assignment, I've attached a new column to the data.table that specify the subject who performed the activity, and properly named it.
For the last step I've summarised the data grouping them with subject and activity in order to find out the average of each measurement.

Please read the Codebook to find out decision made, variables and summaries calculated.


