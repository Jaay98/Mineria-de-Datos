################################################## 
#                  Practice  5                   #
##################################################

# You are employed as a Data Scientist by the World Bank and you are working on a project 
# to analyse the World's demographic trends. 

# You are required to produce a scatterplot illustrating Birth Rate and Internet Usage 
# statistics by Country.

# The scatterplot needs to also be categorised by Countries' Income Groups. 

# Requirements changed
# You have recevied an urgent update from your Boss.

# You are required to produce a second scatterplot illustrationg Birth Rate and
# Internet Usage statistics by Contry.

# However, this time the scatterplot needs to be categorised by Countrie Regions.

# Additional data has been supplied in the form of R vectors.

# Select data file
stats <- read.csv(file.choose())
stats
#Filter countries by Low income
head(stats)
filter <- stats$Income.Group == "Low income" #TRUE
filter
stats[filter,]
#Filter countries by Lower middle income
head(stats)
filter <- stats$Income.Group == "Lower middle income" #TRUE
filter
stats[filter,]
#Filter countries by Upper middle income
head(stats)
filter <- stats$Income.Group == "Lower middle income" #TRUE
filter
stats[filter,]

#Filter by countrie Malta
head(stats)
filter <- stats$Country.Name == "Malta" #TRUE
filter
stats[filter,]
#Filter by countrie Qatar
head(stats)
filter <- stats$Country.Name == "Qatar" #TRUE
filter
stats[filter,]
#Filter by countrie Netherlands
head(stats)
filter <- stats$Country.Name == "Netherlands" #TRUE
filter
stats[filter,]
#Filter by countrie Norway
head(stats)
filter <- stats$Country.Name == "Norway" #TRUE
filter
stats[filter,]
