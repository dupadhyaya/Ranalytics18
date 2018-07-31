#httr2

library(httr)
page_source <- function(url_name, parse_format){
  url <- modify_url(
    "https://en.wikipedia.org/w/api.php?",
    query = list(
      action = "query",
      titles = url_name,
      prop = "revisions",
      rvprop = "content",
      format = parse_format)
  )
  response <- GET(url)
  if(http_error(response)){
    stop("The request failed")}
  else {
    result <- content(response)
    return(result)
  }
}


a <- page_source("List_of_chocolate_bar_brands", "json")
str(a)

a01 <- page_source("List_of_chocolate_bar_brands", "jsonfm")
print(a01)
