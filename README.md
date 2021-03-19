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
2. [Practice 2](#id2)
3. [Practice 3](#id3)

##### Practice 1<a name="id1"></a>

Test the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1
Create an R script that will count how many of these numbers fall between -1 and 1 and divide
by the total quantity of N

1. Initialize sample size
```{r}
size <- 1000000000
stdev <- 1
```

2. Initialize counter
```{r}
counter <- 0
mean <- 0
```

3. loop for(i in rnorm(size))
```{r}
for(i in rnorm(size,mean,stdev)){
```

4. Check if the iterated variable falls
```{r}
  if(i>=-1 && i<=1)
```

5. Increase counter if the condition is true
```{r}
    counter <- counter+1
}
``` 

6. Return a result <- counter / N
```{r}
result <- counter/size
result <- result*100
paste(format(round(result, 2), nsmall = 2),"%")
```

##### Practice 2<a name="id2"></a>

Functions
Practice find 20 more functions in R and make an example of it.

1. Join values
```{r}
x <- c(1,2,3)
t <- c("uno","dos","tres")
x; t
```

2. Square root
```{r}
sqrt(5)
```

3. Displays the number of elements in a vector
```{r}
x <- 1:20  
length(x) 
```

4. Remove decimals from a number
```{r}
trunc(1.999999)
```

5. Generate n random numbers between start and end. If start and end are not indicated, they are generated between 0 and 1
```{r}
runif(5)
```

6. Add all the elements of a vector x
```{r}
x <- runif(100,1,10) 
sum(x) 
```

7. Returns T if any element meets the condition
```{r}
x <- runif(10, -10 ,100)
if(any(x < 0)) cat("In x there are negative numbers\n")
```

8. Hide x in the return function so that the result is not seen. x can still be assigned even if it doesn't appear
```{r}
suma <- function(a, b) {
  s <- a + b
  return(invisible(s))
}

suma(5,4)

x <- suma(5,4)
x
```

9. This function writes text and variables to the output.
```{r}
x <- 2
y <- 4
cat(x,"elevado a",y,"es",x ^ y,"\n")
```

10. Allows you to assign names to the elements of a variable
```{r}
x <- c(2,4,6)
names(x) <- c("I","II","III") 
x
```

11. The '...' argument (without the quotes) allows you to pass a variable number of arguments to a function.
```{r}
inverso <- function(...) {
  v <- unlist(list(...)) 
  x <- 1/v
  return(x)
}
inverso(8)
```

12. Given a list structure x, unlist simplifies it to produce a vector which contains all the atomic components which occur in x.
```{r}
l1 <- list(a = "a", b = 2, c = pi+2i)
unlist(l1) # a character vector
l2 <- list(a = "a", b = as.name("b"), c = pi+2i)
unlist(l2) # remains a list
```

13. Takes the absolute value of x
```{r}
abs(-4.7)	
```
14. Takes the logarithm of x with base y; if base is not specified, returns the natural logarithm
```{r}
log(5,base=9)
```

15. Returns the factorial of x (x!)
```{r}
factorial(7)
```
16. Functions can be used to find the lowest or highest number in a set:
```{r}
max(5, 10, 15)
```
17. 
```{r}
min(5, 10, 15)
```
18. Function rounds a number upwards to its nearest integer
```{r}
ceiling(1.4)
```

19. Function rounds a number downwards to its nearest integer
```{r}
floor(1.4)
```
20. Uppercase
```{r}
data <- "Text"
toupper(data)	
```



##### Practice 3<a name="id3"></a>
