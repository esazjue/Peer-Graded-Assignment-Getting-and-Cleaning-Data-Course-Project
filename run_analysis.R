library(tidyr)

#Loading features and activity labels files common to test and train data
features <- read.table("./UCI HAR Dataset/features.txt") 
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") 

#Loading data corresponding to the "test" set of data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt") 
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt") 
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

#Loading data corresponding to the "train" set of data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt") 
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Labelling the data set with descriptive variable names. 
names(X_test)<- features$V2

# Merging activity in the test dataset with corresponding activity labels to use descriptive activity names 
act <- merge(y_test,activity_labels,by.x="V1",by.y="V1")
# Combining subject info with activity and correspoding measures. Activities names are shown and an extra column is added to mark the values come from the test dataset.
test <- cbind(subject_test,rep("test",nrow(act)),act$V2,X_test)
# Adding missing column names 
names(test)[1] <- "subject"
names(test)[2] <- "set"
names(test)[3] <- "activity" 

# Labelling the data set with descriptive variable names. 
names(X_train)<- features$V2

# Merging activity in the train dataset with corresponding activity labels to use descriptive activity names 
act <- merge(y_train,activity_labels,by.x="V1",by.y="V1")
# Combining subject info with activity and correspoding measures. Activities names are shown and an extra column is added to mark the values come from the train dataset
train <- cbind(subject_train,rep("train",nrow(act)),act$V2,X_train)
# Adding missing column names 
names(train)[1] <- "subject"
names(train)[2] <- "set"
names(train)[3] <- "activity"

#Combining the training and the test sets to create one data set.
all <- rbind(test,train) #10299   564

#Extracting only the measurements on the mean and standard deviation for each measurement. 
tiny <- cbind(all[,1:3],all[, grepl("([m]ean|std)" ,names(all))] ) # 10299 82
tiny %>% group_by(set,subject,activity) %>% mutate(sample = seq_len(n()) ) -> tiny  # 10299 83
