#####################################
##### Do NOT delete this block #####
setwd(Sys.getenv('PROJECT_HOME'))
####################################

####################################
## write code to read input csv into data frame
df <- read.csv('part_a_model2_output.csv')
####################################

## start writing your R code from here

#Test the model with values of the attributes from the 10th element of 
#your dataframe, and see if the model predicts a detractor. 
#How does the prediction compare to the actual value (which you have in the dataframe)

hotelDataB <- cleanData

# the regression that I'll use to make my predictions
modelA2 <- lm(formula = Likelihood_Recommend_H  ~ staffPerCond, data= newHotelData)



testB1 = data.frame(staffPerCond = 1)
predict(modelA2, testB1, type="response")

prediction1<- predict(modelA2, testA2, type="response")

# my test predicts the ltr will be 8.872466, when the hotel condition and staff cared value is 4

#In the code, show if the model is predicting a detractor or not


if (prediction1 <6) "Detractor" else "Not a detractor"



## end your R code and logic 

####################################
##### write output file ############
# add your R code to write output file
####################################


