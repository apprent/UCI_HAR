---
title: "CodeBook"
author: "HanDH"
date: "Sunday, January 25, 2015"
output: html_document
---

There are 88 variables and 180 observations in the final tidy data set.

1. The first variable is **subject** indicating to which volunteer the data belongs.
2. The second variable is **activity** indicating to which activity of the 6 the data belongs.
3. The other 86 variables are which focused on mean and standard deviation of measurements, such as **tBodyAcc-mean()-X** or **fBodyAccJerk-std()-Z**.
4. There are 30 volunteers perfoming 6 activities each, so we get 180 observations, data of each observation is the mean value of several times of measurements on each motion quantity.