#
# Get and Cleaning Data Course Project
#
# The purpose of this project is to demonstrate the ability to collect,
# work with, and clean a data set. The goal is to prepare tidy data 
# that can be used for later analysis
#
# Requires dplyr and tidyr packages
#

#  
# STEP 1: Merge the test and training datasets 
# 

# Generate the test_data from the input files 
data_test<-read.table("test/X_test.txt", nrows=2947, comment.char="") 
subject_test<-read.table("test/subject_test.txt", col.names=c("subject_id")) 
activity_test<-read.table("test/y_test.txt", col.names=c("activity")) 
test_data <- cbind(data_test,subject_test,activity_test) 

# Generate the training_data from the input files 
data_train<-read.table("train/X_train.txt", nrows=7352, comment.char="") 
subject_train<-read.table("train/subject_train.txt", col.names=c("subject_id")) 
activity_train<-read.table("train/y_train.txt", col.names=c("activity")) 
train_data <- cbind(data_train,subject_train,activity_train) 
 
# merge the two datasets 
dataset<-rbind(test_data,train_data) 
 
#  
# STEP 2: Extract the measures for the mean and standard deviation only
# 

# Read in the list of features
featurelist<-read.table("features.txt",col.names=c("id","name"))

# filter only features that has mean or std in the name, excluding meanFreq
features<-c(as.vector(featurelist[,"name"]),"subject_id","activity") 
filtered_ids<-grepl("mean|std|subject_id|activity",features) & !grepl("meanFreq",features) 
filtered_data = dataset[,filtered_ids] 
 
#  
# STEP 3: Use descriptive activity names to name the activities in the data # 

act_list<-read.table("activity_labels.txt",col.names=c("id","activity_name")) 

for (r in 1:nrow(act_list)) { 
  filtered_data$activity[filtered_data$activity==act_list[r,"id"]]<-as.character(act_list[r,"activity_name"]) 
  } 

#   
# STEP 4: Appropriately label the data set with descriptive variable names  
#  

# Modify various labels to make more readable
feature_names <- features[filtered_feature_ids] 

feature_names<-gsub("BodyBody", "Body",feature_names) 
feature_names<-gsub("\\(\\)","", feature_names) 
feature_names<-gsub("^t(.*)$","\\1 time",feature_names) 
feature_names<-gsub("-mean-"," mean ",feature_names)
feature_names<-gsub("-std-"," std ",feature_names)
feature_names<-gsub("^f(.*)$","\\1 Frequency",feature_names) 
feature_names<-gsub("Acc"," Acceleration",feature_names) 
feature_names<-gsub("Mag"," Magnitude",feature_names) 
feature_names<-gsub("(Gyro)"," \\1",feature_names) 
feature_names<-gsub("(Jerk)"," \\1",feature_names) 

# Modify the names 
names(filtered_data)<-feature_names 
 
#  
# STEP 5: From the data set in step 4, creates a second, independent tidy data set
#         with the average of each variable for each activity and each subject. 
# 

tidy_data<-tbl_df(filtered_data) %>% group_by(subject_id, activity) %>% summarise_each(funs(mean)) %>% 
  gather(measurement,mean,-activity,-subject_id) 

# Save the tidy dataset to a file 
write.table(tidy_data,file="tidydata.txt",row.name=FALSE) 