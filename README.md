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
![one image](https://github.com/Jaay98/Mineria-de-Datos/blob/Unit_2/Practices/Captura.PNG)

# Graphic 2
# Relation between sleep  and school by country 
```{r}
ggplot(data = TestData) + geom_point(mapping = aes(x = Sleep , y = School.and.university.except.homework )) + facet_wrap(~ GEO.ACL00, nrow = 2)
```
![two image](https://github.com/Jaay98/Mineria-de-Datos/blob/Unit_2/Practices/Captura2.PNG)

# Graphic 3
# Relation between Homework  and school 
```{r}
ggplot(data = TestData) + geom_bar(mapping = aes(x = Homework, fill = Dish.washing))
```
![three image](https://github.com/Jaay98/Mineria-de-Datos/blob/Unit_2/Practices/Captura3.PNG)

##### Evaluation 2<a name="id2"></a>

# Recreate the code for the generation of the following graph
![four image](https://github.com/Jaay98/Mineria-de-Datos/blob/Unit_2/Evaluation/Captura.PNG)

# Export the library ggplot2
```{r}
library(ggplot2)
```

# Import the dataframe
```{r}
df <- read.csv(file.choose())
head(df)
```

# Rename columns name
```{r}
colnames(df) <- c("Day_Week","Director","Genre","Title","Release_Date","Studio","Adjusted_Gross","Budget","Gross","IMDb_Rating","MovieLens_Rating","Overseas","Overseas%","Profit","Profit%","Runtime","US_dlls","GrossPor")
```

# Delete useles data
```{r}
filter <- (df$Genre=="action" | df$Genre=="adventure" | df$Genre=="animation" | df$Genre=="comedy" | df$Genre=="drama") & (df$Studio=="Buena Vista Studios" | df$Studio=="Fox" | df$Studio=="Paramount Pictures" | df$Studio=="Sony" | df$Studio=="Universal" | df$Studio=="WB")

filter_df <-df[filter,]
```

# Show the new df
```{r}
head(filter_df)
```

# Show graph
```{r}
u <- ggplot(filter_df, aes(x=Genre, y=GrossPor, color=Studio, size=Budget))

u + geom_jitter(aes(color=Studio,size=Budget)) + geom_boxplot(size=0.5,alpha=0.5,color="Black",outlier.shape = NA)+ theme(
  plot.title = element_text(color="Black", size=16, hjust = 0.5),
  axis.title.x = element_text(color="purple", size=16),
  axis.title.y = element_text(color="purple", size=16)
)  +  ggtitle("Domestic Gross % by Genre") + ylab("Gross %US")  
```

![five image](https://github.com/Jaay98/Mineria-de-Datos/blob/Unit_2/Evaluation/Captura2.PNG)