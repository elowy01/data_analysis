#read-in data. Price for a certain month
data<-read.csv("/Users/ernesto/Documents/data_analysis/house_prices/pp_complete.cambrigeshire.csv",header=FALSE,
               ,stringsAsFactors=FALSE,na.strings=c(""))
#set colnames
colnames(data)<-c("id","price","date","postcode","type","old/new","duration","PAON","SAON","street","locality","town",
                  "district","county","status")
levels(data$type)<-c("detached","flat","semidetached","terraced")

##CAMBRIDGESHIRE
#subset Cambridgeshire
data.cmbs<-subset(data,county=="CAMBRIDGESHIRE")

#calculate mean per type
mean.type<-with(data.cmbs, tapply(data.cmbs$price,data.cmbs$type, mean))
#calculate median per type
median.type<-with(data.cmbs, tapply(data.cmbs$price,data.cmbs$type, median))

#calculate mean per town
mean.town<-with(data.cmbs, tapply(data.cmbs$price,data.cmbs$town, mean))
#calculate median per town
median.town<-with(data.cmbs, tapply(data.cmbs$price,data.cmbs$town, median))

#CAMBRIDGE
#subset Cambridge
data.cmb<-subset(data,town=="CAMBRIDGE")
#add CAMBRIDGE to empty locality
data.cmb$locality[which(is.na(data.cmb$locality))]<-"CAMBRIDGE"
mean.locality<-with(data.cmb, tapply(data.cmb$price,data.cmb$locality, mean))
count.locality<-table(data.cmb$locality)
final.data=rbind(mean.locality,count.locality)

