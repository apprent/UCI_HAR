---
title: "README"
author: "HanDH"
date: "Saturday, January 24, 2015"
output: html_document
---

This file describes how **run_analysis.R** works.

1. Reads all the files needed (y, s, X, features, activities).
2. Binds the train and test data (y, s, X).
3. Identifies the (86) variables that contain mean and standard deviation from all the 561 variables.
4. Extracts useful data from **X**.
5. Labels the 86 variables (adds colume names for **data**).
6. Inquires activity names for all the (7352 + 2947) observations.
7. Inserts activity and subject columes to **data**.
8. Calculates the average of each (86) variable for each activity and each subject, stored in the list **resby**.
9. Converts the list **resby** to the data frame **res**, then transposes **res**.
10. Inquires and sets descriptive activity names for the 30 (subjects) *6 (activities) = 180 observations.
11. Outputs result to a text file **tidy_data.txt**.
