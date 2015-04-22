.meta , h2

library(rvest)
url <- "http://www.r-bloggers.com/search/web%20scraping"
html_txt <- html(url)
#To parse single node
html_txt %>% 
  html_node("#leftcontent h2") %>%
  html_text() 
  
#To parse multiple nodes
html_txt %>% 
  html_nodes(".meta , .date , #leftcontent h2 span") %>%
  html_text()

#Gets the posts
html_txt %>% 
  html_nodes("#leftcontent h2") %>%
  html_text()

#Gets the authors and date
html_txt %>% 
  html_nodes(".meta , .date #leftcontent h2") %>%
  html_text()


#Gets the posts, authors and date
html_txt %>% 
  html_nodes(".meta , #leftcontent h2") %>%
  html_text()

#Gets the page numbers
html_txt %>% 
  html_nodes(".pages") %>%
  html_text()


library(XML)

html_p <- htmlParse(url)
class(html_p)
html_root <- xmlRoot(html_p)


# how many child nodes in root
xmlSize(html_root)

# names of root child nodes
xmlSApply(html_root, xmlName)

#html body

html_body <- xmlChildren(html_root)$body

xpathSApply(html_p, "h2")