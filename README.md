==================================================================
Subject: Coursera Getting and Cleaning Data Project

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

Contents of this Project Folder:
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
   You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

The dataset includes the following files:
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

Process Flow for Run_Analysis.R:
=========================================
The following describes the process flow for the R program (run_analysis.R)
0.  Create Github local repository (project), remember to do save & snyc files as you go.
1.  Set workding directory to project
2.  Make sure the library "reshape2" is loaded
3.  Set the download, URL, and unzip file name.
4.  Set variables for URL, file and download locations
5.  Test for data foloder and zip file, if NOT found create
6.  Download and unzip the filename
7.  Load activity labels - Uses descriptive activity names to name the activities in the data set
8.  Extract only the data on mean and standard deviation
9.  Merge train and test data sets and add thier labels
10. Transform activities & subjects into factors
11. Write out the tidy data set
12. Create Markup files using R (CodeBook and Readme)
13. Publish everything into Github (https://github.com/omg-allen/Getting-and-Cleansing-Data---Project)


Notes: 
======
For more information about this dataset contact: activityrecognition@smartlab.ws

