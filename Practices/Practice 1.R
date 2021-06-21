################################################## 
#                   Practice 1                   #
##################################################

#Test the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1:
#Create an R script that will count how many of these numbers fall between -1 and 1 and divide
#by the total quantity of N

#1. Initialize sample size


size <- 1000000000
stdev <- 1

#Initialize counter

counter <- 0
mean <- 0

#3. loop for(i in rnorm(size))

for(i in rnorm(size,mean,stdev)){

#4. Check if the iterated variable falls
  
  if(i>=-1 && i<=1)

#5. Increase counter if the condition is true
 
    counter <- counter+1
}
    
#6. return a result <- counter / N

result <- counter/size
result <- result*100
paste(format(round(result, 2), nsmall = 2),"%")
