<h1>Tecnológico Nacional de México</h1>
<h5 style="text-align: center;"> Instituto Tecnológico de Tijuana 

Subdirección Académica 
Departamento de Sistemas y Computación 

Semestre: Febrero - Julio 2021

Materia:
Mineria de Datos

Profesor: 
Jose Christian Romero Hernandez

Alumno: 
17210526 Alvarez Yanez Jose Alonso
13211397 Briseño Cota Raúl Omar


 </h5>


### Index

1. [Practice 1](#id1)
1. [Practice 2](#id2)
1. [Practice 3](#id3)
1. [Practice 4](#id4)
2. [Evaluation 3](#id5)

##### Practice 1<a name="id1"></a>

# Using library ggplot2 visualize the data of the dataset on a graph
```{r}
library(ggplot2)
```

# Importing the dataset
```{r}
dataset <- read.csv(file.choose())
head(dataset)

dataset <- dataset[, 3:5]
```

# Splitting the dataset into the Training set and Test set
Install.packages('caTools')
```{r}
library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```

# Feature scaling
```{r}
training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])
```

# Fitting Logistic Regression to Training set
```{r}
classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)
```

# Predicting the Test set results
```{r}
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred
```

# Making the Confusion Metrix
```{r}
cm = table(test_set[, 3], y_pred)
cm
```

# Visualize data for training set of estimated salary on 'x' and purchased on 'y'
```{r}
ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```

# Visualize data for training set of Age on 'x' and purchased on 'y'
```{r}
ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```

# Visualize data for test set of estimated salary on 'x' and purchased on 'y' 
```{r}
ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```

# Visualize data for test set of Age on 'x' and purchased on 'y'
```{r}
ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```

# Visualization the Training set result
install.packages('ElemStatLearn') No work for me, 
manual mode. Go to this URL https://cran.r-project.org/src/contrib/Archive/ElemStatLearn/
Download with the latest date 2019-08-12 09:20	12M
Then follow this page steps https://riptutorial.com/r/example/5556/install-package-from-local-source

# Import library ElemStatLearn
```{r}
library(ElemStatLearn)
```

# In this part we are using the training set to a new graph to visualize the training set results
```{r}
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
```

# Give a name at the columns to use and predict also set the limit of the plot and other settings
```{r}
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

#  Import library ElemStatLearn
```{r}
library(ElemStatLearn)
```

# In this part we are using the training set to a new graph to visualize the test set results
```{r}
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
```

# Give a name at the columns to use and predict also set the limit of the plot and other settings
```{r}
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

![one image](https://github.com/Jaay98/Mineria-de-Datos/blob/Unit_3/Practices/Practice1.PNG)

##### Practice 2<a name="id2"></a>

# Importing the dataset
```{r}
dataset <- read.csv(file.choose())
head(dataset)
dataset = dataset[3:5]
```

# Encoding the target feature as factor
```{r}
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```

# Splitting the dataset into the Training set and Test set
```{r}
install.packages('class')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```

# Feature Scaling
```{r}
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```

# Fitting K-NN to the Training set and Predicting the Test set results
```{r}
library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5,
             prob = TRUE)
```

# Making the Confusion Matrix
```{r}
cm = table(test_set[, 3], y_pred)
```

# Visualising the Training set results
```{r}
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

# Visualising the Test set results
```{r}
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

##### Practice 3<a name="id3"></a>

# Decision Tree Classification
# Importing the dataset
```{r}
dataset <- read.csv(file.choose())

head(dataset)
dataset = dataset[3:5]
```

# Encoding the target feature as factor
```{r}
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```

# Splitting the dataset into the Training set and Test set
```{r}
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```

# Feature Scaling
```{r}
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```

# Fitting Decision Tree Classification to the Training set
```{r}
install.packages('rpart')
library(rpart)
classifier = rpart(formula = Purchased ~ .,
                   data = training_set)
```

# Predicting the Test set results
```{r}
y_pred = predict(classifier, newdata = test_set[-3], type = 'class')
y_pred
```

# Making the Confusion Matrix
```{r}
cm = table(test_set[, 3], y_pred)
cm
```

# Visualising the Training set results import library ElemStatLearn
```{r}
library(ElemStatLearn)
```

# In this part we are using the training set to a new graph to visualize the training set results
```{r}
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
```

# Give a name at the columns to use and predict also set the limit of the plot and other settings
```{r}
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3],
     main = 'Decision Tree Classification (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

# Visualising the Test set results import library ElemStatLearn
```{r}
library(ElemStatLearn)
```

# In this part we are using the training set to a new graph to visualize the training set results
```{r}
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
```

# Give a name at the columns to use and predict also set the limit of the plot and other settings
```{r}
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3], main = 'Decision Tree Classification (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

# Plotting the tree to visualize the results of Decision tree classifier
```{r}
plot(classifier)
text(classifier, cex=0.6)
```

##### Practice 4<a name="id4"></a>

# Choose the data set
```{r}
dataset <- read.csv(file.choose())

head(dataset)
```

# Read the data set
```{r}
dataset = dataset[3:5]
```

# Declare the factor = of the data set and read it
```{r}
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```

# Read library(caTools)
```{r}
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
```

# Get scale out of training_set and test_set
```{r}
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```

# Get scale out of training_set and test_set
```{r}
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```

# Fitting randomForest to the Training set and Predicting the Test set results
```{r}
library(randomForest)
noset.seed(123)
classifier = randomForest(x = training_set[-3],
                          y = training_set$Purchased,
                          ntree =10)
```

# Results prediction of test set--------------------------
```{r}
y_pred = predict(classifier, newdata = test_set[-3])

y_pred
```

# Making the Matrix 
```{r}
cm = table(test_set[, 3], y_pred)
cm
```

# We read the ElemStatLearn library
```{r}
install.packages("ElemStatLearn")
library(ElemStatLearn)
```

# View training_set results x1, x2
```{r}
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
```

# We read the ElemStatLearn library
```{r}
library(ElemStatLearn)
```

# View test_set results x1, x2
```{r}
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
```

# Classifying the trees
```{r}
plot(classifier)
```

##### Evaluation 3<a name="id5"></a>

# Import the dataset
```{r}
#Set the dataset and put the vector size
dataset <- read.csv(file.choose())

#Show the head of the dataset
head(dataset)

dataset <- dataset[, 3:5]
```
```{r}
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
#Read caTools
library(caTools)
```

# Split the traning and test set
```{r}
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```

# Use Library E1071
```{r}
# install.packages(e1071)
library(e1071)
classifier = naiveBayes(x = training_set[-3],y = training_set$Purchased)
```

# Predict test set results
```{r}
y_pred = predict(classifier, newdata = test_set[-3])
y_pred

cm = table(test_set[, 3], y_pred)
cm
```

# Training set conding
```{r}
#Import the library ElemStatLearn
library(ElemStatLearn)
set = training_set
```

# Declare the training set in a new graph to be able to visualize the result of the training set
```{r}
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)

colnames(grid_set) = c('Age', 'EstimatedSalary')
```

# Use the training set in new graph to be able to visualize the results of the training set
```{r}
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'Naive Bayes (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

# Test set codign in parts an use the vector
```{r}
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'Naive Bayes (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```