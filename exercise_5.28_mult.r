exercise_5.28_mult <- function(n)
{
  x <- 0:10
  y <- 0:10
  p_matrix <- matrix(ncol=(n+1),nrow=(n+1),c(0))
  
  #x represents getting a 5 in n trials of rolling a die
  #y represents getting an even number in n trials
  
  #p(of getting even) = 1/2
  #p(getting odd) = 1/2
  #p(x=5 and odd) = p(x=5|x=odd).p(x=odd) = (1/3) (1/2) = 1/6
  #p(x=5 and odd) = p(x=odd|x=5).p(x=5) = 1.1/6 = 1/6
  #p(x=5 and not odd) = p(x=5 | not odd) . p(not odd) = 0
  #p(not 5 and odd) = p(not 5 | odd ) . p(odd) = 2/3 . 1/2 = 1/3
  #p(not 5 and not odd) = p(not 5 | not odd ) . p(not odd) = 1 . 1/2 = 1/2
  
  # you need P(E) = 1/2, P(ODD) = 1/2 AND P(5 AND ODD) = 1/6
  r <- 0
  c <- 0
  
  for(i in 0:n)
  { r <- (r+1)
    c <- 0
    for (j in 0:(n-i))
    {
      c <- (c+1)
      p_matrix[r,c] <- dmultinom(c(i,j,(n-i-j)),prob=c(1/2,1/6,1/2))    
    }
  }
  
  return(p_matrix)
 }
