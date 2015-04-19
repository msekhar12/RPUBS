exercise_5.39 <- function(pa)
{
  pb <- (1 - pa)
  
  #whoever gets 1 is winner
  #If you get 0, A wins, else B wins
  
  status <- replicate(4,sample(0:1,1,replace=F,prob=c(pa,pb)))
  l <- length(which(status == 1))
  
  if(l == 4 || l == 0) return(4)

  for(i in 1:3)
  {
    status <- c(status,sample(0:1,1,replace=F,prob=c(pa,pb)))
    l_1 <- length(which(status == 1))
    l_2 <- length(which(status == 0))
    if(l_1==4) 
      {
      return(length(status))
    }

    if(l_2==4) 
    {
      return(length(status))
    }
    
    
  }
  
}



mean(replicate(100000,exercise_5.39(0.25)))
#5.16323
sd(replicate(100000,exercise_5.39(0.25)))
#1.019041


mean(replicate(100000,exercise_5.39(0.6)))
#5.69563
sd(replicate(100000,exercise_5.39(0.6)))
#1.034999