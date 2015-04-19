---
title: "MSDA 607 - Project 2 - Exploratory Analysis"
author: "Sekhar Mekala"
date: "Sunday, March 08, 2015"
output: html_document
---
# Initial Analysis

We are given 4 data sets, and are asked to perform exploratory analysis. Before performing any analysis, the given data must be read into R Objects, so that we can use R's ability to perform statistical analysis. Upon looking at the data, I found that the 4 data sets do not have any NA values, and are pretty small (each data set has just 2 variables, with 11 observations). Also since the given data is in tabluar form, the best R object to support this structure will be a data.frame. Four data frames have to be created to hold the given 4 data sets. The data frames D1, D2, D3, and D4 will hold the data of I, II, III and IV data sets respectively. Each of the data frames D1, D2, D3 and D4 will have 2 variables X and Y.

**NOTE:** Upon close observation, the data sets I, II and III have the same X variable values. Hence in the following R Code, the X vector is prepared only once to create the D1, D2 and D3 Data frames. But for data set IV, the X variable has different values, so a new X vector is prepared to create the Data frame D4. 

```{r}
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

```

Let us print all the 4 data sets content, along with their data summaries. Since the number of observations in the data sets are small, I am printing all the contents of the data sets. In the real world problems, the data sets are often large, and it is not easy to list the whole data sets contents. We can use fucntions such as head() and tail() to display some first and last records of data set respectively.

**Contents of D1 Data frame and its summary information**

```{r}
D1
summary(D1)
```
**Contents of D2 Data frame and its summary information**

```{r}
D2
summary(D2)
```

**Contents of D3 Data frame and its summary information**


```{r}
D3
summary(D3)
```

**Contents of D4 Data frame and its summary information**

```{r}
D4
summary(D4)
```

The summary report of the data frames (D1, D2, D3 and D4) inform that the variables X and Y in all the given data frames are numeric. We will use table() function, to determine how the observations are distributed in the data frames.


```{r}
table(D1$X)
table(D1$Y)
table(D1$X,D1$Y)

table(D2$X)
table(D2$Y)
table(D2$X,D2$Y)

table(D3$X)
table(D3$Y)
table(D3$X,D3$Y)

table(D4$X)
table(D4$Y)
table(D4$X,D4$Y)
```


Except for D4 data frame, all other data frames (D1, D2, D3) have distinct observations for X and Y values. For data frame D4, there are 10 values for X=8 and one value for X=19. Looks like the value X=19, might be an outlier. Let us draw the box plots to find any outliers in the X and Y variables of the 4 data frames. But before doing any graphical analysis, we have to perform data massaging, for easier anaysis, and for easier creation of graphs.

#Data Massaging

To make our analysis more easy, let us create a data frame D_Temp, to contain the data in a format, which is easy to plot graphs. This data frame's content will change, depending on our need, and it is a temporary data frame. Our first step in the analysis is to graph box plots for X and Y variables in D1, D2 and D3 data frames. These three data frames are having the same X values for its observations, and hence my plan is to plot the box plots side by side for the variables of D1, D2 and D3. The D_Temp data frame will have two variables "type" and "value". The type variable will have 4 different values X1, Y1, Y2, Y3. The type=X1 observations will represent the X observations from D1, D2, and D3 Data frames. Note that the X variable in these three data frames D1, D2, and D3 have the same values. Hence I am representing the the X variable values from these three data sets only once. The observations with type=Y1, Y2, Y3 represent the Y observations from D1, D2, D3 data frames respectively.

**D_Temp data frame creation, to plot box plots for D1, D2, D3 data frame variables (side-by-side):**

```{r}
D_Temp <- data.frame(type=c(rep('X1',length(D1$X)),rep('Y1',length(D1$Y)),rep('Y2',length(D2$Y)),rep('Y3',length(D3$Y))),value=c(D1$X,D1$Y,D2$Y,D3$Y))
```

Let us display the data from D_Temp data frame. Observe that the X and Y values of D1, D2 and D3 are pivoted, and the type variable of D_Temp represents the data frame source, to which the observations belong to.

```{r}
D_Temp
```

Let us plot Box plots for X1, Y1, Y2, and Y3 values of D_Temp data frame.

```{r}

library("ggplot2")

ggplot(D_Temp,aes(x=type,y=value))+
 geom_boxplot()
```

**Figure-1: Box plots of X, Y variables in D1, D2, and D3 data sets. X1, box plot belongs to D1, D2, and D3 data frame's X values, and Y1, Y2, Y3 box plots belong to D1, D2 and D3 data frame's Y values respectively**

