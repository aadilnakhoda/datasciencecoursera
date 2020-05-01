library(dplyr)
library(tidyr)
#Setting up the folder, downloading data and unzipping the file 
#(I) Downloading data 
setwd("E:/Coursera/Getting and Cleaning Data/Peer Review/")
if(!file.exists("./data")){dir.create("./data")}
   fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
   download.file(fileURL,destfile="./data/Dataset.zip")
#(II) Unzip the downloaded file
   unzip(zipfile="./data/Dataset.zip",exdir="./data")

#1. Merging the training and the test sets to create one data set.


#a. Reading the features and activity_labels files
features <- read.table("UCI HAR Dataset/features.txt", col.names= c("id", "functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names= c("labels", "activity"))

#b. Reading the x-train, y-train and subject_train files 
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names= "labels" )
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names="subject")

#c. Reading the x_test, y_test and subject_test files
x_test <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names=features$functions)
y_test <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names="labels")
subject_test <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names="subject")

#d. Merging the train and test datasets into one set
x<-rbind(x_train, x_test)
y <-rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged_data <- cbind(x, y, subject)

#2. Extracting only the measurements on the mean and standard deviation for each measurement.
tidy1 <- select(merged_data, subject, labels, contains("mean"), contains("std"))

#3. Using descriptive activity names to name the activities in the data set
tidy1$labels <- activities[tidy1$labels,2]


#4. Appropriately labeling the data set with descriptive variable names.
names(tidy1)[2] = "activity"
names(tidy1)<-gsub("Acc", "Accelerometer", names(tidy1))
names(tidy1)<-gsub("Gyro", "Gyroscope", names(tidy1))
names(tidy1)<-gsub("BodyBody", "Body", names(tidy1))
names(tidy1)<-gsub("Mag", "Magnitude", names(tidy1))
names(tidy1)<-gsub("^t", "Time", names(tidy1))
names(tidy1)<-gsub("^f", "Frequency", names(tidy1))
names(tidy1)<-gsub("tBody", "Time Body", names(tidy1))
names(tidy1)<-gsub("-mean()", "Mean", names(tidy1), ignore.case = TRUE)
names(tidy1)<-gsub("mean", "Mean", names(tidy1), ignore.case = TRUE)
names(tidy1)<-gsub("-std()", "Standard Deviation", names(tidy1), ignore.case = TRUE)
names(tidy1)<-gsub("std", "Standard Deviation", names(tidy1), ignore.case = TRUE)
names(tidy1)<-gsub("-freq()", "Frequency", names(tidy1), ignore.case = TRUE)
names(tidy1)<-gsub("angle", "Angle", names(tidy1))
names(tidy1)<-gsub("gravity", "Gravity", names(tidy1))

#5. From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy2 <- tidy1 %>%
        group_by(subject, activity) %>%
summarise_all(funs(mean))
write.table(tidy2, "tidy2.txt", row.name=FALSE)
View(tidy2)
#End