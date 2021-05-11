################################################## 
#                  Practice 1                    #
##################################################

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
