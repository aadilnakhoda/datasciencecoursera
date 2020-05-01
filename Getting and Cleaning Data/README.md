Getting and Cleaning Data - Peer Graded Assignment
Author: Aadil Nakhoda



This is submitted as a requirement for the peer graded assignment for the course on Getting and Cleaning Data offered by John Hopkins University via Coursera. The output for the assignment included a Readme.md file, a codebook describing the variables, two tidy datasets and an run_analysis.R file.


Brief Description of the Dataset

Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The objectives of the code in the run_analysis.R file:

Setting up the folder, downloading data and unzipping the file 
I. Download UCI HAR Dataset, store it in a folder locally 
II. Unzip the file to obtain the relevant input 

Analyzing the data as required for the assignment
1. Merging the training and the test sets to create one data set using the feature and activity files, the test and train files provided in the dataset.This will create the merged_data dataset.

2. Extracting only the measurements on the mean and standard deviation for each measurement. This will give us our first tidy dataset, tidy1.

3. Using descriptive activity names to name the activities in the data set. This will provide a description to the activities.

4. Appropriately labeling the data set with descriptive variable names.

5. From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject. This will give us our second dataset, tidy2. The averages in this dataset are grouped by subject and activity. 
