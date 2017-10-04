#2.1
 Use the bootstrap to estimate the mean number of taps per minute with a 95% confidence interval separately for each group. Use both the SE and percentile versions

#Group-Caffeine
library(Lock5Data)
> data(CaffeineTaps)
> str(CaffeineTaps)
Caffeine = with(CaffeineTaps, Taps[Group=="Caffeine"])
> Caffeine.mean = mean(Caffeine)
Caffeine.mean
[1] 248.3
> Caffeine.n = length(Caffeine)
length(Caffeine)
[1] 246 248 250 252 248 250 246 248 245 250
length(NoCaffeine)
B = 1000
> n = length(Caffeine)
> xbar = mean(Caffeine)
> xbar
[1] 248.3
> boot.matrix = matrix(sample(Caffeine,size=B*n,replace=TRUE),B,n)
> dim(boot.matrix)
[1] 1000   10
> boot.stat = apply(boot.matrix,1,mean)
> 
>  se = sd(boot.stat)
> se
[1] 0.6458685
> me = 2*se
> me
[1] 1.291737
> me = round(me,2)
> 
> round(xbar + c(-1,1)*me, 2)
[1] 247.01 249.59
> quantile(boot.stat,c(0.025,0.975))
    2.5%    97.5% 
247.0975 249.6000 

#Group-NoCaffeine
NoCaffeine = with(CaffeineTaps, Taps[Group=="NoCaffeine"])
> NoCaffeine.mean = mean(NoCaffeine)
> 
> Caffeine.mean
[1] 248.3
> NoCaffeine.mean
[1] 244.8
> NoCaffeine.n = length(NoCaffeine)
> length(NoCaffeine)
[1] 10
> 
> B = 1000
> n = length(NoCaffeine)
> xbar = mean(NoCaffeine)
> xbar
[1] 244.8
> boot.matrix = matrix(sample(NoCaffeine,size=B*n,replace=TRUE),B,n)
> dim(boot.matrix)
[1] 1000   10
> boot.stat = apply(boot.matrix,1,mean)
> se = sd(boot.stat)
> se
[1] 0.6903856
> me = 2*se
> me
[1] 1.380771
> me = round(me,2)
> 
> me
[1] 1.38
> round(xbar + c(-1,1)*me, 2)
[1] 243.42 246.18
> 
> quantile(boot.stat,c(0.025,0.975))
 2.5% 97.5% 
243.5 246.2 

#2. Use the bootstrap to estimate the dierence, caffeine minus decaf, in the population means, with a 95% confidence interval. Use both the SE and percentile versions.
Caffeine = with(CaffeineTaps, Taps[Group=="Caffeine"])
> NoCaffeine = with(CaffeineTaps, Taps[Group=="NoCaffeine"])
>  Caffeine.mean = mean(Caffeine)
>  NoCaffeine.mean = mean(NoCaffeine)
> 
> Caffeine.n = length(Caffeine)
> NoCaffeine.n = length(NoCaffeine)
> print("Difference in sample means (Caffeine - NoCaffeine)")
[1] "Difference in sample means (Caffeine - NoCaffeine)"
> "Difference in sample means (Caffeine - NoCaffeine)"
[1] "Difference in sample means (Caffeine - NoCaffeine)"
> print(Caffeine.mean - NoCaffeine.mean)
[1] 3.5
> 
> print("Difference in sample means (Caffeine - NoCaffeine)")
[1] "Difference in sample means (Caffeine - NoCaffeine)"
>  print(Caffeine.mean - NoCaffeine.mean)
[1] 3.5
>  print("Sample means:")
[1] "Sample means:"
> 
> print( paste("Caffeine:",Caffeine.mean) )
[1] "Caffeine: 248.3"
> print("Sample sizes:")
[1] "Sample sizes:"
> 
> print( paste("Caffeine:",Caffeine.n) )
[1] "Caffeine: 10"
> 
> print( paste("Decaf:",NoCaffeine.n) )
[1] "Decaf: 10"
> 
> print( paste("NoCaffeine:",NoCaffeine.n) )
[1] "NoCaffeine: 10"
> B = 100000
>  Caffeine.boot = numeric(B)
> NoCaffeine.boot = numeric(B)
for ( i in 1:B ) {
+ 	Caffeine.boot[i] = mean(sample(Caffeine,size=Caffeine.n,replace=TRUE))
+ 	NoCaffeine.boot[i] = mean(sample(NoCaffeine,size=NoCaffeine.n,replace=TRUE)) 
+ }
> boot.stat = Caffeine.boot - NoCaffeine.boot
> 
> print("95% confidence interval")
[1] "95% confidence interval"
> 
> print(round(quantile( boot.stat, c(0.025,0.975)),1) )
 2.5% 97.5% 
  1.6   5.4 

#3 Compare the widths of the confidence intervals for the individual population means and for the difference in population means. What is the ratio of these widths? Which is larger?
width of the confidence interval for Group NoCaffeine
 246.18-243.42
[1] 2.76
width of the confidence interval for Group Caffeine
> 249.6000-247.0975
[1] 2.5025
width of the confidence interval for Group of  caeine minus decaf
> 5.4-1.6
[1] 3.8

#ratio
2.5025:2.76:3.8
=1:1.10:1.518

#width of the confidence interval for Group of  caeine minus decaf is larger.

#4. Write an interpretation of one of the confidence intervals for the difference in means

Interpretation:
I am 99% confident that the true difference in population mean Caffeine and NoCaffine responses is in (1.6,5.4)

