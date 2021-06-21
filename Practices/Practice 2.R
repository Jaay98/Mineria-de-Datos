################################################## 
#                   Practice 2                   #
##################################################

#Functions
#Practice find 20 more functions in R and make an example of it.


#1. Join values

x <- c(1,2,3)
t <- c("uno","dos","tres")
x; t

#2.Square root

sqrt(5)

#3. Displays the number of elements in a vector

x <- 1:20  
length(x)  

#4. Remove decimals from a number

trunc(1.999999)

#5.Generate n random numbers between start and end. If start and end are not indicated, they are generated between 0 and 1
runif(5) 

#6. Add all the elements of a vector x

x <- runif(100,1,10) 
sum(x) 

#7.Returns T if any element meets the condition

x <- runif(10, -10 ,100)
if(any(x < 0)) cat("In x there are negative numbers\n")

#8.Hide x in the return function so that the result is not seen. x can still be assigned even if it doesn't appear

suma <- function(a, b) {
  s <- a + b
  return(invisible(s))
}

suma(5,4)

x <- suma(5,4)
x

#9.This function writes text and variables to the output.

x <- 2
y <- 4
cat(x,"elevado a",y,"es",x ^ y,"\n")


#10. Allows you to assign names to the elements of a variable

x <- c(2,4,6)
names(x) <- c("I","II","III") 
x

#11. The '...' argument (without the quotes) allows you to pass a variable number of arguments to a function.
inverso <- function(...) {
  v <- unlist(list(...)) 
  x <- 1/v
  return(x)
}
inverso(8)


#12. Given a list structure x, unlist simplifies it to produce a vector which contains all the atomic components which occur in x.
l1 <- list(a = "a", b = 2, c = pi+2i)
unlist(l1) # a character vector
l2 <- list(a = "a", b = as.name("b"), c = pi+2i)
unlist(l2) # remains a list

#13. 	Takes the absolute value of x

abs(-4.7)	

#14. Takes the logarithm of x with base y; if base is not specified, returns the natural logarithm

log(5,base=9)


#15. Returns the factorial of x (x!)

factorial(7)


#16.Functions can be used to find the lowest or highest number in a set:

max(5, 10, 15)

#17.

min(5, 10, 15)


#18 Function rounds a number upwards to its nearest integer

ceiling(1.4)


#19 Function rounds a number downwards to its nearest integer

floor(1.4)

#20.Uppercase
data <- "Text"
toupper(data)	