In the above box plots (Figure 1), the X1 box plot represent the box plot for X values of D1 (and, D2 and D3, since all these data frames have the same X values). The other plots Y1, Y2 and Y3 represent the data related to Y variable in D1, D2 and D3 respectively.

From the three box plots, we can infer the following:

* None of the X values have any outliers.
* The Y values of D2 has an outlier
* The Y values of D3 has an outlier
* The observations of Y variable in D2 are skewed towards left (lower values of Y in D2)
* The observations of Y variable in D3 are skewed towards right (higher values of Y in D3)


Let us plot a box plot for D4 Data frame also. Note that we are plotting the D4 variables box plots separately, since the X values are different for D4 data frame, while the other data frames have the same X values. We will use the same data frame D_Temp, again to hold the pivoted data of D4 Data frame. We will over write the existing contents of D_Temp data frame with the values of D4 Data frame.


```{r}
D_Temp <- data.frame(type=c(rep('X4',length(D4$X)),rep('Y4',length(D4$Y))),value=c(D4$X,D4$Y))

ggplot(D_Temp,aes(x=type,y=value))+
 geom_boxplot()
```

**Figure-2: Box plot of D4's X and Y variables**

In the above box plots (Figure-2), the X4 box plot represents the values of X variable in D4 Data set, and Y4 box plot represents the values of Y variable in D4 Data set.
We can infer that the X values of D4 data frame has one outlier and Y variable has one outlier.

Given the numerical nature of the observations, regression alanysis, would give us more information about the data. But let us do cluster analysis first. This analysis helps us to decide if we have to perform regression analysis on the 4 data sets separately or should they be combined.

We will concatenate the D1, D2, D3, and D4 data frames vertically into D_Temp data frame.

```{r}
D_Temp <- rbind(merge(data.frame(D1),c('D1')), merge(data.frame(D2),c('D2')), merge(data.frame(D3),c('D3')), merge(data.frame(D4),c('D4')))
names(D_Temp) <- c('X','Y','Source')
#The Source variable represent the data frame, to which the observations belong to

D_Temp
ggplot(D_Temp,aes(x=X,y=Y,color=Source,shape=Source))+
geom_point(pch=16,size=5)
```

**Figure-3: Scatter plot of (X,Y) observations from all the data frames (D1, D2, D3, D4)**

In the above scatter plot (Figure-3), we can see that each of the 4 data frames data are distributed independently, and there is no common pattern or clusters. This will be more evident by plotting the scatter plots for X and Y variables in all the data frames, separately.

```{r}

library("gridExtra")


P1 <- ggplot(data=D1,aes(x=X, y=Y)) +
  geom_point(pch=16,color="blue",size=4) +
  labs(title="D1 data", x="X", y="Y")

P2 <- ggplot(data=D2,aes(x=X, y=Y)) +
  geom_point(pch=16,color="blue",size=4) +
  labs(title="D2 data", x="X", y="Y")

P3 <- ggplot(data=D3,aes(x=X, y=Y)) +
  geom_point(pch=16,color="blue",size=4) +
  labs(title="D3 data", x="X", y="Y")

P4 <- ggplot(data=D4,aes(x=X, y=Y)) +
  geom_point(pch=16,color="blue",size=4) +
  labs(title="D4 data", x="X", y="Y")

grid.arrange(P1, P2, P3, P4, ncol=2)


```

**Figure-4: Scatter plots of (X,Y) values of D1, D2, D3 and D4 Data frames**

The above scatter plots (Figure-4) suggest that each data frame's data has different scatter plots, and we cannot just obtain a common regression model for all the data (X and Y variables), in D1, D2, D3 and D4.

Let us perform regression analysis separately, on each of the 4 data sets.

#Regression Analysis
We will plot the linear regression lines on each of the scatter plots, and also obtain the corresponding Residual plot to determine, if our linear regression models reasonably model the respective scatter plot. If the residual plot has a specific pattern, then we have to perform further analysis to see if any other non-linear or logistic models fit the scatter plots. In this analysis, I assumed that Y is the dependent variable, and X as the exploratory (or independent) variable. Please **NOTE** that no regression model can be used to identify the cause and effect relationship. Hence there is NO way we can say that the variable Y is dependent on X or X variable is dependent on Y. To identify the cause and effect relationship between 2 variables, we need to perform hypothesis testing, which is out of the scope of this analysis.

Let us now use the linear regression models, plot the scatter plots, and the corresponding residual plots.

