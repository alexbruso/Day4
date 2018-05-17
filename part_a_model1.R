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


#Build a linear model that predicts ltr based on the hotel condition and the staff_cared attributes


  
staffPerCond <- hotelData$Staff_Cared_H / hotelData$Condition_Hotel_H
staffPerCond <- round(staffPerCond, digits=2)

staffPerCond <- data.frame(staffPerCond) 
newHotelData <- cbind(hotelData, staffPerCond)


modelA2 <- lm(formula = Likelihood_Recommend_H  ~ staffPerCond, data= newHotelData)

plot(newHotelData$staffPerCond,newHotelData$Likelihood_Recommend_H )

abline(modelA2)



