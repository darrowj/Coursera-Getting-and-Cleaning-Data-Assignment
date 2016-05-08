#Getting and Cleaning Data Course Project CodeBook

This file describes how run_analysis.R script works.#Data prep
* Download the data from the follwoing URL -- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Extract the Data using any common utility like 7zip, PKzip, gunzip, etc...
* Data extracted looks like
	* -UCI HAR Dataset
		* --test
			* --subject_test.txt  (I do not see this file referenced in the Readme assuming "Test set.")
			* --X_test.txt  ("Test set.")
			* --Y_test.txt  ("Test labels.") 
		* --train
			* --subject_train.txt  ("Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.")
			* --X_train.txt  ("Training set.")
			* --Y_train.txt  ("Training labels.")


* Step 1 Merges the training and the test sets to create one data set.

* Step 1.5 display the data for review (ctrl-l to clear screen)

* Step 2 rbind data tables 

* Step 3 Set variable names

* Step 4 Combine all the data

* Step 5 extract measurements in the data for only the mean and the standart deviation

* Adding descriptive variable names

* Write tidy data file