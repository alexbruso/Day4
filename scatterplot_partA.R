#####################################
##### Do NOT delete this block #####
setwd(Sys.getenv('PROJECT_HOME'))
####################################

####################################
## write code to read input csv into data frame
df <- read.csv('data.csv')
####################################

## start writing your R code from here



library(ggplot2)
cleanData <- na.omit(df)


# Create a scatter plot, where x is the hotel condition,
#     y is the ltr. Remember to use jitter


scat_plot <- ggplot(cleanData)
scat_plot <- scat_plot + aes(x=Condition_Hotel_H, y=Likelihood_Recommend_H )

scat_plot <-scat_plot + geom_point() + geom_jitter()
## end your R code and logic 

####################################
##### write output file ############
write.csv(df, file = 'data.csv')
####################################


