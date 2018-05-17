#####################################
##### Do NOT delete this block #####
setwd('C:/stigmergy/Day4')
####################################

####################################
## write code to read input csv into data frame
df <- read.csv('data.csv')
####################################

## start writing your R code from here

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
## end your R code and logic 

####################################
##### write output file ############
write.csv(df, file = 'part_a_model2_output.csv')
####################################



