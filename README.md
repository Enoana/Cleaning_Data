The run_analysis.R file contains a function, called myfunction() which intended to create a tidy dataset out of the input data, the "Human Activity Recognition Using Smartphones Dataset, Version 1.0".

The original input dataset is generated by the following authors:

==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The original dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

==================================================================

The myfunction() is built on the plyr and dplyr R packages which will be automatically loaded in R if the packages are already installed. Please make sure to install these packages before running myfunction().

Please also note that you should give the correct path (working directory) to each files in order to use myfunction().

The myfunction() calls the following files in both the training and test data folder: '/X_test.txt', '/y_test.txt', '/subject_test.txt' which will be joined into one data.frame. Then the two joined data.frames is merged into one data.frame.

The myfunction() names the first two columns as 'subject' and 'activity' and calls the 'features.txt' to extract the names for the rest of the columns in the data.frames. 

Then the names are converted into R-readable valid column names. 

The myfunction() selects the first two columns and all those measurements which are on the mean or the standard deviation for each measurement. The selection criteria is given by matching 'mean' and 'std' in the column names. 
 
The myfunction() assigns descriptive activity names to name the activities from the 'activity_labels.txt' in the data set.

Then myfunction() groups the data.frame by the 'subject' and 'activity' variables and calculates the average of each variable.

Lastly, myfunction() writes out the tidy dataset.
