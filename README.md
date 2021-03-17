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


 </h5>


### Index

1. [Practice 1](#id1)
2. [Practice 2](#id2)

##### Practice 1<a name="id1"></a>

Test the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1
Create an R script that will count how many of these numbers fall between -1 and 1 and divide
by the total quantity of N

1. Initialize sample size

~~~
size <- 1000000000
stdev <- 1
~~~
2. Initialize counter
~~~
counter <- 0
mean <- 0
~~~
3. loop for(i in rnorm(size))
~~~
for(i in rnorm(size,mean,stdev)){
~~~
4. Check if the iterated variable falls
~~~
  if(i>=-1 && i<=1)
~~~
5. Increase counter if the condition is true
~~~
    counter <- counter+1
}
~~~    
6. Return a result <- counter / N
~~~
result <- counter/size
result <- result*100
paste(format(round(result, 2), nsmall = 2),"%")
~~~

##### Practice 2<a name="id2"></a>