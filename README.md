## Summary

This script contains a function "run_analysis()". The function reads data files from the folder "data", and outputs a tidy data set.

## Details

The function performs the following:
1. reads the data files (X and Y of train and test)
2. reads the data for the subject IDs
3. merges the all the data tables into one
4. reads the labels for the features (variables) and names the column of the data frame accordingly
5. Extracts only the features that measure the mean and standard deviation (while preserving the columns for the activity and subjects)
6. renames the activities from integers to descriptive names
7. creates a new tidy data set with the averages of each variable grouped by activity and subject ID

## Instructions

First make sure all data files are in the "data" folder in the following locations:
- X_train.txt: "data/train/"
- X_test.txt: "data/test/"
- y_train.txt: "data/train/"
- y_test.txt: "data/test/"
- subject_train.txt: "data/train/"
- subject_test.txt: "data/test/"
- features.txt: "data/"

To run the script, copy and paste the following commands in the R console:
```
source "run_analysis.R"
run_analysis()
```
The function takes no arguments, and the output is a file called "tidydata.txt" in the root folder.