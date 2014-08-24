##loading the data from document
train_subject<-read.table("./UCI HAR Dataset/train/subject_train.txt")
xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("./UCI HAR Dataset/train/Y_train.txt")
test_subject<-read.table("./UCI HAR Dataset/test/subject_test.txt")
xtest<-read.table("./UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("./UCI HAR Dataset/test/Y_test.txt")
feature<-read.table("./UCI HAR Dataset/features.txt")
##pre-processing the data frame
feature<-as.character(feature$V2)
##4.Labeling the data set with descriptive variable names. 
names(xtrain)<-feature
names(xtest)<-feature
train<-data.frame("subject"=unlist(train_subject),"label"=unlist(ytrain),xtrain)
test<-data.frame("subject"=unlist(test_subject),"label"=unlist(ytest),xtest)
##1.Mergeing these two pre-processed train and test data set to one data set
data<-rbind(train,test)

##2.Extracts only the measurements on the mean and standard deviation for each measurement.
mean<-grep(".mean().",feature)
std<-grep(".std().",feature)
index<-sort(c(mean,std))+2
dataset1<-data[,c(1:2,index)]
write.table(dataset1,file="dataset1.txt",row.name=FALSE)

##3.Using descriptive activity names to name the activities in the data set
data$label<-as.factor(data$label)
levels(data$label)<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS", "SITTING","STANDING","LAYING")

## The 4th. step has been done!

##5.Creating a second, independent tidy data set with the average of each variable for each activity and each subject. 
library("reshape")
data_melt<-melt(data,id=c("subject","label"),measure.vars=names(data)[3:563])
dataset2<-cast(data_melt, subject + label ~ ...,mean, na.rm=TRUE)
write.table(dataset2,file="dataset2.txt",row.name=FALSE)

## output should be the data set 1 .
dataset1

