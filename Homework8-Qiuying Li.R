
#Homework
#Qiuying Li
# 1.1, n=60,p=0.4
x = 0:60
p.hat = x/60
se = sqrt(p.hat*(1-p.hat)/60)
z = qnorm(0.975)
a = p.hat - z*se
b = p.hat + z*se
x[ (a < 0.4) & (0.4 < b) ] 
sum(dbinom(18:31,60,0.4))

#1.2 n=60, p=0.4
x = 0:60
p.hat = (x+2)/64
se = sqrt(p.hat*(1-p.hat)/64)
z = qnorm(0.975)
a = p.hat - z*se
b = p.hat + z*se
x[ (a < 0.4) & (0.4 < b) ] 
sum(dbinom(17:31,60,0.4))

#1.3，n=60,p=0.4
numeric = matrix(,nrow=61,ncol=2,byrow=TRUE)
for(i in 1:61)
{
  ci = logl.ci.p(60,i-1,conf=0.95)
  numeric[i,1]=ci[1]
  numeric[i,2]=ci[2]
}
x=0:60
x[ ( numeric[,1] < 0.4) & (0.4 < numeric[,2]) ] 
sum(dbinom(17:31,60,0.4))


#2.1,n=30,0=0.1
x = 0:60
p.hat = x/60
se = sqrt(p.hat*(1-p.hat)/60)
z = qnorm(0.975)
a = p.hat - z*se
b = p.hat + z*se
x[ (a < 0.1) & (0.1 < b) ] 
sum(dbinom(3:12,60,0.1))

#2.2, n=30,p=0.1
x = 0:60
p.hat = (x+2)/64
se = sqrt(p.hat*(1-p.hat)/64)
z = qnorm(0.975)
a = p.hat - z*se
b = p.hat + z*se
x[ (a < 0.1) & (0.1 < b) ] 
sum(dbinom(2:10,60,0.1))

#2.3，n=60,p=0.1
numeric = matrix(,nrow=61,ncol=2,byrow=TRUE)
for(i in 1:61)
{
  ci = logl.ci.p(60,i-1,conf=0.95)
  numeric[i,1]=ci[1]
  numeric[i,2]=ci[2]
}
x=0:60
x[ ( numeric[,1] < 0.1) & (0.1 < numeric[,2]) ] 
sum(dbinom(3:11,60,0.1))

# Problems 3.1
x = seq(-4,4,0.001)
z = dnorm(x)
y.10 = dt(x, df=4)
d = data.frame(x,z,y.10)

require(ggplot2)
ggplot(d) +
  geom_line(aes(x=x,y=y.10),color="blue")+
  geom_line(aes(x=x,y=z),color="red") +
  ylab('density') +
  ggtitle("t(10) distribution in blue, N(0,1) in red")
#3.2 Find the area to the right of 2 under each curve.
1-pt(2,4)
1-pnorm(2,0,1)

#3.3 Find the 0.975 quantile of each curve
qt(0.975,4)
qnorm(0.975,0,1)

#4.1 Repeat the previous problem, but for a t distribution with 20 degrees of freedom.
x = seq(-4,4,0.001)
z = dnorm(x)
y.10 = dt(x, df=20)
d = data.frame(x,z,y.10)

require(ggplot2)
ggplot(d) +
  geom_line(aes(x=x,y=y.10),color="blue")+
  geom_line(aes(x=x,y=z),color="red") +
  ylab('density') +
  ggtitle("t(10) distribution in blue, N(0,1) in red")
  
#4.2Find the area to the right of 2 under each curve.
1-pt(2,20)
1-pnorm(2,0,1)

#4.3 Find the 0.975 quantile of each curve
qt(0.975,20)
qnorm(0.975,0,1)

#5.1Repeat the previous problem, but for a t distribution with 100 degrees of freedom
x = seq(-4,4,0.001)
z = dnorm(x)
y.10 = dt(x, df=100)
d = data.frame(x,z,y.10)

require(ggplot2)
ggplot(d) +
  geom_line(aes(x=x,y=y.10),color="blue")+
  geom_line(aes(x=x,y=z),color="red") +
  ylab('density') +
  ggtitle("t(10) distribution in blue, N(0,1) in red")
  
#5.2 Find the area to the right of 2 under each curve.
1-pt(2,100)
1-pnorm(2,0,1)

#5.3 Find the 0.975 quantile of each curve
qt(0.975,100)
qnorm(0.975,0,1)
sum(dbinom(3:11,60,0.1))

