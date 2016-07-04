# Peer-Graded-Assignment-Getting-and-Cleaning-Data-Course-Project
The run_analysis.R script processes the dataset UCI HAR Dataset. It first reads the txt files in the following folders:
- UCI HAR Dataset
- UCI HAR Dataset/test
- UCI HAR Dataset/train

Then, it processes the "test" and "train" datasets. For each of them, measures data set is labelled with descriptive variable names and activities are merged with the corresponding activity labels to use descriptive activity names. Information regarding the subject, type of set (test or train) and activity are combined this the data from the corresponding datasset. After those transformations, the "test" and "train" datasets are combined.

Only mean and std related columns are extracted from the combine dataset to generated smaller one. Number of sample per subject, activity and set is added as a new column. After that, gather and separete functions are used to created a dataset in which each row contains 8 different dimensions and a single value. An example follows:

|subject	|set	  |activity	|sample	|domain	|feature	  |measure	|axis	|value|
|  2	   | test	|WALKING|1	     | t	    |BodyAcc	  |mean	    |X	  |0.25717778|

In the last step, summarize function is used to calculated the average value of each variable for each activity and each subject. For that it takes into account also that each variable has also domain,feature,measure and axis dimension assiciated. Finally, the average dataset is stored into a text file as required. 
