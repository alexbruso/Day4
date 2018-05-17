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

hotelDataB <- newHotelData
# what is the 10th value in hotelDataB? #what's the likelihood to recommend? (it's 10)
hotelDataB[10, 29]
hotelDataB[10, 33]
hotelDataB[10, 35]



# Staff_Cared_H = 10, Condition_Hotel_H = 10, staffperCond = 1

modelB1 <- lm(formula = Likelihood_Recommend_H  ~ staffPerCond, data= hotelDataB)
plot(newHotelData$staffPerCond,newHotelData$Likelihood_Recommend_H )

placeholderB <- 1

testB1 = data.frame(staffperCond = placeholderB)
predict(modelB1, testB1, type="response")



## end your R code and logic 

####################################
##### write output file ############
# add your R code to write output file
####################################


