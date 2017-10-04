
#R-PROBLEM 1 
boot<-numeric(10000)
for(i in 1:10000)
{
 p1<- sum(sample(c(rep(1,937),rep(0,473)),1410,replace=TRUE))/1410
 
  p2<-sum(sample(c(rep(1,1945),rep(0,870)),2815,replace=TRUE))/2815

 boot[i]<-p1-p2

}
phat1=937/1410
phat1
phat2=1945/2815
phat2
phat1-phat2
sd <- sd(boot)
sd
(phat1-phat2)+2*sd
(phat1-phat2)-2*sd
quantile(boot,c(0.025,0.975))

library(ggplot2)
ggplot(data.frame(x=boot),aes(x=x))+geom_histogram(color="green")
rbinom(10000,size=1410,prob=937/1410)/1410
x = matrix(c(937, 1945, 473, 870), nrow = 2, ncol = 2)
rownames(x) = c("1974", "2006")
colnames(x) = c("Favor", "Oppose")
x
prop.test(x)
prop.test(x, correct = FALSE)
#book formula
phat1=937/1410
phat1
phat2=1945/2815
phat2
phat1-phat2
se1=sqrt((phat1*(1-phat2)/1410)+(phat2*(1-phat2)/2815))
se1
-0.02640238+1.96*se1
-0.02640238-1.96*se1
#PROBLEM 2
library(Lock5Data)
data(LightatNight)
str
light = with(LightatNight, BMGain[(Light == "DM") | (Light == "LL")])
dark = with(LightatNight, BMGain[Light == "LD"])
boot<-numeric(10000)
for(i in 1:10000)
{
  x1 = mean(sample(light,length(light),replace = TRUE))
  x2 = mean(sample(dark,length(dark),replace = TRUE))
  boot[i] <- x1-x2
}
x3=mean(light)
x3



x4=mean(dark)
x4
x3-x4
sd <- sd(boot)
sd
(x3-x4)+2*sd
(x3-x4)-2*sd
quantile(boot,c(0.025,0.975))
t.test(light, dark)
#formula
sd1=sd(light)
sd1
sd2=sd(dark)
sd2
length(light)
length(dark)
se=sqrt(sd1^2/19+sd2^2/8)
se
(x3-x4)+1.96*se
(x3-x4)-1.96*se

