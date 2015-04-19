https://github.com/srajeev1/607Project3/blob/master/Final_Analysis_File/Awards_File.csv

moby_url = url("http://www.gutenberg.org/ebooks/2701.txt.utf-8")
# reading the content (first 500 lines)
moby_dick = readLines(moby_url, n = 500)

#To download a file from the web:

setInternet2(TRUE)


taxon_url = "http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/taxon.txt"

taxon = read.table(taxon_url, header = TRUE, row.names = 1)

taxon

#But to read https: web pages, we have to use RCurl package:
library(RCurl)

my_URL <- getURL("https://github.com/srajeev1/607Project3/blob/master/Final_Analysis_File/Awards_File.csv",ssl.verifypeer=FALSE)

my_URL <- getURL("https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data",ssl.verifypeer=FALSE)
my_df <- read.csv(textConnection(my_URL),header=TRUE)
my_df <- read.table(my_URL,header=TRUE)
head(my_df)


#To read excel sheet

alpha_xls <- "C:/Users/Sekhar/Documents/CUNY Challenge"



#Reading google doc

https://docs.google.com/spreadsheets/d/132TLy3AnpBMJy0uKMNqmTe45DJsGkOrV-jyMSlrqOk8/edit#gid=0

google_docs = "https://docs.google.com/spreadsheet/"
my_key <- "d/132TLy3AnpBMJy0uKMNqmTe45DJsGkOrV-jyMSlrqOk8/edit#gid=0"

my_excel <- getURL("https://docs.google.com/spreadsheets/d/1PUJoCrW9ipLTniqnTEE5ixCucsHhcVz-E3bqKRSB-6M/edit#gid=0",ssl.verifypeer=FALSE)

read.csv(textConnection(my_excel), header = TRUE)


library(XML)
library(RCurl)
my_URL <- 
c('<!DOCTYPE html> '
,'<html> '
,'<head>'
,'<style>'
,'table, th, td {'
,'border: 1px solid black;'
,'border-collapse: collapse;'
,'}'
,'th, td {'
,'padding: 5px;'
,'}'
,'</style>'
,'</head>'
,'<body>'
,'<table style="width:100%">'
,'<tr>'
,'<th>Firstname</th>'
,'<th>Lastname</th>'  
,'<th>Points</th>'
,'</tr>'
,'<tr>'
,'<td>Jill</td>'
,'<td>Smith</td>'  
,'<td>50</td>'
,'</tr>'
,'<tr>'
,'<td>Eve</td>'
,'<td>Jackson</td>'  
,'<td>94</td>'
,'</tr>'
,'<tr>'
,'<td>John</td>'
,'<td>Doe</td>'  
,'<td>80</td>'
,'</tr>'
,'</table>'
,'</body>'
,'</html>'
)

readHTMLTable(my_URL, which = 1, stringsAsFactors = FALSE)
source(my_URL)
library(XML)


https://docs.google.com/document/d/1kqwrVodYtDDYbQm7r2fZB33HBfiXh0VWvXFcrDT6QMQ/edit?usp=sharing



#To read a google doc:

install.packages('gsheet')
library(gsheet)
gsheet2tbl('https://docs.google.com/spreadsheets/d/1PUJoCrW9ipLTniqnTEE5ixCucsHhcVz-E3bqKRSB-6M/edit#gid=0')


#To read HTML Page present at the google doc:
library(XML)
library(httr)

url <- "https://docs.google.com/document/d/1kqwrVodYtDDYbQm7r2fZB33HBfiXh0VWvXFcrDT6QMQ/edit"

r <- GET("https://docs.google.com/document/d/1kqwrVodYtDDYbQm7r2fZB33HBfiXh0VWvXFcrDT6QMQ/pub")
html <- content(r)
sheets <- readHTMLTable("https://docs.google.com/document/d/1kqwrVodYtDDYbQm7r2fZB33HBfiXh0VWvXFcrDT6QMQ/pub", which=1, stringsAsFactors=FALSE)






x<- c(
'[ {"BookName":'
,"\"DB2 Developer's Guide\","
,'"Author":"Craig Mullins",'
,'"ISBN":"Craig Mullins","Price":85}, '
,'{"Book Name":"Understanding DB2", '
,'"Author":"Raul F. Chong; Michael Dong; '
,'Dwaine R. Snow","ISBN":"B00EKYU6DI",'
,'"Price":120}, '
,'{"Book Name":"Probability: With Applications and R",'
,' "Author":"Robert P. Dobrow",'
,'"ISBN":"978-1118241257",'
,'"Price":101} ]'
)

library(XML)
library(RJSONIO)
cat(x)
#install.packages("RJSONIO", dependencies = TRUE)
class(x)
y <- fromJSON(x)







sw_data = rbind(
  c("DB2 Developer's Guide", "Craig Mullins", "978-0132836425", 85),
  c("Understanding DB2", "Raul F. Chong; Michael Dong; Dwaine R. Snow", "B00EKYU6DI",120),
  c("Probability: With Applications and R", "Robert P. Dobrow", "978-1118241257",101)
  )


swdf = data.frame(sw_data)
names(swdf) = c("BookName", "Author", "ISBN", "Price")
swdf

sw_json = toJSON(swdf)

cat(sw_json)

sw_R = fromJSON(sw_json)
cat(sw_R)