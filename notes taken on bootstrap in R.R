

# notes taken on bootstrap in R
install.packages("Lock5Data")
> library(Lock5Data)
> data(StudentSurvey)
> str(StudentSurvey)
 with(StudentSurvey,mean(Exercise))
exercise = with(StudentSurvey,Exercise[!is.na(Exercise)])
> length(exercise)

 exercise
 
  B = 1000
> n = length(exercise)  
> xbar = mean(exercise)
> xbar

> boot.matrix = matrix(sample(exercise,size=B*n,replace=TRUE),B,n)
> dimention(boot.matrix)
> dim(boot.matrix)

> boot.stat = apply(boot.matrix,1,mean)
> library(ggplot2)
> ggplot(data.frame(x=boot.stat),aes(x=x))+geom_density()
> se = sd(boot.stat)
> se

> me = 2*se
> xbar + c(-1,1)*me

> me

> me = round(me,2)
> round(xbar + c(-1,1)*me, 2)

> quantile(boot.stat,c(0.025,0.975))
> round(quantile(boot.stat,c(0.025,0.975)),2)

> quantile(bbot.stat,c(0.005,0.995)),2)
> round(quantile(boot.stat,c(0.005,0.995)),2)

