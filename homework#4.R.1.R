library(boot)
foo = c(8,10,7,12,13,8,10,50)
my.mean = function(x,indices) {
return( mean(x[indices]) )
}
boot.out = boot(foo,my.mean,1000000)
boot.ci(boot.out)
BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
Based on 1000000 bootstrap replicates

CALL : 
boot.ci(boot.out = boot.out)

Intervals : 
Level      Normal              Basic         
95%   ( 5.42, 24.09 )   ( 4.25, 20.88 )  

Level     Percentile            BCa          
95%   ( 8.62, 25.25 )   ( 9.12, 30.50 )  
Calculations and Intervals on Original Scale

#1. Describe the dierences among the four intervals. Where are they centered? How wide are
they?
The BCa interval is the largest one, then the seocnd large interval is the percentiel interval; the third large iterval is the normal interval; the smallest one is the basic one.
Normal Interval centered at 9.335
Basic Interval centered at 8.315
Percentile Interval centered at 8.315
BCa Interval centered at 10.69
Check to see that the \normal"

#2.bootstrap interval agrees with the mean plus or minus 1.96 times the estimated standard error
> 14.75+1.96*4.762691
[1] 24.08487

#3. Check to see that the percentile bootstrap matches what you and using quantile() on the
sampled means.
> quantile(boot.out$t,c(0.025,0.975))
  2.5%  97.5% 
 8.625 25.250 
 
 #4. make the density pot of the sample mean
 require(ggplot2)
> 
> g= ggplot(data.frame(x=boot.out$t),aes(x=x))+geom_density()
> o= geom_segment(aes(x=5.43,y=0.05,xend=24.08,yend=0.05), color="orange")
> y= geom_segment(aes(x=8.62,y=0.05,xend=25.25,yend=0.06), color="yellow")
> 
> p= geom_segment(aes(x=9.12,y=0.08,xend=30.05,yend=0.08), color="pink")
> 
> r= geom_segment(aes(x=9.12,y=0.08,xend=30.05,yend=0.08), color="red")
> g+o+y+p+r

describe the shape of the plot:
The shape of the distribution is either symmetric or bell-shaped, it is not centered at the middle as well.

#5. How does the BCa condence interval different most from the others?
BCa interval is larger than any other intervals.
