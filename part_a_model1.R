#####################################
##### Do NOT delete this block #####
setwd('C:/stigmergy/Day4')
####################################

####################################
## write code to read input csv into data frame
df <- read.csv('data.csv')
####################################

## start writing your R code from here

## end your R code and logic 

####################################
##### write output file ############
write.csv(df, file = 'part_a_model1_output.csv')
####################################

#Build a linear model, trying to predict ltr based on the hotel condition

hotelData <- cleanData

modelA1 <- lm(formula = hotelData$Condition_Hotel_H ~ hotelData$Likelihood_Recommend_H, data= hotelData)

plot(hotelData$Condition_Hotel_H,hotelData$Likelihood_Recommend_H)

abline(modelA1)
summary(modelA1)

#Build a linear model that predicts ltr based on the hotel condition and the staff_cared attributes


# creates a number based on the ratio between staff care and the hotel condition
staffPerCond <- hotelData$Staff_Cared_H / hotelData$Condition_Hotel_H 
# rounds that number
staffPerCond <- round(staffPerCond, digits=2)

# puts the numbere into a new data frame
staffPerCond <- data.frame(staffPerCond) 
# combines the new data frame with the hotelData to create a new hotelData dataframe with my new number
newHotelData <- cbind(hotelData, staffPerCond)

#generating the linear regression formula 
modelA2 <- lm(formula = Likelihood_Recommend_H  ~ staffPerCond, data= newHotelData)

plot(newHotelData$staffPerCond,newHotelData$Likelihood_Recommend_H )

abline(modelA2)
summary(modelA2)

#compare the two models 


# 
# Call:
#   lm(formula = hotelData$Condition_Hotel_H ~ hotelData$Likelihood_Recommend_H, 
#      data = hotelData)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -4.8174 -0.5520  0.3542  0.3542  3.6357 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)                       4.17665    0.22895   18.24   <2e-16 ***
#   hotelData$Likelihood_Recommend_H  0.54692    0.02544   21.50   <2e-16 ***
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 1.015 on 571 degrees of freedom
# Multiple R-squared:  0.4474,	Adjusted R-squared:  0.4464 
# F-statistic: 462.2 on 1 and 571 DF,  p-value: < 2.2e-16
# 

# 
# Call:
#   lm(formula = Likelihood_Recommend_H ~ staffPerCond, data = newHotelData)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -8.3748 -0.7519  0.3787  1.1275  2.1321 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)    9.8771     0.2452  40.274  < 2e-16 ***
#   staffPerCond  -1.0046     0.2291  -4.384 1.38e-05 ***
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 1.642 on 571 degrees of freedom
# Multiple R-squared:  0.03257,	Adjusted R-squared:  0.03088 
# F-statistic: 19.22 on 1 and 571 DF,  p-value: 1.384e-05
#



#Test the better model with hotel condition of 4 and staff cared value of 4;
# my staffPerCond value is 1
#what is the predicted LTR


testA2 = data.frame(staffPerCond = 1)
predict(modelA2, testA2, type="response")
# my test predicts the ltr will be 8.872466, when the hotel condition and staff cared value is 4