# download a text Document 

#download.file
#download.file can be used to download a single file as described by url from the internet and store it in destfile. The url must start with a scheme such as http://, https://,

url <- "http://faculty.chicagobooth.edu/lubos.pastor/research/liq_data_1962_2013.txt"
x= download.file(url, "file.txt" )
print(x)
?download.file

print(x)


url2 ="http://learninganalytcs.in/fms.txt"
x2= download.file(url, "file.txt" )
print(x2)
