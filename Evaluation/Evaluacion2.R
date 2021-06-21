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

u <- ggplot(filter_df, aes(x=Genre, y=GrossPor, color=Studio, size=Budget))

u + geom_jitter(aes(color=Studio,size=Budget)) + geom_boxplot(size=0.5,alpha=0.5,color="Black",outlier.shape = NA)+ theme(
  plot.title = element_text(color="Black", size=16, hjust = 0.5),
  axis.title.x = element_text(color="purple", size=16),
  axis.title.y = element_text(color="purple", size=16)
)  +  ggtitle("Domestic Gross % by Genre") + ylab("Gross %US")  
