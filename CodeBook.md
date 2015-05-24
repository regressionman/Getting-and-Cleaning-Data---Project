---
title: "CodeBook"
author: "Gary Field"
date: "Sunday, May 24, 2015"
output: html_document
---

### CodeBook for run_analysis.R script which creates a tidy dataset from the UCI HAR Dataset

### UCI HAR Dataset Description

Human Activity Recognition Using Smartphones data set is a data set for UCI's dataset for Human Activity Recognition (HAR) using smartphones that can be used for further research and analysis. The original UCI HAR Dataset is a public domain dataset built from the recordings of subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensor (see [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]).

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Data Attribute Information:

The following attribute data is contained withint each record in the dataset
1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
2. Triaxial Angular velocity from the gyroscope. 
3. A 561-feature vector with time and frequency domain variables. 
4. Activity label 
5. Subject identifier

## Improving the variable names (transformations)

The following variable name transformations were made:

`feature_names<-gsub("BodyBody", "Body",feature_names)` 
`feature_names<-gsub("\\(\\)","", feature_names)` 
`feature_names<-gsub("^t(.*)$","\\1 time",feature_names)`  
`feature_names<-gsub("-mean-"," mean ",feature_names)` 
`feature_names<-gsub("-std-"," std ",feature_names)` 
`feature_names<-gsub("^f(.*)$","\\1 Frequency",feature_names)`  
`feature_names<-gsub("Acc"," Acceleration",feature_names)` 
`feature_names<-gsub("Mag"," Magnitude",feature_names)` 
`feature_names<-gsub("(Gyro)"," \\1",feature_names)` 
`feature_names<-gsub("(Jerk)"," \\1",feature_names)` 


### Output Variables Description

The Tidy dataset is summarized by the following variables:

* Subject: An identifier which refers to a specific volunteer from a group of 30 within an age bracket of 19-48 years.
* Activity: The 6 activities performed by the volunteers.  The activites were walking, walking upstairs, walkig downstairs, sitting, standing, and laying while wearing a smartphone on the wrist.
* Mean: The mean of the measurements
* Measurement:  Captured data from the phone's embedded accelerometer and gyroscope, capturing 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hx.  Measurement consisted of the following variables:

[1] "Body Acceleration mean X time" 
[2] "Body Acceleration mean Y time" 
[3] "Body Acceleration mean Z time"
[4] "Body Acceleration std X time"                   
[5] "Body Acceleration std Y time"
[6] "Body Acceleration std Z time"
[7] "Gravity Acceleration mean X time"
[8] "Gravity Acceleration mean Y time"
[9] "Gravity Acceleration mean Z time"
[10] "Gravity Acceleration std X time"
[11] "Gravity Acceleration std Y time"
[12] "Gravity Acceleration std Z time"
[13] "Body Acceleration Jerk mean X time"
[14] "Body Acceleration Jerk mean Y time"
[15] "Body Acceleration Jerk mean Z time"
[16] "Body Acceleration Jerk std X time"
[17] "Body Acceleration Jerk std Y time"
[18] "Body Acceleration Jerk std Z time"
[19] "Body Gyro mean X time"
[20] "Body Gyro mean Y time"
[21] "Body Gyro mean Z time"
[22] "Body Gyro std X time"
[23] "Body Gyro std Y time"
[24] "Body Gyro std Z time"
[25] "Body Gyro Jerk mean X time"
[26] "Body Gyro Jerk mean Y time"
[27] "Body Gyro Jerk mean Z time"
[28] "Body Gyro Jerk std X time"
[29] "Body Gyro Jerk std Y time"
[30] "Body Gyro Jerk std Z time"
[31] "Body Acceleration Magnitude-mean time"
[32] "Body Acceleration Magnitude-std time"
[33] "Gravity Acceleration Magnitude-mean time"
[34] "Gravity Acceleration Magnitude-std time"
[35] "Body Acceleration Jerk Magnitude-mean time"
[36] "Body Acceleration Jerk Magnitude-std time"
[37] "Body Gyro Magnitude-mean time"
[38] "Body Gyro Magnitude-std time"
[39] "Body Gyro Jerk Magnitude-mean time"
[40] "Body Gyro Jerk Magnitude-std time"
[41] "Body Acceleration mean X Frequency"
[42] "Body Acceleration mean Y Frequency"
[43] "Body Acceleration mean Z Frequency"
[44] "Body Acceleration std X Frequency"
[45] "Body Acceleration std Y Frequency"
[46] "Body Acceleration std Z Frequency"
[47] "Body Acceleration Jerk mean X Frequency"
[48] "Body Acceleration Jerk mean Y Frequency"
[49] "Body Acceleration Jerk mean Z Frequency"
[50] "Body Acceleration Jerk std X Frequency"
[51] "Body Acceleration Jerk std Y Frequency"
[52] "Body Acceleration Jerk std Z Frequency"
[53] "Body Gyro mean X Frequency"
[54] "Body Gyro mean Y Frequency"
[55] "Body Gyro mean Z Frequency"
[56] "Body Gyro std X Frequency"
[57] "Body Gyro std Y Frequency"
[58] "Body Gyro std Z Frequency"
[59] "Body Acceleration Magnitude-mean Frequency"
[60] "Body Acceleration Magnitude-std Frequency"
[61] "Body Acceleration Jerk Magnitude-mean Frequency"
[62] "Body Acceleration Jerk Magnitude-std Frequency"
[63] "Body Gyro Magnitude-mean Frequency"
[64] "Body Gyro Magnitude-std Frequency"
[65] "Body Gyro Jerk Magnitude-mean Frequency"
[66] "Body Gyro Jerk Magnitude-std Frequency"