myfunction<- function() {
  
  library(plyr)
  library(dplyr)
  
  testWD<-setwd("C:/Adatok/coursera/3_getting and cleaning data/Quizes/Assignment/UCI HAR Dataset/test/")
  subject<- read.table("subject_test.txt")

  x<- read.table("X_test.txt")
  y<- read.table("y_test.txt")

  joinedTest<- cbind(subject, y, x)

  trainWD<-setwd("C:/Adatok/coursera/3_getting and cleaning data/Quizes/Assignment/UCI HAR Dataset/train/")
  subjectT<- read.table("subject_train.txt")
  xT<- read.table("X_train.txt")
  yT<- read.table("y_train.txt")

  joinedTrain<- cbind(subjectT, yT, xT)

  mergedData<- merge(joinedTest, joinedTrain, by= 1:563, all=TRUE)

  features<-read.table("C:/Adatok/coursera/3_getting and cleaning data/Quizes/Assignment/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
 
  colnames(mergedData)[1:2]<-c("subject","activity")
  ncol<-ncol(mergedData)
  mcol<-ncol(mergedData)-2

 
  for (i in 1:mcol) {
      name<-features[i,2]
      #print(name)
      k<- 3:ncol
      colnames(mergedData)[k][i]<-name
  }
  
  valid_column_names<-make.names(names=names(mergedData),unique=TRUE, allow_=TRUE)
  names(mergedData)<-valid_column_names

  Selected_Data0<-select(mergedData,1:2)
  Selected_Data1<-select(mergedData,contains("mean"))
  Selected_Data2<-select(mergedData,contains("std"))
  Data<- cbind(Selected_Data0, Selected_Data1, Selected_Data2)
  
  activity_label<-read.table("C:/Adatok/coursera/3_getting and cleaning data/Quizes/Assignment/UCI HAR Dataset/activity_labels.txt")
  TidyData<-merge(activity_label, Data, by.x="V1",by.y= "activity")
  TidyData$V1<-NULL
  names(TidyData)[1]<-"activity"
  
  a<-ddply(TidyData, .(activity, subject), numcolwise(mean))
  
  write.table(a, file= "C:/Adatok/coursera/3_getting and cleaning data/Quizes/Assignment/Tidy_dataset.txt", row.names=FALSE)
 
}
