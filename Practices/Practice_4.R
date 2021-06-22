################################################## 
#                  Practice 4                    #
##################################################

#Choose the data set
dataset <- read.csv(file.choose())

head(dataset)

#Read the data set
dataset = dataset[3:5]

#Declare the factor = of the data set and read it
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

#Read library(caTools)
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
# Get scale out of training_set and test_set
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# # Get scale out of training_set and test_set
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

#Fitting randomForest to the Training set and Predicting the Test set results
library(randomForest)
noset.seed(123)
classifier = randomForest(x = training_set[-3],
                          y = training_set$Purchased,
                          ntree =10)

# Results prediction of test set--------------------------
y_pred = predict(classifier, newdata = test_set[-3])

y_pred
# Making the Matrix 
cm = table(test_set[, 3], y_pred)
cm

# We read the ElemStatLearn library
install.packages("ElemStatLearn")
library(ElemStatLearn)
#View training_set results x1, x2
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, grid_set)
plot(set[, -3],
     main = 'Random Forest Classification (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add =
          TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3',
                                         'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
## We read the ElemStatLearn library
library(ElemStatLearn)
#View test_set results x1, x2
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, grid_set)
plot(set[, -3], main = 'Random Forest Classification (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add =
          TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3',
                                         'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
#classifying the trees
plot(classifier)

