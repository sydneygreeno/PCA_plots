#PCA is an unsupervised machine learning technique that finds principal components
#the overall goal is to explain most of the variability in a dataset with fewer variables than the original dataset

#pass numerical components into prcomp(), set args center and scale to TRUE
#obtain principal components
data(iris)
iris.pca <- prcomp(iris[,c(1:4)], center=TRUE, scale.=TRUE)
summary(iris.pca)
Importance of components:
  PC1    PC2     PC3     PC4
Standard deviation     1.7084 0.9560 0.38309 0.14393
Proportion of Variance 0.7296 0.2285 0.03669 0.00518
Cumulative Proportion  0.7296 0.9581 0.99482 1.00000

#plot results of PCA using a biplot
library(ggbiplot)
Loading required package: ggplot2
Keep up to date with changes at https://www.tidyverse.org/blog/
Loading required package: plyr
Loading required package: scales
Loading required package: grid
ggbiplot(iris.pca)

#need to interpret results by adjusting the arguments
ggbiplot(iris.pca, labels=iris$Species)
ggbiplot(iris.pca, ellipse=TRUE,)
ggbiplot(iris.pca, ellipse=TRUE, labels=iris$Species, obs.scale=1, var.scale=1)
ggbiplot(iris.pca, ellipse=TRUE, groups=iris$Species, obs.scale=1, var.scale=1)

#final
ggbiplot(iris.pca, ellipse=TRUE, groups=iris$Species, obs.scale=1, var.scale=1) + scale_colour_manual(name="origin", values= c("forest green", "red3", "dark blue")) +
  + ggtitle("PCA model of Iris Dataset") + theme_minimal() + theme(legend.position= "bottom")

*.* linguist-language=R



