#homework6 
#problem 2
anorm = function(a,mu=0,sigma=1) {
x = seq(mu-4*sigma,mu+4*sigma,length=501)
y = dnorm(x,mean=mu,sd=sigma)
d = data.frame(x,y)
require(ggplot2)
p = ggplot(d, aes(x=x,y=y)) + geom_line() +
geom_segment(aes(x=mu-4*sigma,xend=mu+4*sigma,y=0,yend=0),
data=data.frame(mu,sigma)) + ylab('density')
b = qnorm(a/2,mu,sigma)
c = qnorm(1-a/2,mu,sigma)
d2 = data.frame(x = c(mu-4*sigma,x[x<=b],b), y = c(0,y[x<=b],0))
d3 = data.frame(c,x = c(c,x[x>=c],mu+4*sigma), y = c(0,y[x>=c],0))
p = p + geom_polygon(aes(x=x,y=y),data=d2,fill="red")+ geom_polygon(aes(x=x,y=y),data=d3,fill="red")+ ggtitle(paste("P(|X| >",c,") =",a))
plot(p)
}
anorm(.3)
