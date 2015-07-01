library(ggplot2)

data<-read.csv("/Users/ernesto/Documents/data_analysis/datasets/pp_complete.cambrigeshire.csv",header=FALSE,
               ,stringsAsFactors=FALSE,na.strings=c(""))
#set colnames
colnames(data)<-c("id","price","date","postcode","type","old/new","duration","PAON","SAON","street","locality","town",
                  "district","county","status")
data$type<-factor(data$type)
levels(data$type)<-c("detached","flat","semidetached","terraced")

#convert character to Date
data$date=as.Date(data$date)

#qplot(price,date,data=data,facets=.~type)

##CAMBRIDGESHIRE
data$Month <- as.Date(cut(data$date,breaks = "month"))
mean.per.month<-with(data, tapply(data$price,data$Month, mean))
qplot(as.Date(names(mean.per.month)),mean.per.month,xlab="time",ylab="mean price",main="Mean price for Cambridgeshire")