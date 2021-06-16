################################################## 
#                  Evaluation 4                  #
##################################################

# Using library ggplot2 visualize the data of the dataset on a graph
library(ggplot2)

# Importing the dataset
dataset <- read.csv(file.choose())

#Show the head of the dataset
head(dataset)

#Make the scatterplot
ggplot(dataset, aes(petal_length, petal_width )) + geom_point(aes(col=species), size=4)


#Set the center (means the number of groups we want to cluster), in this case
#We are going to use 3
set.seed(101)
irisCluster <- kmeans(dataset[,1:4], center=3, nstart=20)
irisCluster

#Compare the predicted clusters whit the original data
table(irisCluster$cluster, dataset$species)

#Plot the clusters
library(cluster)
clusplot(iris, irisCluster$cluster, color=T, shade=T, labels=0, lines=0)
