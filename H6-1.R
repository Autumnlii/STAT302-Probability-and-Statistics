#homework-6
R problem 1
2. P (X > 260).
2. P (X > 260).4. P (260 < X < 300).
5. The number c so that P (X < c) = 0:9.
6. The number c so that P (X > c) = 0:24.
#1. P (X < 200).
> pnorm(200,250,30)
[1] 0.04779035

#2. P (X > 260).
> 1-pnorm(260,250,30)
[1] 0.3694413

#3
> pnorm(210,250,30)+1-pnorm(290,250,30)
[1] 0.1824224

#44. P (260 < X < 300).
> pnorm(300,250,30)-pnorm(260,250,30)
[1] 0.321651

#5. The number c so that P (X < c) = 0.9.
> qnorm(0.9,250,30)
[1] 288.4465

#6. The number c so that P (X > c) = 0:24.
> qnorm(0.24,250,30,lower.tail = FALSE)
[1] 271.1891

#7
> qnorm(0.09,250,30)
[1] 209.7773
> qnorm(0.91,250,30)
[1] 290.2227
 c=40.227
#8
> qnorm(0.45,250,30)
[1] 246.2302
> qnorm(0.55,250,30)
[1] 253.7698
c=3.7698