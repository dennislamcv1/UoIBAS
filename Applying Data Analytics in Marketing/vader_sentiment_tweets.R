# Load the libraries needed for running vader in pulling in CSV files
library(readr)
library(vader)

# Load the tweet csv file
Apple <- read_csv("AtApple.csv")
View(Apple)

# Initialize a list of VADER scores with the compound score of the first tweet
vscores <- rep(as.numeric(get_vader(Apple[1,4])[2]), 1)

# Determine how many tweets you want to analyze sentiment for and assign y to that value
y = 30

# Run a for loop through y number of tweets to get y number of compound VADER sentiment scores for the tweets
for (x in 1:y) {
  vscores <- c(vscores,as.numeric(get_vader(Apple[x,4])[2]))
}

# Display the vscores
vscores

# Find the average of the sentiment scores
mean(vscores)