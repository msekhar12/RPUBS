#Project 2 - 607 course

#We are given 4 data sets. Let us collect these 4 data sets data into 4 data.frames:

#> with(data=D3,plot(x,Y))

#Let us read the data into 4 different data sets D1, D2, D3, and D4. Each of these 4 data frames have 2 variables, X and Y

X <- c(10,8,13,9,11,14,6,4,12,7,5)  
Y <- c(8.04,6.95,7.58,8.81,8.33,9.96,7.24,4.26,10.84,4.82,5.68)

D1 <- data.frame(X=X,Y=Y)

Y <- c(9.14,8.14,8.74,8.77,9.26,8.10,6.13,3.1,9.13,7.26,4.74)
D2 <- data.frame(X=X,Y=Y)

Y <- c(7.46,6.77,12.74,7.11,7.81,8.84,6.08,5.39,8.15,6.42,5.73)
D3 <- data.frame(X=X,Y=Y)

X <- c(8,8,8,8,8,8,8,19,8,8,8)
Y <- c(6.58,5.76,7.71,8.84,8.47,7.04,5.25,12.5,5.56,7.91,6.89)

D4 <- data.frame(X=X,Y=Y)

#The data collection is done

#Let us analyze each data frame separately.

library(ggplot2)
library(gridExtra)


#Analyzing D1 Dataframe.

#Let us add the residuals as a separate variable to D1 dataframe. Let the variable name be R

D1$R <- residuals(lm(Y~X,data=D1))

P1 <- ggplot(data=D1,aes(x=X, y=Y)) +
  geom_point(pch=17,color="blue",size=4) +
  geom_smooth(method="lm",color="red") +
  labs(title="D1 Data frames data", x="X", y="Y")

R1 <- ggplot(data=D1,aes(x=X, y=R)) +
  geom_point(pch=17,color="blue",size=4) +
  labs(title="D1 residual plot", x="X", y="Residual")

#grid.arrange(P1, R1, ncol=2)


D2$R <- residuals(lm(Y~X,data=D2))

P2 <- ggplot(data=D2,aes(x=X, y=Y)) +
  geom_point(pch=17,color="blue",size=4) +
  geom_smooth(method="lm",color="red") +
  labs(title="D2 Data frames data", x="X", y="Y")

R2 <- ggplot(data=D2,aes(x=X, y=R)) +
  geom_point(pch=17,color="blue",size=4) +
  labs(title="D2 residual plot", x="X", y="Residual")


D3$R <- residuals(lm(Y~X,data=D3))

P3 <- ggplot(data=D3,aes(x=X, y=Y)) +
  geom_point(pch=17,color="blue",size=4) +
  geom_smooth(method="lm",color="red") +
  labs(title="D3 Data frames data", x="X", y="Y")

R3 <- ggplot(data=D3,aes(x=X, y=R)) +
  geom_point(pch=17,color="blue",size=4) +
  labs(title="D3 residual plot", x="X", y="Residual")


D4$R <- residuals(lm(Y~X,data=D4))

P4 <- ggplot(data=D4,aes(x=X, y=Y)) +
  geom_point(pch=17,color="blue",size=4) +
  geom_smooth(method="lm",color="red") +
  labs(title="D4 Data frames data", x="X", y="Y")

R4 <- ggplot(data=D4,aes(x=X, y=R)) +
  geom_point(pch=17,color="blue",size=4) +
  labs(title="D4 residual plot", x="X", y="Residual")


grid.arrange(P1, R1, P2, R2, P3, R3, P4, R4, ncol=2)





P2 <- ggplot(data=D2,aes(x=X, y=Y)) +
  geom_point(pch=17,color="blue",size=4) +
  geom_smooth(method="lm",color="red",formula=(Y~sqrt(X),data=D2)) +
  labs(title="D2 Data frames data", x="X", y="Y")

P2

R2 <- ggplot(data=D2,aes(x=X, y=R)) +
  geom_point(pch=17,color="blue",size=4) +
  labs(title="D2 residual plot", x="X", y="Residual")

grid.arrange(P2, R2, ncol=2)

summary(P1)


fit2 <- lm(Y ~ poly(X, 2, raw=TRUE),data=D2)
#lm(y ~ poly(x, 3, raw=TRUE))

plot(D2$X,(D2$Y))

P3

P3+
geom_smooth(method='lm',formula=D3_MOD$Y ~ D3_MOD$X)

P3_MOD <- ggplot(data=D3_MOD,aes(x=X, y=Y)) +
  geom_point(pch=17,color="blue",size=4) +
  geom_smooth(method="lm",color="red") +
  labs(title="D3_MOD Data frames data", x="X", y="Y")

P3_MOD