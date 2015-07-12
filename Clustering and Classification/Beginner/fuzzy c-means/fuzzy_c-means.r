#import "e1071" for performing cmeans function
library("e1071")
#access inbuilt dataset - iris
data(iris)
#store it to a variable;though not necessary
x<-iris
#remove Species column
x$Species <- NULL
#perform cmeans(variable, no.of clusters, verbose, method)
result<-cmeans(x,3,verbose=FALSE,method="cmeans")
#display result
print(result)
#plot the output
plot(iris, col=result$cluster)