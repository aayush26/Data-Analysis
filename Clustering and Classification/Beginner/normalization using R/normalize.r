normalize <- function(x){
  num <- x - min(x);
  denom <- max(x) - min(x);
  return (num/denom);
}
iris_norm <- as.data.frame(lapply(iris[1:4], normalize))
summary(iris_norm)
