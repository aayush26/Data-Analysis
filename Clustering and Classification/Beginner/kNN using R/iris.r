#load iris.csv
#set the directory where the files are pulled
#setwd("E:/git/Data-Analysis/Clustering and Classification/Beginner/kNN using R/")
#RStudio has default iris dataset. To use that, skip the below line.
#iris <- read.csv("iris.csv")            
#all work are done on a copy variable of iris
iris.copy <- iris
#To display iris dataset, type View(iris)
iris.copy$Species <- NULL
#To display iris.copy dataset, type View(iris.copy)
#Perform kNN clustering with arg(filename, no. of clusters)
result = kmeans(iris.copy, 3)
plot(iris[c("Petal.Length","Petal.Width")], col=result$cluster)
#Uncomment the below line to check the original clustering
#plot(iris[c("Petal.Length","Petal.Width")], col=iris$Species)

