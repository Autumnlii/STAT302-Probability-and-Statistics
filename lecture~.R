> ll = c(10,10,11,9,12,11,9,17)
> 
> ld = c(5,6,7,8,3,8,6,6,4)
> x =c(ll,ld)
> x
 [1] 10 10 11  9 12 11  9 17  5  6  7  8  3  8  6  6  4
> sample(x)
 [1] 10 10  3  6  9  6 11  9  8  8 12 11  4  6  7  5 17
> f = function(x) {
+ return(mean(x[1:9]) - mean(x[10:18]))
+ }
> f(sample(x))
[1] NA
> mean.
Error: object 'mean.' not found
> out = numeric(10000)
> length(out)
[1] 10000
> for (i in 1:100000){
+ out[i]
+ }
> > for (i in 1:10000){
Error: unexpected '>' in ">"
> for (i in 1:10000){
+ out[i] = f(sample(x))
+ }
> meant(out)
Error: could not find function "meant"
> mean(out)
[1] NA
> ggplot(data.frame(out),aes(x=out))+geom_density()
Error: could not find function "ggplot"
> sum(out >= 5)
[1] NA
> sum(out >= 5) / length
Error in sum(out >= 5)/length : non-numeric argument to binary operator
> f(x)
[1] NA
> there is a very strong evidence that the avarage weight for the mice in the 24-hour light is larger the average gain in the group(p=0,ranodmization test)
Error: unexpected symbol in "there is"
> 