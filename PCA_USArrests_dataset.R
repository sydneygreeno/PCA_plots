#load the data from tidyverse package
#use USArrests which is built into R
#contains the number of arrests per 100,000 residents in each US state in 1973 for Murder, Assault and Rape. Also includes the percentage of the population in each state living in urban areas, Urbanpop

library(tidyverse)
data("USArrests")
head(USArrests)

#now we need to calculate the principal components
#specify scale = TRUE so each of the variables have a mean of 0 and a std of 1 before calculating the principal components
#eigenvectors in R point in the negative direction by default, so multiply by -1 to reverse the signs

results <- prcomp(USArrests, scale=TRUE)
results$rotation <- -1*results$rotation
results$rotation

#principal components scores for each state are stored in results$x (need to also multiply these scores by -1 to reverse the signs

results$x <- -1*results$x 
head(results$x)

#now we need to visualize the results with a biplot
#a biplot projects each of the observations in the dataset onto a scatterplot that uses the first and second principal components as the axes
#scale= 0 ensures the arrows in the plot are scaled to represent the loadings

biplot(results, scale=0)

#can see accurate results because Georgia has the highest rate of murder and it is the closest to the murder variable (here we can display the states with the highest murder rates in original dataset)

head(USArrests[order(-USArrests$Murder),])

#now we need to find variance explained by each principal component
#can use the following to calculate the total variance in the original dataset explained by each principal component

resulta$sdev^2 / sum(results$sdev^2)

#from the results we see that PC1 explains 62% of the total variance in the dataset PC2 is 24.7% PC3 is 8.9% and so on
#so the first 2 explain the majority of the total variance of the data
#we can also create a scree plot (displays the total variance explained by each PC)


*.* linguist-language=R






