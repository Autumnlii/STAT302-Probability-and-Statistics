HOMEWORK#3
TASK 1

>  install.packages("Lock5Data")
> install.packages("ggplot2")
> library(Lock5Data)
> data(USStates)
> str(USStates)

> tab = with(USStates, table(Smokers))
> tab/sum(tab)

> require(ggplot2)
Loading required package: ggplot2
> ggplot(USStates, aes(x = Smokers)) + geom_bar()

> with(USStates, mean(tab/sum(tab)))
[1] 0.02439024
attach()