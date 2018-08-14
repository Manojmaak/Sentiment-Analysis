pos=scan('C:/Users/Manojkumar/Documents/positive.txt',what='character',comment.char=';')
neg=scan('C:/Users/Manojkumar/Documents/negative.txt',what='character',comment.char=';')
pos.words=c(pos,'upgrade')
neg.words=c(neg,'wtf','epicfail')
wholedata$TWEET<-as.factor(wholedata$TWEET)
tweet.score=score.sentiment(wholedata$TWEET,pos.words,neg.words, .progress='text')
path<-"C:/Users/manojkumar/Desktop"
write.csv(tweet.score,file=paste(path,"tweetscore.csv",sep=""),row.names=TRUE)
View(tweet.score)
qplot(tweet.score$SCORE,xlab="score of the tweets")
x<-aggregate(wholedata$SCORE,by=list(NAME=wholedata$NAME),FUN=sum)
colnames(x) <- c('NAME','SCORE')

x["SENTIMENT"]<- NA
x[x$SCORE > 0, "SENTIMENT"] <- "POSITIVE"
x[x$SCORE == 0, "SENTIMENT"] <- "NEUTRAL"
x[x$SCORE < 0, "SENTIMENT"] <- "NEGATIVE"
View(x)
hist(x$SCORE,main="HISTOGRAM FOR SENTIMENT ANALYSIS OF TWEETS",xlab="scores",border="blue",xlim=c(-5,5),las=1)