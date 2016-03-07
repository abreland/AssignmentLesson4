

processData<-function(){
train= read.table("UCI HAR Dataset/train/X_train.txt")
test= read.table("UCI HAR Dataset/test/X_test.txt")
combo <- rbind(test,train)
features = read.table("UCI HAR Dataset/features.txt")

subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")
subject <- rbind(subject_test,subject_train)

y_test = read.table("UCI HAR Dataset/test/y_test.txt")
y_train = read.table("UCI HAR Dataset/train/y_train.txt")
y_ <- rbind(y_test,y_train)
new <- cbind(subject, y_, combo2)
names(new)[1] <- "subjectNumber"
names(new)[2] <- "activityType"
df <- aggregate(x=new, by=list(new$subjectNumber,new$activityType), FUN="mean")
df <- df[,3:83]
write.table(df, "step4out.txt", sep="\t")
}