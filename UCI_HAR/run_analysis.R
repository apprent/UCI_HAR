## read files
y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")
s_train <- read.table("train/subject_train.txt")
s_test <- read.table("test/subject_test.txt")
X_train <- read.table("train/X_train.txt")
X_test <- read.table("test/X_test.txt")
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

## row bind
y <- rbind(y_train,y_test)
s <- rbind(s_train,s_test)
X <- rbind(X_train,X_test)

## remove unuseful data
rm("y_train","s_train","X_train","y_test","s_test","X_test")

## extract variables which contains mean or std
var_sel_i <- sort(c(agrep("mean",features$V2),agrep("std",features$V2)))
features_sel <- features[var_sel_i,2]
data <- X[,var_sel_i]

## remove unuseful data
rm("X")

## Set variable names to data columes
names(data) <- features_sel

## inquiring activity names for y
for (ii in seq(activities[,1])) {
        y[y[,1]==activities[ii,1],2] <- activities[ii,2]
}
## use numbers, not strings
activity <- y[,1]
## add activity colume to data
data <- cbind(activity,data)

## add subject colume to data
subject <- s[,1]
data <- cbind(subject,data)

## 5. From the data set in step 4, creates a second, independent tidy data set 
#  with the average of each variable for each activity and each subject.

resby <- by(data,list(data$subject,data$activity),colMeans)

for (jj in seq(resby)) {
        if (jj == 1) {
                res <- data.frame(resby[[jj]])
        } else {
                res <- cbind(res,resby[[jj]])
        }        
}

## remove unuseful data
rm("resby","data","s","y")

## transpose the res data frame
res <- as.data.frame(t(res))
row.names(res) <- NULL

## inquiring activity names for res
for (ii in seq(activities[,1])) {
        res[res[,2]==activities[ii,1],89] <- activities[ii,2]
}
res[,2] <- res[,89]
res <- res[,-89]

## Output the tidy res
write.table(res,"tidy_data.txt",row.names = FALSE)