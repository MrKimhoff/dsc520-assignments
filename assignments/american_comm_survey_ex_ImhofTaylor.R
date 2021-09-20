# Taylor Imhof
# Bellevue University | DSC 520
# Assignment 3.2 | American Community Survey Exercise
# 9/19/2021

# this file contains the code used to create the data and graphs necessary for 
# answering the questions for the American Community Survey Exercise portion of assignment 3.2

# load ggplot2 library and set theme to minimal
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/taylo/Desktop/Education/0Data Science/DSC520 Statistics for Data Science/Code/dsc520")

## Load the `acs-14-1yr-s0201.csv` to
survey_data <- read.csv("acs-14-1yr-s0201.csv")

# structure of survey data dataframe
str(survey_data)

# number of rows in survey data dataframe
nrow(survey_data) # --> 136 rows/observations/data points


# number of columns in survey data dataframe
ncol(survey_data) # --> 8 columns/categories/variables

## Create a histogram of the `HSDegree` variable using ggplot2 package
ggplot(survey_data, aes(HSDegree)) + geom_histogram(bins=50) +
  ggtitle("Population with HS Disploma") + 
  xlab("Percent") + 
  ylab("Frequency")

## add a normal distribution curve to the previous histogram
ggplot(survey_data, aes(HSDegree)) + geom_histogram(bins=50, aes(y=..density..)) +
  ggtitle("Population with HS Disploma") + 
  xlab("Percent") + 
  ylab("Frequency") +
  stat_function(fun=dnorm, 
                color='red', 
                args=list(mean=mean(survey_data$HSDegree),
                          sd=sd(survey_data$HSDegree)))

# create a probability plot of the HSDegree variable
ggplot(survey_data, aes(HSDegree)) + geom_density()

# load pastecs library to be able to use stat.desc() function
# use stat.desc() function to quantify normality
library(pastecs)
stat.desc(survey_data[,7], basic=TRUE, desc=TRUE, norm=TRUE, p = 0.95)
