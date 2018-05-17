#####################################
##### Do NOT delete this block #####
setwd(Sys.getenv('PROJECT_HOME'))
####################################

####################################
## write code to read input csv into data frame
df <- read.csv('part_C_output.csv')
####################################

## start writing your R code from here
svmOutput2 <- ksvm(isDetractor~Condition_Hotel_H+Staff_Cared_H, data=trainData, C=5, prob.model=TRUE)

svmPred2 <- predict(svmOutput2, testData[1650,], type="votes")
compTable2 <- data.frame(testData[1650,60],svmPred2[1,])

sample1 <- replicate(table(compTable2),1000)
sample1
## end your R code and logic 

####################################
##### write output file ############
write.csv(df, file = 'part_d_output.csv')
####################################



