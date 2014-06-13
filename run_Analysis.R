##########################################################################################################
# run_analysis.R
#Swati Gupta
##########################################################################################################

setwd('C:\Users\Swati\Downloads\getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset');

####Including Liraries#######

library(plyr)
library(reshape2)

####Initialising########
activities<-read.table("./input/activity_labels.txt", colClasses=c("integer","character"),col.names=c("activityid","activityraw"))
features<-read.table("./input/features.txt",colClasses=c("integer","character"),col.names=c("featureid","featureraw"))

testsubjects<-read.table("./input/test/subject_test.txt", col.names=c("subject") )
testlabels<-read.table("./input/test/y_test.txt", col.names=c("activityid") )
testattributes<-read.table("./input/test/X_test.txt")

trainsubjects<-read.table("./input/train/subject_train.txt", col.names=c("subject") )
trainlabels<-read.table("./input/train/y_train.txt", col.names=c("activityid") )
trainattributes<-read.table("./input/train/X_train.txt")


subjects<-rbind(testsubjects,trainsubjects)
labels<-rbind(testlabels,trainlabels)
attributes<-rbind(testattributes,trainattributes)



activities$activityclean<-gsub("_","",tolower(activities$activityraw))


labels$activity <- activities[labels$activityid,"activityclean"]


features$featureclean <- gsub(",|-|\\(|\\)","",tolower(features$featureraw) )



features$ismeanorstd <- grepl("mean\\(\\)|std\\(\\)", features$featureraw )
selectedfeatures <- which(features$ismeanorstd)



tidydataset1<-cbind(subjects, labels[,"activity"],attributes[selectedfeatures] )
names(tidydataset1)<-c("subject","activity", features$featureclean[selectedfeatures] )

write.table(tidydataset1, "tidydataset1.txt", row.names = FALSE)


longformat <- melt(tidydataset1, id=c("subject", "activity"))

means <- ddply(longformat, .(subject, activity, variable), summarize, value = mean(value))

tidyDataSet <- dcast(means, subject + activity ~ variable)

write.table(tidyDataSet, "tidyData.txt", row.names = FALSE) 


######END##############################################