```{r}
Fit_D1 <- lm(Y~X,data=D1)

P1 <- ggplot(data=D1,aes(x=X, y=Y)) +
  geom_point(pch=16,color="blue",size=4) +
  geom_smooth(method="lm",color="red") +
  labs(title="D1 data scatter plot", x="X", y="Y")

R1 <- ggplot(data=D1,aes(x=X, y=residuals(Fit_D1))) +
  geom_point(pch=16,color="blue",size=4) +
  labs(title="D1 residual plot", x="X", y="Residual")

Fit_D2 <- lm(Y~X,data=D2)
  
P2 <- ggplot(data=D2,aes(x=X, y=Y)) +
  geom_point(pch=16,color="blue",size=4) +
  geom_smooth(method="lm",color="red") +
  labs(title="D2 data scatter plot", x="X", y="Y")

R2 <- ggplot(data=D2,aes(x=X, y=residuals(Fit_D2))) +
  geom_point(pch=16,color="blue",size=4) +
  labs(title="D2 residual plot", x="X", y="Residual")

Fit_D3 <- lm(Y~X,data=D3)
 
P3 <- ggplot(data=D3,aes(x=X, y=Y)) +
  geom_point(pch=16,color="blue",size=4) +
  geom_smooth(method="lm",color="red") +
  labs(title="D3 data scatter plot", x="X", y="Y")

R3 <- ggplot(data=D3,aes(x=X, y=residuals(Fit_D3))) +
  geom_point(pch=16,color="blue",size=4) +
  labs(title="D3 residual plot", x="X", y="Residual")
 

Fit_D4 <- lm(Y~X,data=D4)

P4 <- ggplot(data=D4,aes(x=X, y=Y)) +
  geom_point(pch=16,color="blue",size=4) +
  geom_smooth(method="lm",color="red") +
  labs(title="D4 data scatter plot", x="X", y="Y")

R4 <- ggplot(data=D4,aes(x=X, y=residuals(Fit_D4))) +
  geom_point(pch=16,color="blue",size=4) +
  labs(title="D4 residual plot", x="X", y="Residual")



grid.arrange(P1, R1, ncol=2)
summary(Fit_D1)
grid.arrange(P2, R2, ncol=2)
summary(Fit_D2)
grid.arrange(P3, R3, ncol=2)
summary(Fit_D3)
grid.arrange(P4, R4, ncol=2)
summary(Fit_D4)
```

**Figure-5: Linear regression models, Residual plots, Summary of the models**

Looking at the residual plots, except for D1 data frame, all other residual plots have a specific pattern, suggesting us to use a non-linear regression model for D2, D3 and D4. But note that the residual plots may have specific patterns due to presence of outliers also.

While D1 data frame's residual plot does not have any pattern, the R-Squared value of D1's scatter plot is approximately 66%, which is very less. So we will check, if any other regression models on D1 can improve the R-Squared value of D1 Scatter plot.

Let us find the R-Squared value for the following transformations of X and Y (in D1):
$$log(Y), log(X)$$
$$Y, X^2$$
$$Y,1/X$$

```{r}
Fit_D1 <- lm(log(D1$Y) ~ I(log(D1$X)))
summary(Fit_D1)

Fit_D1 <- lm(D1$Y ~ I(D1$X^2))
summary(Fit_D1)

Fit_D1 <- lm(D1$Y ~ I(1/D1$X))
summary(Fit_D1)

```

Among all the transformations, the log(X) and log(Y) transformations have the greatest R-Squared value of 70.52%. But the linear regression between X and Y has 66% of R-Squared value, almost same as log(X) and log(Y) transformation. So we will use the linear regression obtained in Figure-5, to model the D1 data. The linear regression line to model D1 data is given below. Figure-5 gives more information (see the summary information of D1 data frame in Figure-5):
$$Y=0.5001X + 3.0001$$.

**Fitting regression line for D2**
The scatter plot of D2 (in Figure-5) shows that the relationship between X and Y variables of D2 as exponential (as the shape of the scatter plot looks like a parabola). So a linear regression model is not appropriate to model D2 data. Also the residual plot of D2 is having a specific pattern, hence the linear regression model is not appropriate for D2 data. Let us generate a polynomial regression model to find the relationship between X and Y variables in D2 Data frame.

```{r}
Fit_D2 <- lm(Y ~ poly(X, 2, raw=TRUE),data=D2)
P2 <- ggplot(data=D2,aes(x=X, y=Y)) +
     geom_point(pch=16,color="blue",size=4) +
     geom_smooth(method="lm",color="red") +
     stat_smooth(method="lm", se=TRUE, fill=NA, formula=y ~ poly(x, 3, raw=TRUE),colour="black") +
     labs(title="D2 data scatter plot", x="X", y="Y")

R2 <- ggplot(data=D2,aes(x=X, y=residuals(Fit_D2))) +
  geom_point(pch=16,color="blue",size=4) +
  labs(title="D2 residual plot", x="X", y="Residual")

grid.arrange(P2, R2, ncol=2)


```

