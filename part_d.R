#####################################
##### Do NOT delete this block #####
setwd(Sys.getenv('PROJECT_HOME'))
####################################

####################################
## write code to read input csv into data frame
df <- read.csv('data.csv')
####################################

## start writing your R code from here

NPSPred <- function(test, train) 
{
  
  svmOutput1 <- ksvm(isDetractor ~ Condition_Hotel_H, data=train, C=5, prob.model = TRUE)
  svmOutput2 <- ksvm(isDetractor ~ Condition_Hotel_H + Staff_Cared_H, data=train, C=5, prob.model = TRUE)
  
  svmPred <- predict(svmOutput1, test, type="votes")
  svmPred2 <- predict(svmOutput2, test, type="votes")
  
  org <- as.character(test[,60])
  pred1 <- ifelse(svmPred1[1] == 1, 'detractor', 'not_detractor')
  pred2 <- ifelse(svmPred2[1] == 1, 'detractor', 'not_detractor')
  
  pred <- data.frame(org, pred1, pred2)
  
  return(pred)
}
isDetractor <- (df$Likelihood_Recommend_H < 7)
df<- cbind(df, isDetractor)

# with 1000 random samples
randIndex  <- sample(c(1:dim(df)[1]))

allDet <- df[df$isDetractor== 'detractor',]
allNonD <- df[df$isdetractor == 'not_detractor',]

randIndex1 <- sample(c(1:dim(allDet)[1]))
randIndex2 <- sample(c(1:dim(allNonD)[1]))

allDet <- allDet[randIndex1,]
allNonD <- allNonD[randIndex2,]

#assign the detractors and non detractors to respective data groups
testData1  <- allDet[1:300,]
testData1[301:1000,] <- allNonD[1:700,]
trainData1  <- allDet[301:900,]
trainData1[601:2000,] <- allNonD[701:2100,]

pred <- NPSPred(testData1, trainData1)

pred1 <- sum(as.character(pred$org) == as.character(pred$pred1))/length(pred$org)
pred2 <- sum(as.character(pred$org) == as.character(pred$pred2))/length(pred$org)


## end your R code and logic 

####################################
##### write output file ############
# add your R code to write output file
####################################


