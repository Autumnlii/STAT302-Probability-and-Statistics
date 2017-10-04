R problem 2 Load the data set CommuteAtlanta into R.
> library(Lock5Data)
> data(SleepStudy)
> data(CommuteAtlanta)
> str(CommuteAtlanta)
'data.frame':	500 obs. of  5 variables:
 $ City    : Factor w/ 1 level "Atlanta": 1 1 1 1 1 1 1 1 1 1 ...
 $ Age     : int  19 55 48 45 48 43 48 41 47 39 ...
 $ Distance: int  10 45 12 4 15 33 15 4 25 1 ...
 $ Time    : int  15 60 45 10 30 60 45 10 25 15 ...
 $ Sex     : Factor w/ 2 levels "F","M": 2 2 2 1 1 2 2 1 2 1 ...
 1. How many cases are there? What variables are included? Find the mean and standard deviation
of each quantitative variable.
> nrow(CommuteAtlanta)
[1] 500
> ncol(CommuteAtlanta)
[1] 5
> with(CommuteAtlanta, mean(Age))
[1] 40.242
> with(CommuteAtlanta, mean(Distance))
[1] 18.156
> with(CommuteAtlanta, mean(Time))
[1] 29.11
> with(CommuteAtlanta, sd(Age))
[1] 12.08219
> with(CommuteAtlanta, sd(Distance))
[1] 13.79828
> with(CommuteAtlanta, sd(Time))
[1] 20.71831
> 
> with(CommuteAtlanta, mean(Distance))
[1] 18.156
> 
> Distance = with(CommuteAtlanta,Distance[!is.na(Distance)])
> 
2. Use R to apply the bootstrap: take 1000 bootstrap samples. Compute the standard deviation of
the 1000 sample means distances. Construct a 95% condence interval for the mean commute
distance in Atlanta
> length(Distance)
[1] 500
> Distance
  [1]  10  45  12   4  15  33  15   4  25   1  22  50  10  30  10  12   2  25   7   8  10  30  23  20   7   3   5   6  45
 [30]  35  25  15  17  50  10  30  10  20   5   4  21  12   5  32  10  12  35  31   3  22  20  30  20  50   7   8  11  25
 [59]  15   1  10  25  15  10  24  10   2   5  32  10  12  18   7  30  30   2   3   3   0  20  23  50  20  25   3  10  20
 [88]  16   1  20  25  20 101   7   5  20  14   8  33  16  35  10  32  14  15  40  15  18  10  12   8  18   2   1  30  23
[117]   4  28  10  20  10  15   5  35  12   8  20  45   9  15  45  20   8  12   3   6  30   0  15   0   2  20  12   3  15
[146]   3  17  30  60  38  30   2  23  20  20   1  58   7  20  27   3   5  15  17  25   6   5  16  30  10   3  15   0  35
[175]  38  50   9   7  23  15  12  12   5  25   8  30  34  35  49  30  60  25  20  62  23   2  20  20   0  10  17   8  37
[204]  25  10  30  10  35   5  60  10  17   4  10  25  12  30  10  22   0   5  16  17   0  18   5  35  50  33  10  15   6
[233]  10  13  18   4  30  30   1  20  25  30  25  38  18  12  12  39   5  15   8  13   3  30  13  30  50  20   4   8   7
[262]   8  26  23   7   7  15   5  22   3   6  10 100  30  10  20  11   2  30  10   6  25  11   3  20  30  35  15  35   6
[291]  22  13  30  40  45   7  38   2  12  35  11  38   0  30  30  30   3   1  25  34  45  10  30   5  25  10  25  25  13
[320]  22  30  22  35  26  15   8  15   4  15  90   8  30   6   6  25  23  33  15  15   4   5  23  15  20  23  33  36  22
[349]  12  10   7   5  12  12   5  10  15  12  25  15  17  25   5  10  12   7  45  10  31  15   3  25  12  20  30   1  15
[378]  35  14   7  11  36  15  25   2  20  11   5  12  12  28  22  35  18  15  25   1   8  12   5  14  12  15  10  10   6
[407]  20   6   8  30   5  10  10  20   0  13   0  20  25  35   4  20   3  10  30  15  12  35  25  20   8  45  10  25  15
[436]   8   4   3  28   6   5  10   7  10  46   3  35  20  27  15  20  32  15  10  20  40  23  18  10  22  15  12  35  10
[465]  30  35  18  14  15   5   0   7  20  16  38  20  22  30  14   1  45  15  22   9  15  15  20  30  25  15  25   9  15
[494]  10  26   3  10  18  34  13
> B = 1000
> n = length(Distance)
> xbar = mean(Distance)
> xbar
[1] 18.156
> boot.matrix = matrix(sample(Distance,size=B*n,replace=TRUE),B,n)
> dim(boot.matrix)
[1] 1000  500
> boot.stat = apply(boot.matrix,1,mean)
> > library(ggplot2)
Error: unexpected '>' in ">"
> library(ggplot2)
> ggplot(data.frame(x=boot.stat),aes(x=x))+geom_density()
> se = sd(boot.stat)
> se
[1] 0.6052652
> me = 2*se
> xbar + c(-1,1)*me
[1] 16.94547 19.36653
> me
[1] 1.21053
> me = round(me,2)
> 
> round(xbar + c(-1,1)*me, 2)
[1] 16.95 19.37
> 
> quantile(boot.stat,c(0.25,0.75))
    25%     75% 
17.7340 18.5425 
> round(quantile(boot.stat,c(0.25,0.75)),2)
  25%   75% 
17.73 18.54 
> quantile(boot.stat,c(0.025,0.975))
    2.5%    97.5% 
16.97725 19.30230 
> 
> round(quantile(boot.stat,c(0.025,0.975)),2)
 2.5% 97.5% 
16.98 19.30 

3. interpret the confident interval 
we have 95% conficence that the true mean is in the(16.9,19.30 )