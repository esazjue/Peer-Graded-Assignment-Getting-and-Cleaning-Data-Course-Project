
Original data has been processed breaking the original value of each feature name into four columns: domain, feature, measure and axis.
For instance, tBodyAcc-mean()-X is broken into:

domain: t
feature: BodyAcc
measure:mean
axis: X

Additionally, strings with the activity descriptions are used instead of the activities ids.

Thus, each row in the requested average dataset has the following columns:

1) activity: As in the original dataset the activity in the current experiment but using one of the following text strings:
LAYING
SITTING
STANDING
WALKING
WALKING_DOWNSTAIRS
WALKING_UPSTAIRS

2) subject: from 1 to 30 as in the original dataset	

3) domain: time (t) or frequency (f) depending on the domain in which the measure was maded

4) feature: One of the following values:
BodyAcc
BodyAccJerk
BodyAccMag
BodyBodyAccJerkMag
BodyBodyGyroJerkMag
BodyBodyGyroMag
BodyGyro
BodyAccJerkMag
BodyGyroJerk
BodyGyroJerkMag
BodyGyroMag
GravityAcc
GravityAccMag

5) measure: Possible values are mean, meanFreq and std

6) axis:  X,Y,Z or nothing it the measure is not associated with any spacial dimension

7) mean(value): Average value of the variable
