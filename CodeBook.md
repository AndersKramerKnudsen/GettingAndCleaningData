#Code Book

##Overview
This code book describes what has been done in order to do the Coursera assignment: Getting and Cleaning Data Course Project.

##Description of input
The following files has been downloaded to my computer 
from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
- activity_labels.txt:	Id and name of the 6 activities
- y_test.txt:		2947 integers with ID of the activity related to each of the observations in x_test.txt
- y_train.txt:		7352 integers with ID of the activity related to each of the observations in x_train.txt
- x_test.txt:		561 features for 9 volunteers with 2947 observations
- x_train.txt:		561 features for 21 volunteers with 7352 observations
- features.txt:		Names of the 561 features
- subject_train.txt: 	7352 integers with ID of the volunteer related to each of the observations in x_train.txt
- subject_test.txt:	2947 integers with ID of the volunteer related to each of the observations in x_test.txt


##Data processing steps
Start by downloading and extract the files to your hard drive. This is not done automatically
1 The input files are loaded into data frames
2 The data frames are merged into one big data frame containing test and training data as well as column names, but only where variables contain mean() or std(). This results in 66 variables plus subjectID and activity
3 For each column descriptive names are given. 
4 A tidy data set is created containing the mean for each subject, feature and activity. With 6 activities and 30 subjects this results in 180 rows with the mean of each 66 features.
5 A file with the tidy data set is exported to tidy.txt

##Tidy data set includes these variables and data types
- subject <int>{1:30},
- activity <fctr>{LAYING,SITTING,STANDING,WALKING,WALKING_DOWNSTAIRS,WALKING_UPSTAIRS},
- time.bodyaccelerometer.mean.x <dbl>,
- time.bodyaccelerometer.mean.y <dbl>, 
- time.bodyaccelerometer.std.x <dbl>, 
- time.bodyaccelerometer.std.y <dbl>,
- time.bodyaccelerometer.std.z <dbl>, 
- time.gravityaccelerometer.mean.x <dbl>,
- time.gravityaccelerometer.mean.y <dbl>, 
- time.gravityaccelerometer.mean.z <dbl>,
- time.gravityaccelerometer.std.x <dbl>, 
- time.gravityaccelerometer.std.y <dbl>,
- time.gravityaccelerometer.std.z <dbl>, 
- time.bodyaccelerometer.jerk.mean.x <dbl>,
- time.bodyaccelerometer.jerk.mean.y <dbl>, 
- time.bodyaccelerometer.jerk.mean.z <dbl>,
- time.bodyaccelerometer.jerk.std.x <dbl>, 
- time.bodyaccelerometer.jerk.std.y <dbl>,
- time.bodyaccelerometer.jerk.std.z <dbl>, 
- time.bodygyroscope.mean.x <dbl>,
- time.bodygyroscope.mean.y <dbl>, 
- time.bodygyroscope.mean.z <dbl>, 
- time.bodygyroscope.std.x <dbl>,
- time.bodygyroscope.std.y <dbl>, 
- time.bodygyroscope.std.z <dbl>,
- time.bodygyroscope.jerk.mean.x <dbl>, 
- time.bodygyroscope.jerk.mean.y <dbl>,
- time.bodygyroscope.jerk.mean.z <dbl>, 
- time.bodygyroscope.jerk.std.x <dbl>,
- time.bodygyroscope.jerk.std.y <dbl>, 
- time.bodygyroscope.jerk.std.z <dbl>,
- time.bodyaccelerometermagnitude.mean <dbl>, 
- time.bodyaccelerometermagnitude.std <dbl>,
- time.gravityaccelerometermagnitude.mean <dbl>, 
- time.gravityaccelerometermagnitude.std <dbl>,
- time.bodyaccelerometer.jerkmagnitude.mean <dbl>, 
- time.bodyaccelerometer.jerkmagnitude.std <dbl>,
- time.bodygyroscopemagnitude.mean <dbl>, 
- time.bodygyroscopemagnitude.std <dbl>,
- time.bodygyroscope.jerkmagnitude.mean <dbl>, 
- time.bodygyroscope.jerkmagnitude.std <dbl>,
- fequency.bodyaccelerometer.mean.x <dbl>, 
- fequency.bodyaccelerometer.mean.y <dbl>,
- fequency.bodyaccelerometer.mean.z <dbl>, 
- fequency.bodyaccelerometer.std.x <dbl>,
- fequency.bodyaccelerometer.std.y <dbl>, 
- fequency.bodyaccelerometer.std.z <dbl>,
- fequency.bodyaccelerometer.jerk.mean.x <dbl>, 
- fequency.bodyaccelerometer.jerk.mean.y <dbl>,
- fequency.bodyaccelerometer.jerk.mean.z <dbl>, 
- fequency.bodyaccelerometer.jerk.std.x <dbl>,
- fequency.bodyaccelerometer.jerk.std.y <dbl>, 
- fequency.bodyaccelerometer.jerk.std.z <dbl>,
- fequency.bodygyroscope.mean.x <dbl>, 
- fequency.bodygyroscope.mean.y <dbl>,
- fequency.bodygyroscope.mean.z <dbl>, 
- fequency.bodygyroscope.std.x <dbl>,
- fequency.bodygyroscope.std.y <dbl>, 
- fequency.bodygyroscope.std.z <dbl>,
- fequency.bodyaccelerometermagnitude.mean <dbl>, 
- fequency.bodyaccelerometermagnitude.std <dbl>,
- fequency.body.bodyaccelerometer.jerkmagnitude.mean <dbl>,
- fequency.body.bodyaccelerometer.jerkmagnitude.std <dbl>,
- fequency.body.bodygyroscopemagnitude.mean <dbl>, 
- fequency.body.bodygyroscopemagnitude.std <dbl>,
- fequency.body.bodygyroscope.jerkmagnitude.mean <dbl>,
- fequency.body.bodygyroscope.jerkmagnitude.std <dbl>

## Other relevant information
In the .zip file you can get further info about the variables and data files in features_info.txt and README.txt
