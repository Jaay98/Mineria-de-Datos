################################################## 
#                  Practice 1                    #
##################################################


# Using library ggplot2 visualize the data of the dataset on a graph
library(ggplot2)


# Importing the dataset
dataset <- read.csv(file.choose())
head(dataset)


dataset <- dataset[, 3:5]

# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Feature scaling
training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])

# Fitting Logistic Regression to Training set
classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)

# Predicting the Test set results
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred

# Making the Confusion Metrix
cm = table(test_set[, 3], y_pred)
cm



# Visualize data for training set of estimated salary on 'x' and purchased on 'y'
ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

# Visualize data for training set of Age on 'x' and purchased on 'y'
ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

# Visualize data for test set of estimated salary on 'x' and purchased on 'y' 
ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

# Visualize data for test set of Age on 'x' and purchased on 'y'
ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

# Visualization the Training set result
# install.packages('ElemStatLearn') No work for me, 
# manual mode. Go to this URL https://cran.r-project.org/src/contrib/Archive/ElemStatLearn/
# Download with the latest date 2019-08-12 09:20	12M
# Then follow this page steps https://riptutorial.com/r/example/5556/install-package-from-local-source

# Import library ElemStatLearn
library(ElemStatLearn)

# In this part we are using the training set to a new graph to visualize the training set results
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)

#Give a name at the columns to use and predict also set the limit of the plot and other settings
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

#  Import library ElemStatLearn
library(ElemStatLearn)

# In this part we are using the training set to a new graph to visualize the test set results
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)

#Give a name at the columns to use and predict also set the limit of the plot and other settings
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

=======
# Export library ggplot2

library(ggplot2)

# IMport the dataframe
TestData <- read.csv(file.choose())
head(TestData)

#TestData its a dataframe?
is.data.frame(TestData)

head(TestData)

# People who use less then 11 hours per day in personal care

Personal_care <- TestData$Personal.care <= 11
Personal_care
is.data.frame(dfcare)
dfcare<-TestData[Personal_care,]


# Graphic 1
#Relation Between personal care and household management
ggplot(data=dfcare)+ geom_point(mapping = aes(x =Personal.care , y =Household.management.and.help.family.member, color=SEX ))


#Graphic 2
#Relation between sleep  and school by country 
ggplot(data = TestData) + geom_point(mapping = aes(x = Sleep , y = School.and.university.except.homework )) + facet_wrap(~ GEO.ACL00, nrow = 2)


#Graphic 3
#Relation between Homework  and school 
ggplot(data = TestData) + geom_bar(mapping = aes(x = Homework, fill = Dish.washing))