**Figure-6: Polynomial regression od degree 2, to model D2 Data**

The regression equation for D2 is given by printing Fit_D2

```{r}
print(Fit_D2)
```

The regression function for D2 is obtained as $$Y=-0.1267X^2+2.7808X-5.9957$$

The summary(Fit_D2) shows that the R-Squared value for the above polynomial function is 1, which is a perfect fit.

```{r}
summary(Fit_D2)
```

**Fitting regression line for D3**

In Figure-5, in the linear regression of D3, we can see that a linear regression model should fit the data of D3. But the residual plot of D3 data suggests that linear model is not appropriate, since there is specific pattern of data in D3 residual plot. However, in D3 scatter plot, we see that there is an outlier (Y = 12.74). So we will first try to eliminate this observation from the D3 data frame, and plot the linear regression line, along with the new residual plot. If the residual graph is scattered, then we can consider the linear regression model obtained (after eliminating the outlier observation) is appropriate to model D3 Data.

```{r}
D3 <- D3[-which(D3$Y==12.74),]

Fit_D3 <- lm(Y~X,data=D3)
 
P3 <- ggplot(data=D3,aes(x=X, y=Y)) +
  geom_point(pch=16,color="blue",size=4) +
  geom_smooth(method="lm",color="red") +
  labs(title="D3 data scatter plot", x="X", y="Y")

R3 <- ggplot(data=D3,aes(x=X, y=residuals(Fit_D3))) +
  geom_point(pch=16,color="blue",size=4) +
  labs(title="D3 residual plot", x="X", y="Residual")

grid.arrange(P3, R3, ncol=2)

summary(Fit_D3)

print(Fit_D3)
```

**Figure-7: Modified scatter plot, Linear Regression line and Residual plot of D3 data (after removing the outlier of D3$Y)**

The above plots show that after eliminating the outlier Y = 12.74 from D3 data frame, the linear model looks appropriate to model D3 data, since there is no specific pattern in the residual plot. Also the R-Squared value of Fit_D3 (new linear model) is showing as 1. Hence the following model is appropriate for D3 Data.

The regression function to model D3 data is given below
$$Y=0.3454X + 4.0056$$

**Fitting regression line for D4**
For D4 Data frame also, we see an outlier for X=19. So we will eliminate this outlier observation and verify, if the resulting residual plot for linear regression line deoes not have any specific pattern. We will also check if R-Squared value for the new linear model, after the elimination of outlier (X=19), is high.

```{r}
D4 <- D4[-which(D4$X==19),]


Fit_D4 <- lm(Y~X,data=D4)

P4 <- ggplot(data=D4,aes(x=X, y=Y)) +
  geom_point(pch=16,color="blue",size=4) +
  geom_smooth(method="lm",color="red") +
  labs(title="D4 data scatter plot", x="X", y="Y")

R4 <- ggplot(data=D4,aes(x=X, y=residuals(Fit_D4))) +
  geom_point(pch=16,color="blue",size=4) +
  labs(title="D4 residual plot", x="X", y="Residual")



grid.arrange(P4, R4, ncol=2)
```

**Figure-8: Modified scatter plot, Linear Regression line and Residual plot of D4 data (after removing the outlier of D4$X)**

For D4, the residual is also showing a specific pattern, even after eliminating the outlier X=19. But if we observe the plot, there is no correlation between X and Y, after eliminating the outlier, since we have all the observations as X=8, and the Std. Dev of X will be 0. Hence we can model the observations as X=8. This means, Y can assume any value, but X remains the same (X=8). But if we do not eliminate the outlier, we will get the following linear model for D4 (see figure-5)

$$Y=0.4999X+3.0017$$

In summary, here are the best models to model the I, II, III, and IV data sets:

**Data set I:**
$$Y=0.5001X + 3.0001$$

**Data set II:**
$$Y=-0.1267X^2+2.7808X-5.9957$$

**Data set III (After eliminating the outlier):**
$$Y=0.3454X + 4.0056$$

**Data set IV (After eliminating the outlier):**
$$X = 8$$

**Data set IV (by including the outlier):**
$$Y=0.4999X+3.0017$$

For the data set IV, unless we have some more observations we cannot determine which of the two models is optimal.

##End of Project Report