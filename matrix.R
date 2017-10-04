se

#How to build a matrix
numeric = matrix(,nrow=11,ncol=2,byrow=TRUE)
for(i in 1:11)
{
 ci = logl.ci.p(10,i-1,conf=0.95)
 numeric[i,1]=ci[1]
 numeric[i,2]=ci[2]
}
x=0:10
x[ ( numeric[,1] < 0.3) & (0.3 < numeric[,2]) ] 
#1.3n=60,p=0.4
numeric = matrix(,nrow=61,ncol=2,byrow=TRUE)
for(i in 1:61)
{
  ci = logl.ci.p(60,i-1,conf=0.95)
  numeric[i,1]=ci[1]
  numeric[i,2]=ci[2]
}
x=0:60
x[ ( numeric[,1] < 0.4) & (0.4 < numeric[,2]) ] 
#2.3n=60,p=0.1
numeric = matrix(,nrow=61,ncol=2,byrow=TRUE)
for(i in 1:61)
{
  ci = logl.ci.p(60,i-1,conf=0.95)
  numeric[i,1]=ci[1]
  numeric[i,2]=ci[2]
}
x=0:60
x[ ( numeric[,1] < 0.1) & (0.1 < numeric[,2]) ] 

