# Dataset taken from Kaggle competition website: https://www.kaggle.com/teejmahal20/airline-passenger-satisfaction

# Load libraries needed for this exercise
library(readr)

# load the airline dataset
airline <- read_csv("airline.csv")

# view the airline dataset
View(airline)

# customer satisfaction is divided between two values: neutral or dissatisfied OR satisfied
# we have to convert this to 0 and 1
# first create a new column called satisfaction_numeric and fill with zeroes
airline$satisfaction_numeric <- 0
View(airline)

airline[airline$satisfaction == "neutral or dissatisfied",]$satisfaction_numeric = 0
airline[airline$satisfaction == "satisfied",]$satisfaction_numeric = 1
View(airline)

# run logistic regression using one variable (seat comfort) as a predictor variable
logit_satisfaction <- glm(airline$satisfaction_numeric ~ airline$`Seat comfort`, family = "binomial")
summary(logit_satisfaction)

# run logistic regression using two variables as a predictor variables
logit_satisfaction <- glm(airline$satisfaction_numeric ~ airline$`Seat comfort` + airline$`Inflight wifi service`, family = "binomial")
summary(logit_satisfaction)
