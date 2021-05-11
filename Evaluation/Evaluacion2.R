################################################## 
#                  Evaluation 2                  #
##################################################

#Export the library ggplot2

library(ggplot2)

#Import the dataframe
df <- read.csv(file.choose())
head(df)

#Rename columns name
colnames(df) <- c("Day_Week","Director","Genre","Title","Release_Date","Studio","Adjusted_Gross","Budget","Gross","IMDb_Rating","MovieLens_Rating","Overseas","Overseas%","Profit","Profit%","Runtime","US_dlls","GrossPor")

#Delete useles data

filter <- (df$Genre=="action" | df$Genre=="adventure" | df$Genre=="animation" | df$Genre=="comedy" | df$Genre=="drama") & (df$Studio=="Buena Vista Studios" | df$Studio=="Fox" | df$Studio=="Paramount Pictures" | df$Studio=="Sony" | df$Studio=="Universal" | df$Studio=="WB")

filter_df <-df[filter,]

#Show the new df

head(filter_df)

#Show graph

u <- ggplot(filter_df, aes(x=Genre, y=GrossPor, color=Genre))

u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)
