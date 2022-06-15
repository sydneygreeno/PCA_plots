#PCA on mtcars dataset 06142022
#32 models of car, each car has 11 features in varying units (only use numerical)
#need to compute the principal components
#matrix of 9 columns and 32 rows which is passed into the prcomp() function, assigning the output to mtcars.pca, also set arguments center and scale to be TRUE, can look at a summary of results

mtcars.pca <- prcomp(mtcars[,c(1:7,10,11)], center= TRUE, scale.=TRUE)
summary(mtcars.pca)

#obtained 9 principal components
#now we need to plot PCA (make a biplot which includes the position of each sample in terms of PC1 and PC2)

library(ggbiplot)
ggbiplot(mtcars.pca)

#provide an argument to ggbiplot, give it the rownames of mtcars as labels

ggbiplot(mtcars.pca, labels=rownames(mtcars))

#now we need to interpret the results
#make it more readable by making a list for certain info and then pass it inot the groups argument of ggbiplot
#also set the ellipse argument to be TRUE which will draw an ellipse around each group

mtcars.country <- c(rep("Japan", 3), rep("US, 4), rep("Europe", 7), rep("US", 3), "Europe", rep("Japan",3), rep("US",4), rep("Europe", 3), "US", rep("Europe", 3))
ggbiplot(mtcars.pca, ellipse=TRUE, labels=rownames(mtcars), groups=mtcars.country)

#can have ggbiplot plot other principal components by using the choices argument

ggbiplot(mtcars.pca, ellipse=TRUE, choices=c(3,4), labels=rownames(mtcars), groups=mtcars.country)

#there are some other variables to manipulate with to alter the biplot
#add a circle to the center of the dataset (circle argument)

ggbiplot(mtcars.pca, ellipse=TRUE, circle=TRUE, labels=rownames(mtcars), groups=mtcars.country)

#scale the samples with (obs.scale) and the variables (var.scale)

ggbiplot(mtcars.pca, ellipse=TRUE, obs.scale=1, var.scale=1, labels=rownames(mtcars), groups=mt.cars.country)

#remove the arrows altogether using var.axes

ggbiplot(mtcars.pca, ellipse=TRUE, obs.scale=1, var.scale=1, var.axes=FALSE, labels=rownames(mtcars), groups=mtcars.country)

#customize ggbiplot, able to use the same parameters as ggplot

#specify colors to use for the groups with scale_colour_manual()
#add a title with ggtitle()
#specify the minimal() theme
#move the legend with theme()

ggbiplot(mtcars.pca, ellipse=TRUE, obs.scale=1, var.scale=1, labels=rownames(mtcars), groups=mtcars.country) + scale_colour_manual(name="Origin", values= c("forest green", "red3", "dark blue")) + ggtitle("PCA of mtcars dataset") + theme_minimal() + theme(legend.position="bottom")

















