#NY Times Books API Scraping

library(RJSONIO)
library (RCurl)
library(stringr)

url <- "http://api.nytimes.com/svc/books/v3/lists/names.json?api-key=ae3ebf8d2c14b1623769762cea332b83:0:71863562"
web_data <- getURL(url)
#url <- "http://api.nytimes.com/svc/books/v3/lists/names.json?api-key=ae3ebf8d2c14b1623769762cea332b83%3A0%3A71863562"

web_data <- getURL(url)
#frm <- str_locate(web_data,"\\[")
#to <- str_locate(web_data,"\\]")
#web_data <- str_sub(web_data,frm,to)
ls <- fromJSON(web_data)$results
rbind(ls[[47]],ls[[46]])

library(dplyr)
#install.packages("data.table")
library(data.table)
df <- as.data.frame(rbindlist(lapply(ls,as.list)))


df

#The df$list_name_encoded can be used to get the best seller books details in various books categories using the following code:

#Code to parse the df$list_name_encoded details recursively using the following url, by substituting the list_name in the place of xxxxxxxxx
#url <- "http://api.nytimes.com/svc/books/v3/lists.json?list-name=xxxxxxxxx&api-key=ae3ebf8d2c14b1623769762cea332b83:0:71863562"
a <- nrow(df)

books_df <- data.frame()

for(b in 1:a)
{
  
  url <- paste("http://api.nytimes.com/svc/books/v3/lists.json?list-name=",df$list_name_encoded[b],"&api-key=ae3ebf8d2c14b1623769762cea332b83:0:71863562",sep="")
  web_data <- getURL(url)
  ls <- fromJSON(web_data)$results
  books <- list()
  
  
  k <- length(ls)
  for(i in 1:k)
  { print(i)
    books$category[i] <- ls[[i]]$list_name
    books$title[i] <- ls[[i]]$book_details[[1]]$title
    books$author[i] <- ls[[i]]$book_details[[1]]$author
    books$primary_isbn10[i] <- ls[[i]]$book_details[[1]]$primary_isbn10
    books$primary_isbn13[i] <- ls[[i]]$book_details[[1]]$primary_isbn13
    books$published_date <- ls[[i]]$published_date
    books$bestsellers_date <- ls[[i]]$bestsellers_date
    books$rank[i] <- ls[[i]]$rank
    books$amazon_link <- ls[[i]]$amazon_product_url
  }
  
  
  books_df <- rbind(books_df,data.frame(books))
  
  
  
  
  
}

head(books_df)
tail(books_df)



#Let us pull the information related to "Food and Fitness" books

#http://api.nytimes.com/svc/books/{version}/lists[.response_format]?{search-param1=value1}&[...]&[optional-param1=value1]&[...]&api-key={your-API-key}

url <- "http://api.nytimes.com/svc/books/v3/lists.json?list-name=food-and-fitness&api-key=ae3ebf8d2c14b1623769762cea332b83:0:71863562"
web_data <- getURL(url)


ls <- fromJSON(web_data)$results
rbind(ls[[47]],ls[[46]])

library(dplyr)
#install.packages("data.table")
library(data.table)
names(ls[[1]])
#We will just scrape the data related to the following fields:
#list_name
#bestsellers_date
#book_name
#rank
#author name
#amazon_product_url

ls[[1]]
#The above display shows the structure of ls and we need to perform the following to get the required details:

books <- list()
j <- length(ls)
for(i in 1:j)
{
  books$category[i] <- ls[[i]]$list_name
  books$title[i] <- ls[[i]]$book_details[[1]]$title
  books$author[i] <- ls[[i]]$book_details[[1]]$author
  books$primary_isbn10[i] <- ls[[i]]$book_details[[1]]$primary_isbn10
  books$primary_isbn13[i] <- ls[[i]]$book_details[[1]]$primary_isbn13
  books$published_date <- ls[[i]]$published_date
  books$bestsellers_date <- ls[[i]]$bestsellers_date
  books$rank[i] <- ls[[i]]$rank
  books$amazon_link <- ls[[i]]$amazon_product_url
}

books
data.frame(books)



