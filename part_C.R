#####################################
##### Do NOT delete this block #####
setwd(Sys.getenv('PROJECT_HOME'))
####################################

####################################
## write code to read input csv into data frame
df <- read.csv('data.csv')
####################################

library(kernlab)
## start writing your R code from here

#create a column that has a true of false value for L2T Values less than 7 and assign to new column
isDetractor <- (df$Likelihood_Recommend_H < 7)
df<- cbind(df, isDetractor)

#Create New Data Frame
cleanDataFrame <- data.frame(dfClean$Likelihood_Recommend_H, dfClean$Condition_Hotel_H, dfClean$Staff_Cared_H)
cleanDataFrame



randIndex <- sample(1:dim(df)[1])
summary(randIndex)

length(randIndex)
head(randIndex)

#create 2/3 cut off point then verify
cutPoint2_3 <- floor(2*dim(df)[1]/3)
cutPoint2_3

#create training data set
trainData <- df[randIndex[1:cutPoint2_3],]

#create test data set
testData <- df[randIndex[(cutPoint2_3+1):dim(df)[1]],]

#View training data and test data
trainData
testData

#df$Condition_Hotel_H <- as.factor(df$Condition_Hotel_H)

#Testing on the 1650 survey 
svmOutput <- ksvm(isDetractor~Condition_Hotel_H,data=trainData, C=5, prob.model=TRUE)

svmPred <- predict(svmOutput, testData[1650,], type="votes")
compTable <- data.frame(testData[1650,61],svmPred[1,])
table(compTable)

df <- df[!is.na(df$Staff_Cared_H), ]

#Testing on the 1650 survey
svmOutput2 <- ksvm(isDetractor~Condition_Hotel_H+Staff_Cared_H, data=trainData, C=5, prob.model=TRUE)

svmPred2 <- predict(svmOutput2, testData[,], type="votes")
compTable2 <- data.frame(testData[,61],svmPred2[1,])
table(compTable2)
## end your R code and logic 

####################################
##### write output file ############
write.csv(df, file = 'part_C_output.csv')
####################################



