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
2. [Evaluation 2](#id2)

##### Practice 1<a name="id1"></a>

# Export library ggplot2
```{r}
library(ggplot2)
```

# Import the dataframe
```{r}
TestData <- read.csv(file.choose())
head(TestData)
```

# TestData its a dataframe?
```{r}
is.data.frame(TestData)

head(TestData)
```

# People who use less then 11 hours per day in personal care
```{r}
Personal_care <- TestData$Personal.care <= 11
Personal_care
is.data.frame(dfcare)
dfcare<-TestData[Personal_care,]
```

# Graphic 1
# Relation Between personal care and household management
```{r}
ggplot(data=dfcare)+ geom_point(mapping = aes(x =Personal.care , y =Household.management.and.help.family.member, color=SEX ))
```

# Graphic 2
# Relation between sleep  and school by country 
```{r}
ggplot(data = TestData) + geom_point(mapping = aes(x = Sleep , y = School.and.university.except.homework )) + facet_wrap(~ GEO.ACL00, nrow = 2)
```

# Graphic 3
# Relation between Homework  and school 
```{r}
ggplot(data = TestData) + geom_bar(mapping = aes(x = Homework, fill = Dish.washing))
```