library(e1071)
library(tm)
library(MASS)
library(SnowballC)

train = read.table("train_set.csv", sep="\t", header=T)
test = read.table("test_set.csv", sep="\t", header=T)

#stopwords
mystopwords <- c(stopwords("english"),"week","arduino","words","need","get","will","want","know","work","also")

#corpus for train set
train.corpus <- Corpus(VectorSource(train$pred))
train.corpus <- tm_map(train.corpus, content_transformer(tolower))
train.corpus <- tm_map(train.corpus, removePunctuation)
train.corpus <- tm_map(train.corpus, stripWhitespace)
train.corpus <- tm_map(train.corpus, removeNumbers)
train.corpus <- tm_map(train.corpus, removeWords, mystopwords)
train.corpus <- tm_map(train.corpus, stemDocument)
train.corpus <- tm_map(train.corpus, removeWords, "(http)\\w+")
train.corpus <- tm_map(train.corpus, removeWords, "\\b[a-zA-Z0-9]{10,100}\\b")
train.corpus.dtm <- DocumentTermMatrix(train.corpus, control = list(weighting = function(x) weightTfIdf(x, normalize = FALSE), stopwords = TRUE, removePunctuation=TRUE))
train.corpus.dtms <- removeSparseTerms(train.corpus.dtm, 0.98)

#Debugging
#TermDocumentMatrix(train.corpus)
#inspect(train.corpus.dtm)
#findFreqTerms(train.corpus.dtm, N)   #N <- freq

#corpus for test set
test.corpus <- Corpus(VectorSource(test$pred))
test.corpus <- tm_map(test.corpus, content_transformer(tolower))
test.corpus <- tm_map(test.corpus, removePunctuation)
test.corpus <- tm_map(test.corpus, stripWhitespace)
test.corpus <- tm_map(test.corpus, removeNumbers)
test.corpus <- tm_map(test.corpus, removeWords, mystopwords)
test.corpus <- tm_map(test.corpus, stemDocument)
test.corpus <- tm_map(test.corpus, removeWords, "(http)\\w+")
test.corpus <- tm_map(test.corpus, removeWords, "\\b[a-zA-Z0-9]{10,100}\\b")
test.corpus.dtm <- DocumentTermMatrix(test.corpus, control = list(weighting = function(x) weightTfIdf(x, normalize = FALSE), stopwords = TRUE, removePunctuation=TRUE))
test.corpus.dtms <- removeSparseTerms(test.corpus.dtm, 0.98) 


m <- as.matrix(train.corpus.dtms)
n <- as.matrix(test.corpus.dtms)

#Debugging
#v <- sort(rowSums(m), decreasing=TRUE)

#Train model
model <- naiveBayes(m,as.factor(train$class));

#Prediction
results <- predict(model,n[10:20,])

for(i in 10:20)
{	
	pr <- results[i-9]
	pt <- test$pred[i]
	print(i)
	print(pr)
	print(pt)
	print("=================================================================================================================")
}
