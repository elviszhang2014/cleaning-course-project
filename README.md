---
title: "README"
author: "Elvis Zhang"
date: "Sunday, August 24, 2014"
output: html_document
---
 This the explaination file for my course project assignment .

###The things script done :

1. load the data(train, test) from data file ( having downloaded from website);

2. pre-process each data including train and test data;

   In this step, i label the data set with descriptive variable names ,which is step 4 in assignment requirement.

3. merge  two pre-processed train and test data set to one data set;

4. create dataset1 of extracting only the measurements on the mean and standard deviation for each measurement; 

5.using descriptive activity names to name the activities in the data set;

6.create a second, independent tidy data set with the average of each variable for each activity and each subject. 

  In this step, i used reshape packages to melt the data frame firstly and cast the melted data with mean() function secondly.