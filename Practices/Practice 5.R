################################################## 
#                  Practice  5                   #
##################################################

# You are employed as a Data Scientist by the World Bank and you are working on a project 
# to analyse the World’s demographic trends. 

# You are required to produce a scatterplot illustrating Birth Rate and Internet Usage 
# statistics by Country.

# The scatterplot needs to also be categorised by Countries’ Income Groups. 

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
stats[stats$Income.Group == "Low income",]

#Filter countries by Lower middle income
stats[stats$Income.Group == "Lower middle income",]

#Filter countries by Upper middle income
stats[stats$Income.Group == "Upper middle income",]

#Filter by countrie Malta
stats[stats$Country.Name == "Malta",]

#Filter by countrie Qatar
stats[stats$Country.Name == "Qatar",]

#Filter by countrie Netherlands
stats[stats$Country.Name == "Netherlands",]

#Filter by countrie Norway
stats[stats$Country.Name == "Norway",]