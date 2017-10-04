1. Use the ggplot2 library to draw a suitable graph of the Smokers variable, the percentage of
residents who smoke. Describe the shape and center of this distribution
>tab = with(USStates, table(Smokers))
> tab/sum(tab)
Smokers
11.5 15.2 16.5   17 17.6 17.8 17.9   18 18.1 18.5 18.9 19.2 19.3 19.8 19.9   20 20.1 20.2 20.4 20.5 20.6 20.7 20.8 21.3 
0.02 0.02 0.02 0.02 0.02 0.02 0.02 0.02 0.02 0.02 0.02 0.02 0.02 0.06 0.02 0.04 0.02 0.02 0.04 0.02 0.04 0.02 0.02 0.04 
21.5 21.7   22 22.1 22.3 22.5 22.6 23.1 23.4 23.5 23.6 24.8 24.9 25.1 26.7 27.3 28.7 
0.02 0.02 0.02 0.02 0.02 0.02 0.04 0.02 0.02 0.02 0.04 0.02 0.02 0.02 0.04 0.02 0.02 
> require(ggplot2)
> ggplot(USStates, aes(x = Smokers)) + geom_bar()

shape and center of this distribution:
Bell-shaped, assymetric, dentered at 20

2. What is the mean proportion of smokers, averaged evenly across the 50 states?
with(USStates, mean(tab/sum(tab)))
[1] 0.02439024

3. Write a function in R that will take 10,000 random samples of 5 states and return the mean
proportion of smokers for each sample. This is a simulation of the sampling distribution of
the sample mean proportion of smokers. Calculate the mean and standard deviation of this
sampling distribution and use ggplot2 to display the distribution with a density plot. Describe
the center and shape of the distribution in this plot
> 	samplingdistribution<-function(size=10000)
+ 	{
+ 		mymeans<-numeric(size)
+ 		for(i in 1:size){
+ 		x<-sample(USStates$Smokers,5)
+ 		mymeans[i]<-mean(x)
+ 		}
+ 		m<-mean(mymeans)
+ 		s<-sd(mymeans)
+ 		value<-c(m,s)
+ 		return(value)
+ 		}
> samplingdistribution()
[1] 21.02166  1.34306