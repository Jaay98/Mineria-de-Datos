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

1. [Evaluation 4](#id1)


# Evaluation 4<a name="id1"></a>


#### Using library ggplot2 visualize the data of the dataset on a graph
```{r}
library(ggplot2)
```

#### Importing the dataset
```{r}
dataset <- read.csv(file.choose())
```

#### Show the head of the dataset
```{r}
head(dataset)
```

#### Make the scatterplot
```{r}
ggplot(dataset, aes(petal_length, petal_width )) + geom_point(aes(col=species), size=4)
```
![one image](https://github.com/Jaay98/Mineria-de-Datos/blob/Unit_4/Evaluation/Grafica1.PNG)

#### Set the center (means the number of groups we want to cluster), in this case we are going to use 3
```{r}
set.seed(101)
irisCluster <- kmeans(dataset[,1:4], center=3, nstart=20)
irisCluster
```

#### Compare the predicted clusters whit the original data
```{r}
table(irisCluster$cluster, dataset$species)
```

#### Plot the clusters
```{r}
library(cluster)
clusplot(iris, irisCluster$cluster, color=T, shade=T, labels=0, lines=0)
```
![two image](https://github.com/Jaay98/Mineria-de-Datos/blob/Unit_4/Evaluation/Grafica2.PNG)