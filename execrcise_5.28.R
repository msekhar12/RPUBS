execrcise_5.28 <- function(n)
{
#set.seed()

x_5 <- vector()
x_even <- vector()
x_odd <- vector()

for(i in 1:n)
{
x <- sample(1:6,10,replace=T,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
x_5[i] <- length(x[which(x==5)])
x_even[i] <- length(x[which(x %% 2 == 0)])
x_odd[i] <- length(x[which(x %% 2 == 1)])


}
return(data.frame(x_even=x_even,x_odd=x_odd,x_5=x_5))
#return(list(cov_x_y=cov(x_5,x_even), cov_y_z=cov(x_5,x_odd)))
}
