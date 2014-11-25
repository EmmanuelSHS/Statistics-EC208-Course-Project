raw<-read.csv('D:/Dream/Documents/SJTU/Statistic/Course Project/2005-2014.csv')

#str(raw)
d<-colnames(raw)

raw[1,]<-c(NA,NA,5,6,7,rep(c(1:7),times=466),1)
res1<-data.frame(list=1:1185)
res1_d<-c()
for (i in 1:3268)
{
  n=1
  for (j in 1:1200)
  {
    if(is.na(raw[j,i]))
    {
      n=n+1
    }
  }
  if (n<450)
  {
    res1<-cbind(res1,raw[,i])
    res1_d<-c(res1_d,d[i])
  }
}

res1<-res1[,-1]
week<-res1[1,]
colnames(res1)<-res1_d

res2<-data.frame(res1[1,])
for (i in 1:1185)
{
  n=0
  for (j in 3:2171)
  {
    if(is.na(res1[i,j]))
    {
      n<-n+1
    }
  }
  if (n<=2168)
  {
    res2<-rbind(res2,res1[i,])
  }
  }
res<-res2[-1, ]
write.csv(res,file='cleaned20052014.csv',row.names=FALSE)

