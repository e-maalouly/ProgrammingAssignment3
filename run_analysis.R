run_analysis <- function() {
  
  # import training and test datasets
  df_X_train <- read.table("./data/train/X_train.txt")
  df_X_test <- read.table("./data/test/X_test.txt") 
  
  df_Y_train <- read.table("./data/train/y_train.txt", col.names = "activity")
  df_Y_test <- read.table("./data/test/y_test.txt", col.names = "activity")
  
  df_subj_train <- read.table("./data/train/subject_train.txt", col.names = "subject")
  df_subj_test <- read.table("./data/test/subject_test.txt", col.names = "subject")
  
  # merge the X training and test datasets into one
  df_X <- rbind(df_X_train, df_X_test)
  # merge the Y training and test vector into one
  df_Y <- rbind(df_Y_train, df_Y_test)
  # merge the subject training and test vector into one
  df_subj <- rbind(df_subj_train, df_subj_test)
  # merge the X and Y datasets into one
  df <- cbind(df_subj, df_Y, df_X)
  
  # read column names and assign the names to the dataset columns
  col_names <- read.table("data/features.txt")
  names(df)[-c(1,2)] <- col_names[,2]
  
  # extract only mean and standard deviation measurements
  # while preserving the activity column
  df <- df[,c(1,2,grep("mean\\(\\)|std\\(\\)", names(df)))]
  
  # activities are changed to factors with descriptive names
  activities <- c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing","laying")
  df$activity <- factor(df$activity, levels = 1:6, labels = activities)
  
  # remove hyphens and parantheses from variable names
  names(df) <- gsub("-|\\(\\)", "", names(df))
  
  # calculating the averages of each variable for each activity and subject
  df_means <- df %>% group_by(subject, activity) %>% summarise_at(-c(1,2), mean)
  
  write.table(df_means, "./tidydata.txt", row.names = FALSE)

}
