#Data prep
#Download the data from the follwoing URL -- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#Extract the Data using any common utility like 7zip, PKzip, gunzip, etc...
#Data extracted looks like
#-UCI HAR Dataset
#  --test
#	 --subject_test.txt  (I do not see this file referenced in the Readme assuming "Test set.")
#	 --X_test.txt  ("Test set.")
#	 --Y_test.txt  ("Test labels.") 
#  --train
#	 --subject_train.txt  ("Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.")
#	 --X_train.txt  ("Training set.")
#	 --Y_train.txt  ("Training labels.")
 

# Step 1 Merges the training and the test sets to create one data set.
setwd("D:/Education/Coursera/Getting-Cleaning-Data/week4/UCI HAR Dataset")
getwd()
#Read the X files
dataXTest  <- read.table("./test/X_test.txt" )
dataXTrain <- read.table("./train/X_train.txt")
#Read the Y files
dataYTest  <- read.table("./test/Y_test.txt")
dataYTrain <- read.table("./train/Y_train.txt")
#Read the Subject files
dataSubjTrain <- read.table("./train/subject_train.txt")
dataSubjTest  <- read.table("./test/subject_test.txt")

# Step 1.5 display the data for review (ctrl-l to clear screen)
head(dataXTest)
head(dataXTrain)
head(dataYTest)
head(dataYTrain)
head(dataSubjTrain)
head(dataSubjTest)

# Step 2 rbind data tables 
dataX <- rbind(dataXTrain, dataXTest)
dataY <- rbind(dataYTrain, dataYTest)
dataSubj <- rbind(dataSubjTrain, dataSubjTest)

#Step 3 Set variable names
names(dataSubjTrain)<-c("subject")
names(dataYTrain)<- c("activity")
featureNames <- read.table("features.txt")
names(dataX)<- featureNames$V2


# Step #4 Combine all the data
combineSubjestAndDataY <- cbind(dataSubj, dataY)
allDataCombined <- cbind(dataX, combineSubjestAndDataY)

# Step 5 extract measurements in the data for only the mean and the standart deviation
subFeaturesNames<-featureNames$V2[grep("mean\\(\\)|std\\(\\)", featureNames$V2)]
selectedNames<-c(as.character(subFeaturesNames), "subject", "activity" )
allDataCombined<-subset(allDataCombined,select=selectedNames)

head(allDataCombined)

#Adding descriptive variable names
names(allDataCombined)<-gsub("^tim", "time", names(allDataCombined))
names(allDataCombined)<-gsub("^fre", "frequency", names(allDataCombined))
names(allDataCombined)<-gsub("Acc", "Accelerometer", names(allDataCombined))
names(allDataCombined)<-gsub("Gyro", "Gyroscope", names(allDataCombined))
names(allDataCombined)<-gsub("Mag", "Magnitude", names(allDataCombined))
names(allDataCombined)<-gsub("BodyBody", "Body", names(allDataCombined))

#Write tidy data file
write.table(allDataCombined, file = "tidydata.txt",row.name=FALSE)