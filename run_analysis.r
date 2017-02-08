library(dplyr) 

# Reads csv file from a given Path 
ReadFile <- function(path) { 
     df <- read.csv(path, stringsAsFactors=F, header = F, sep="") 
     df 
}

# Extracts mean and standard deviation columns 
ExtractMeanStd <- function(df) { 
     df[,grep("(mean\\(\\)|std\\(\\))", names(df))] 
}

# Appends train and test data frames together. 
# Adds headers name to the data set. 
MergeDfs <- function(df1, df2, headers) { 
     dfTotal <- rbind(df1, df2) 
     names(dfTotal) <- headers 
     dfTotal 
}

# Rename column names 
RenameColumns <- function(name) {
     name <- gsub("Mag", "magnitude", name)
     name <- gsub("Acc", "accelerometer", name) 
     name <- gsub("Gyro", "gyroscope", name)
     name <- gsub("^t", "time", name) 
     name <- gsub("^f", "fequency", name) 
     name <- gsub("([A]|[B]|[G]|[J]|[M])", "\\.\\1", name) 
     name <- gsub("\\-", "\\.", name) 
     name <- gsub("\\(\\)", "", name)
     tolower(name)
}

# Start here to run the analysis
Start <- function() { 
  # file paths 
  bpath <- "C:\\Users\\ankkn\\Desktop\\R\\kursus\\UCI HAR Dataset\\" 
  headersPath <- paste(bpath,"features.txt",sep="")
  activityLabelPath <- paste(bpath,"activity_labels.txt",sep="")
  trainPath <- paste(bpath,"train\\x_train.txt",sep="")
  trainSubjectPath <- paste(bpath,"train\\subject_train.txt",sep="")
  trainActivityPath <- paste(bpath,"train\\Y_train.txt",sep="")
  testPath <- paste(bpath,"test\\x_test.txt",sep="")
  testSubjectPath <- paste(bpath,"test\\subject_test.txt",sep="")
  testActivityPath <- paste(bpath,"test\\y_test.txt",sep="")

  # reading train and test files 
  trainDf <- ReadFile(trainPath) 
  testDf <- ReadFile(testPath) 
  
  # read activity names 
  activityLabels <- ReadFile(activityLabelPath) 
  trainLabels <- ReadFile(trainActivityPath) 
  testLabels <- ReadFile(testActivityPath) 
  
  # merge ids of activities with labels 
  trainLabels$V1 <- activityLabels[trainLabels$V1, 2] 
  testLabels$V1 <- activityLabels[testLabels$V1, 2] 
   
  # append train and test activity labels 
  labelsAll <- MergeDfs(trainLabels, testLabels, "activity") 
  labelsAll[, "activity"] <- as.factor(labelsAll[, "activity"]) 
     
  # read subjects
  trainSubjectIds <- ReadFile(trainSubjectPath) 
  testSubjectIds <- ReadFile(testSubjectPath) 
    
  # merge train and test subject into one data frame adding column name 
  subjectAll <- MergeDfs(trainSubjectIds, testSubjectIds, "subject") 
  
  # read label names 
  headersDf <- ReadFile(headersPath) 
  headers <- c(headersDf[, 2]) 
   
  # merging train and test adding fearture labels as headers 
  dfAll <- MergeDfs(trainDf, testDf, headers) %>% # Step 1. Merge the training and the test sets
       ExtractMeanStd %>% # Step 2. Mean and standard deviation for each measurement
       cbind(subjectAll) %>%  
       cbind(select(labelsAll, activity)) # Step 3. Descriptive activity names for activities 
        
  # Step 4. Appropriately labels the data set with descriptive variable names. 
  names(dfAll) <- RenameColumns(names(dfAll)) 
     
  # Step 5. Create a second, independent tidy data set with the average of 
  # each variable for each activity and each subject.
  tidy <- dfAll %>% 
       group_by(subject, activity) %>% 
       summarize_each(funs(mean)) 
       
  write.table(format(tidy, scientific=T), file = "tidy.txt", row.name=F) 
 
  tidy 
}