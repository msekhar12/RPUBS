exercise_5.38 <- function(n,p)
{
  #Identifies the average number of trials needed to pick n distinct values from a collection of n distinct items, with replacement
  #Exercise Doborow book: 210
  
  i <- 0
  j <- 1
  a = vector(length=n)
  a[j] <- sample(1:52,1,prob=dbinom(1:52,size=52,prob=1/2))
  print(a[j])
  remaining_coupons <- c(1:n)[-which(c(1:n) == a[j])]
  
  #print(a[j])
  #print(remaining_coupons)
  repeat
  {
    pick <- sample(1:52,1,prob=dbinom(1:52,size=52,prob=1/2))
    i <- (i+1)
    
    #   print(pick) 
    
    #if(all(pick %in% a)) 
    if(any(pick == a)) 
    {
      next
    }
    else
    {
      j <- (j+1)
      a[j] <- pick
   print(pick)
    }
    
    if(j == n) 
    {
      break
    }
  }
  return(i)
}