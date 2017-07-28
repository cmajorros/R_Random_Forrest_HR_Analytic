
DataSet <- read.csv("HR.csv")
head(DataSet)
str(DataSet)

#convert continue factors to categories factors
DataSet$left <- as.factor(DataSet$left)
DataSet$promotion_last_5years <- as.factor(DataSet$promotion_last_5years)
DataSet$Work_accident <- as.factor(DataSet$Work_accident)

# Data Patition 
set.seed(123)
ind <- sample(2,nrow(DataSet), replace = TRUE, prob = c(0.7, 0.3))
train <- DataSet[ind == 1,]
test <- DataSet[ind == 2,]

# Random Forest Model
library(randomForest)
set.seed(123)
rf <- randomForest(left~., data = train)
rf
### from the default mtry = 3 , No. of trees = 500 ,OOB error rate = 0.83 (for classification)

#Create Confusion Matrix 
library(caret)
Predict_Train <- predict(rf, train)
confusionMatrix(Predict_Train, train$left)
## Result for accuracy is 0.9998 

#Predict testing data and create confusion matrix
Predict_Test <- predict(rf, test)
confusionMatrix(Predict_Test, test$left)
### Notice that accuracy is declined

# check the error rate and the optimal number of trees 
plot(rf)
### from the plot 80 trees or 100 trees seems to be the optimal tree used in rf model

## tuning rf model
NewRF <- tuneRF(train[-10], train[10], stepFactor =  1, plot = TRUE, ntreeTry = 90, trace =  TRUE, improve = 0.05)

# plot histogram Number of Nodes in trees
hist(treesize(rf), main = "Nodes of Random Forest")
#From the plot most of tree are grow with at 90 nodes

#Variable Importance
varImpPlot(rf)
## from plot , seem like department, salary, work accident , promotion_last_5years is less importance
importance(rf) ## show importance of variable
varUsed(rf) ##show number of using of variable


