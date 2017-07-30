# R_Random_Forrest_HR_Analytic

Hi!
In this project I got the data set from Kaggle (https://www.kaggle.com/velinovvladi/why-employees-leave-and-how-to-predict-it/data).
This model aim to predict who is going to leave the company. I applied Random Forrest Technique with this model. The steps I have done are:
1) Importing data and transform some factor to appropriate types of data.
2) Split the data for training and testing with the proportion 70 and 30. 
3) Create the model by using the default value without adjusting the number of trees
4) Create confusion matrix for Training set and test set
5) plot the model to see the number of optimal trees
6) Tuning the model by specifying the new number of trees and the value of improvement
7) plot the size of nodes are commonly used in each trees
8) Investigate the importance of each varible.

From the result, I think the model is quite accurate without tuning the model because statistical measurement was satisfy and tuning does not improve the value so much. 
However, I have not added other kind of model like logistic regression and decision tree and compare the result among all models yet.  

Have a nice day
Ros
