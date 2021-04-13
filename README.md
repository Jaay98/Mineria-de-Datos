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
4. [Practice 4](#id4)
5. [Practice 5](#id5)

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

Scenario: You are a Data Scientist working for a consulting firm.
One of your colleagues from the Auditing Department has asked you
to help them assess the financial statement of organization X.

You have been supplied with two vector of data: mounthly revenue and
expenses for the financial year in quiestion. Your task is to calculate
the following financial matrics:

- profit for each mounth
- profit after tax for each month (the tax rate is 30%)
- profit margin for each month - equal to profit after tax divided by revenue
- good months - where the profit after tax was greater than the mean for the year
- bad months - where the profit after tax was less then the mean for years
- the best month - where the profit after tax was max for the year
- the worst month - where the profit after tax was min for the year

All results need to be presented as vectors.

Results for dollar values need to be calculate with $0.01 precision, but need to be
presented in Units of $1,000(i.e. 1k) with no decimal point.

Results for the profit margin ratio needed to be presented in units of % with no
decimal points.

Note: Your collegue has warned you that it is okay for tax for any given month to be
negative (in accounting terms, negative tax translates into a deferred tax asset).

Hint 1
```{r}
Use:
round()
mean()
max()
min()
```

Data
```{r}
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)
```

Solution
Calculate Profit As The Differences Between Revenue And Expenses
```{r}
profit <- revenue - expenses
profit
```

Calculate Tax As 30% Of Profit And Round To 2 Decimal Points
```{r}
tax <- round(0.30 * profit, 2)
tax 
```

Calculate Profit Remaining After Tax Is Deducted
```{r}
profit.after.tax <- revenue - profit
profit.after.tax
```

Calculate The Profit Margin As Profit After Tax Over Revenue
Round To 2 Decimal Points, Then Multiply By 100 To Get %
```{r}
profit.margin <- round(profit.after.tax / revenue, 2) * 100
profit.margin
```

Calculate The Mean Profit After Tax For The 12 Months
```{r}
mean_pat <- mean(profit.after.tax)
mean_pat
```

Find The Months With Above-Mean Profit After Tax
```{r}
good.months <- profit.after.tax > mean_pat
good.months
```

Bad Months Are The Opposite Of Good Months !
```{r}
bad.months <- !good.months
bad.months
```

The Best Month Is Where Profit After Tax Was Equal To The Maximum
```{r}
best.month <- profit.after.tax == max(profit.after.tax)
best.month
```

The Worst Month Is Where Profit After Tax Was Equal To The Minimum
```{r}
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month
```

Convert All Calculations To Units Of One Thousand Dollars
```{r}
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit / 1000, 0)
profit.after.tax.1000 <- round(profit.after.tax / 1000, 0)
```

Print Results
```{r}
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month
```

BONUS:
Preview Of What's Coming In The Next Section
```{r}
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)
```

Print The Matrix
```{r}
M
```
##### Practice 4<a name="id4"></a>


Instructions for this dataset:
 Simply select ALL the lines in this script by pressing 
 CTRL+A on Windows or CMND+A on a Mac and execute them
 Once you have executed the commands the following objects
 will be created:
 Matrices:
 - FieldGoalAttempts
 - FieldGoals
 - Games
 - MinutesPlayed
 - Salary
 Vectors:
 - Players
 - Seasons
We will go understand these inside the course.

Sincerely,
Kirill Eremenko
www.superdatascience.com

Copyright: These datasets were prepared using publicly available data.
           However, theses scripts are subject to Copyright Laws. 
           If you wish to use these R scripts outside of the R Programming Course
          by Kirill Eremenko, you may do so by referencing www.superdatascience.com in your work.

Comments:
Seasons are labeled based on the first year in the season
E.g. the 2012-2013 season is preseneted as simply 2012

Notes and Corrections to the data:
Kevin Durant: 2006 - College Data Used
Kevin Durant: 2005 - Proxied With 2006 Data
Derrick Rose: 2012 - Did Not Play
Derrick Rose: 2007 - College Data Used
Derrick Rose: 2006 - Proxied With 2007 Data
Derrick Rose: 2005 - Proxied With 2007 Data


 Seasons
```{r}
Seasons <- c("2005","2006","2007","2008","2009","2010","2011","2012","2013","2014")
```

 Players
```{r}
Players <- c("KobeBryant","JoeJohnson","LeBronJames","CarmeloAnthony","DwightHoward","ChrisBosh","ChrisPaul","KevinDurant","DerrickRose","DwayneWade")
```


 Salaries
```{r}
KobeBryant_Salary <- c(15946875,17718750,19490625,21262500,23034375,24806250,25244493,27849149,30453805,23500000)
JoeJohnson_Salary <- c(12000000,12744189,13488377,14232567,14976754,16324500,18038573,19752645,21466718,23180790)
LeBronJames_Salary <- c(4621800,5828090,13041250,14410581,15779912,14500000,16022500,17545000,19067500,20644400)
CarmeloAnthony_Salary <- c(3713640,4694041,13041250,14410581,15779912,17149243,18518574,19450000,22407474,22458000)
DwightHoward_Salary <- c(4493160,4806720,6061274,13758000,15202590,16647180,18091770,19536360,20513178,21436271)
ChrisBosh_Salary <- c(3348000,4235220,12455000,14410581,15779912,14500000,16022500,17545000,19067500,20644400)
ChrisPaul_Salary <- c(3144240,3380160,3615960,4574189,13520500,14940153,16359805,17779458,18668431,20068563)
KevinDurant_Salary <- c(0,0,4171200,4484040,4796880,6053663,15506632,16669630,17832627,18995624)
DerrickRose_Salary <- c(0,0,0,4822800,5184480,5546160,6993708,16402500,17632688,18862875)
DwayneWade_Salary <- c(3031920,3841443,13041250,14410581,15779912,14200000,15691000,17182000,18673000,15000000)
#Matrix
Salary <- rbind(KobeBryant_Salary, JoeJohnson_Salary, LeBronJames_Salary, CarmeloAnthony_Salary, DwightHoward_Salary, ChrisBosh_Salary, ChrisPaul_Salary, KevinDurant_Salary, DerrickRose_Salary, DwayneWade_Salary)
rm(KobeBryant_Salary, JoeJohnson_Salary, CarmeloAnthony_Salary, DwightHoward_Salary, ChrisBosh_Salary, LeBronJames_Salary, ChrisPaul_Salary, DerrickRose_Salary, DwayneWade_Salary, KevinDurant_Salary)
colnames(Salary) <- Seasons
rownames(Salary) <- Players
```


 Games
```{r} 
KobeBryant_G <- c(80,77,82,82,73,82,58,78,6,35)
JoeJohnson_G <- c(82,57,82,79,76,72,60,72,79,80)
LeBronJames_G <- c(79,78,75,81,76,79,62,76,77,69)
CarmeloAnthony_G <- c(80,65,77,66,69,77,55,67,77,40)
DwightHoward_G <- c(82,82,82,79,82,78,54,76,71,41)
ChrisBosh_G <- c(70,69,67,77,70,77,57,74,79,44)
ChrisPaul_G <- c(78,64,80,78,45,80,60,70,62,82)
KevinDurant_G <- c(35,35,80,74,82,78,66,81,81,27)
DerrickRose_G <- c(40,40,40,81,78,81,39,0,10,51)
DwayneWade_G <- c(75,51,51,79,77,76,49,69,54,62)
#Matrix
Games <- rbind(KobeBryant_G, JoeJohnson_G, LeBronJames_G, CarmeloAnthony_G, DwightHoward_G, ChrisBosh_G, ChrisPaul_G, KevinDurant_G, DerrickRose_G, DwayneWade_G)
rm(KobeBryant_G, JoeJohnson_G, CarmeloAnthony_G, DwightHoward_G, ChrisBosh_G, LeBronJames_G, ChrisPaul_G, DerrickRose_G, DwayneWade_G, KevinDurant_G)
colnames(Games) <- Seasons
rownames(Games) <- Players
```


 Minutes Played
```{r}
KobeBryant_MP <- c(3277,3140,3192,2960,2835,2779,2232,3013,177,1207)
JoeJohnson_MP <- c(3340,2359,3343,3124,2886,2554,2127,2642,2575,2791)
LeBronJames_MP <- c(3361,3190,3027,3054,2966,3063,2326,2877,2902,2493)
CarmeloAnthony_MP <- c(2941,2486,2806,2277,2634,2751,1876,2482,2982,1428)
DwightHoward_MP <- c(3021,3023,3088,2821,2843,2935,2070,2722,2396,1223)
ChrisBosh_MP <- c(2751,2658,2425,2928,2526,2795,2007,2454,2531,1556)
ChrisPaul_MP <- c(2808,2353,3006,3002,1712,2880,2181,2335,2171,2857)
KevinDurant_MP <- c(1255,1255,2768,2885,3239,3038,2546,3119,3122,913)
DerrickRose_MP <- c(1168,1168,1168,3000,2871,3026,1375,0,311,1530)
DwayneWade_MP <- c(2892,1931,1954,3048,2792,2823,1625,2391,1775,1971)
```


 Matrix
```{r}
MinutesPlayed <- rbind(KobeBryant_MP, JoeJohnson_MP, LeBronJames_MP, CarmeloAnthony_MP, DwightHoward_MP, ChrisBosh_MP, ChrisPaul_MP, KevinDurant_MP, DerrickRose_MP, DwayneWade_MP)
rm(KobeBryant_MP, JoeJohnson_MP, CarmeloAnthony_MP, DwightHoward_MP, ChrisBosh_MP, LeBronJames_MP, ChrisPaul_MP, DerrickRose_MP, DwayneWade_MP, KevinDurant_MP)
colnames(MinutesPlayed) <- Seasons
rownames(MinutesPlayed) <- Players
```

 Field Goals
```{r}
KobeBryant_FG <- c(978,813,775,800,716,740,574,738,31,266)
JoeJohnson_FG <- c(632,536,647,620,635,514,423,445,462,446)
LeBronJames_FG <- c(875,772,794,789,768,758,621,765,767,624)
CarmeloAnthony_FG <- c(756,691,728,535,688,684,441,669,743,358)
DwightHoward_FG <- c(468,526,583,560,510,619,416,470,473,251)
ChrisBosh_FG <- c(549,543,507,615,600,524,393,485,492,343)
ChrisPaul_FG <- c(407,381,630,631,314,430,425,412,406,568)
KevinDurant_FG <- c(306,306,587,661,794,711,643,731,849,238)
DerrickRose_FG <- c(208,208,208,574,672,711,302,0,58,338)
DwayneWade_FG <- c(699,472,439,854,719,692,416,569,415,509)
#Matrix
FieldGoals <- rbind(KobeBryant_FG, JoeJohnson_FG, LeBronJames_FG, CarmeloAnthony_FG, DwightHoward_FG, ChrisBosh_FG, ChrisPaul_FG, KevinDurant_FG, DerrickRose_FG, DwayneWade_FG)
rm(KobeBryant_FG, JoeJohnson_FG, LeBronJames_FG, CarmeloAnthony_FG, DwightHoward_FG, ChrisBosh_FG, ChrisPaul_FG, KevinDurant_FG, DerrickRose_FG, DwayneWade_FG)
colnames(FieldGoals) <- Seasons
rownames(FieldGoals) <- Players
```

 Field Goal Attempts
```{r}
KobeBryant_FGA <- c(2173,1757,1690,1712,1569,1639,1336,1595,73,713)
JoeJohnson_FGA <- c(1395,1139,1497,1420,1386,1161,931,1052,1018,1025)
LeBronJames_FGA <- c(1823,1621,1642,1613,1528,1485,1169,1354,1353,1279)
CarmeloAnthony_FGA <- c(1572,1453,1481,1207,1502,1503,1025,1489,1643,806)
DwightHoward_FGA <- c(881,873,974,979,834,1044,726,813,800,423)
ChrisBosh_FGA <- c(1087,1094,1027,1263,1158,1056,807,907,953,745)
ChrisPaul_FGA <- c(947,871,1291,1255,637,928,890,856,870,1170)
KevinDurant_FGA <- c(647,647,1366,1390,1668,1538,1297,1433,1688,467)
DerrickRose_FGA <- c(436,436,436,1208,1373,1597,695,0,164,835)
DwayneWade_FGA <- c(1413,962,937,1739,1511,1384,837,1093,761,1084)
```

 Matrix
```{r}
FieldGoalAttempts <- rbind(KobeBryant_FGA, JoeJohnson_FGA, LeBronJames_FGA, CarmeloAnthony_FGA, DwightHoward_FGA, ChrisBosh_FGA, ChrisPaul_FGA, KevinDurant_FGA, DerrickRose_FGA, DwayneWade_FGA)
rm(KobeBryant_FGA, JoeJohnson_FGA, LeBronJames_FGA, CarmeloAnthony_FGA, DwightHoward_FGA, ChrisBosh_FGA, ChrisPaul_FGA, KevinDurant_FGA, DerrickRose_FGA, DwayneWade_FGA)
colnames(FieldGoalAttempts) <- Seasons
rownames(FieldGoalAttempts) <- Players
```

 Points
```{r}
KobeBryant_PTS <- c(2832,2430,2323,2201,1970,2078,1616,2133,83,782)
JoeJohnson_PTS <- c(1653,1426,1779,1688,1619,1312,1129,1170,1245,1154)
LeBronJames_PTS <- c(2478,2132,2250,2304,2258,2111,1683,2036,2089,1743)
CarmeloAnthony_PTS <- c(2122,1881,1978,1504,1943,1970,1245,1920,2112,966)
DwightHoward_PTS <- c(1292,1443,1695,1624,1503,1784,1113,1296,1297,646)
ChrisBosh_PTS <- c(1572,1561,1496,1746,1678,1438,1025,1232,1281,928)
ChrisPaul_PTS <- c(1258,1104,1684,1781,841,1268,1189,1186,1185,1564)
KevinDurant_PTS <- c(903,903,1624,1871,2472,2161,1850,2280,2593,686)
DerrickRose_PTS <- c(597,597,597,1361,1619,2026,852,0,159,904)
DwayneWade_PTS <- c(2040,1397,1254,2386,2045,1941,1082,1463,1028,1331)
```

 Matrix
```{r}
Points <- rbind(KobeBryant_PTS, JoeJohnson_PTS, LeBronJames_PTS, CarmeloAnthony_PTS, DwightHoward_PTS, ChrisBosh_PTS, ChrisPaul_PTS, KevinDurant_PTS, DerrickRose_PTS, DwayneWade_PTS)
rm(KobeBryant_PTS, JoeJohnson_PTS, LeBronJames_PTS, CarmeloAnthony_PTS, DwightHoward_PTS, ChrisBosh_PTS, ChrisPaul_PTS, KevinDurant_PTS, DerrickRose_PTS, DwayneWade_PTS)
colnames(Points) <- Seasons
rownames(Points) <- Players
```

 Analysis
```{r}
Games
rownames(Games)
colnames(Games)

Games["KevinDurant", "2013"]
Games["KobeBryant", "2013"]

FieldGoals
```

 Field goals
```{r}
round(FieldGoals / Games, 1)
```

 Minutes played
```{r}
round(MinutesPlayed / Games)
```

 Visualize the data
```{r}
?matplot
matplot(t(FieldGoals/Games), type ="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F)

matplot(t(FieldGoals/FieldGoalAttempts), type ="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F)
```

 Subsets
```{r}
Games
Games[1:3, 6:10]
Games[c(1,10),]
Games[, c("2008", "2009")]
Games[1,]
Games[1, 5]

is.matrix(Games[1,])
is.vector(Games[1,])

Games[1,,drop=F]
Games[1,5, drop=F]
```

 Visualizing Subsets
```{r}
Data <- MinutesPlayed[1:3,, drop=F]

matplot(t(Data), type ="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players[1:3], col=c(1:4, 6), pch=15:18, horiz=F)

Data

Data <- MinutesPlayed[1,, drop=F]

matplot(t(Data), type ="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players[1], col=c(1:4, 6), pch=15:18, horiz=F)
Data
```

 Functions
```{r}
myplot <- function(data, rows){
  Data <- data[rows,, drop=F]
  matplot(t(Data), type ="b", pch=15:18, col=c(1:4, 6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4, 6), pch=15:18, horiz=F)
}

myplot(MinutesPlayed,1:5)
myplot(Games,1:5)
myplot(Points,1:10)
myplot(Salary,1:5)
myplot(MinutesPlayed/Games, 1:3)
```

 Analysis
 Salary
```{r}
myplot(Salary)
myplot(Salary / Games)
myplot(Salary / FieldGoals)
```
 In-Game Metrics
```{r}
myplot(MinutesPlayed)
myplot(Points)
```

 In-Game Matrics Normalized
```{r}
myplot(FieldGoals / Games)
myplot(FieldGoals / FieldGoalAttempts)
myplot(FieldGoalAttempts / Games)
myplot(Points/Games)
```

 Interesting Observations
```{r}
myplot(MinutesPlayed / Games)
myplot(Games)
```
 Time is valuable
```{r}
myplot(FieldGoals/MinutesPlayed)
```

 Player Style
```{r}
myplot(Points / FieldGoals)
```




##### Practice 5<a name="id5"></a>