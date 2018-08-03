# download a text Document 

#download.file
#download.file can be used to download a single file as described by url from the internet and store it in destfile. The url must start with a scheme such as http://, https://,


url2 ="http://52.66.73.63/docs/fms.txt"
download.file(url2, "fms.txt" )
download.file(url2, "./download/fms.txt" )

url3 ="http://52.66.73.63/docs/rowling.txt"
download.file(url3, "./download/rowling.txt" )




#readtext
library(readtext)
readtext("./download/rowling.txt")

#url.show
url.show("http://52.66.73.63/docs/rowling.txt")

#file.show
file.show("./download/rowling.txt")

url = "http://vincentarelbundock.github.io/Rdatasets/csv/datasets/iris.csv"
download.file(url, "./download/iris.csv", quiet=TRUE)


library(httr)
url <- "https://rawgit.com/yoke2/dsxref/master/iris.xlsx"
GET(url, write_disk("./download/iris.xlsx", overwrite=TRUE))


library(downloader)
#format is not correct
urlforR= "https://github.com/dupadhyaya/analytics/blob/master/15a-DS/20a-vectors.R"
download(urlforR,"./download/vector.R")
downloader::source_url(urlforR)
