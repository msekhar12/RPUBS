#Bicycle project
#C:\Users\Sekhar\Downloads

library(lubridate)
train.df <- read.csv("C:/Users/Sekhar/Downloads/train.csv",stringsAsFactors=F)
head(train.df)
date <- fast_strptime( train.df$datetime, format="%Y-%m-%d %H:%M:%S")
train.df$hour <- hour(date)
train.df$datetime <- NULL

train.df$temp <- round(train.df$temp)
train.df$atemp <- round(train.df$atemp)
train.df$windspeed <- round(train.df$windspeed)

nrow(train.df[train.df$hour  == 8,])
str(train.df)

boxplot(train.df$count)

library(corrplot)

train.df[train.df$hour==0,]
plot(log(train.df[train.df$hour==0,]$count),log(train.df[train.df$hour==0,]$temp))

c <-cor(train.df[train.df$hour==9,], use="complete")
c[is.na(c)] <- 0
corrplot(na.omit(c), method = "circle")

plot((train.df[(train.df$hour==8&train.df$holiday==1),]$count),(train.df[(train.df$hour==8&train.df$holiday==1),]$temp))

