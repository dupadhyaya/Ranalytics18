

library(xml2)
url = "https://en.wikipedia.org/wiki/List_of_chocolate_bar_brands" #Repeat again here
choco_xml <- read_xml(url)
print(choco_xml)

write_xml(choco_xml,'chocolates.xml',options="as_xml")
write_html(choco_xml,file='chocolates.html',options="as_html")

r <- xml_find_all(choco_xml, "//table[@class='wikitable sortable']")
head(r)
a <- xml_children(r)
head(a)
x <- xml_text(a)
head(x)


z01 <- strsplit(x, '\n', fixed = T)
#set column names by the first element of list `z01[[1]]`
z01
df <- setNames(data.frame(matrix(unlist(z01), nrow = 285, byrow = T)), z01[[1]])
#not need the first row that became the column names
df <- df[-1,]
#not need "Image" column so remove
df$Image <- NULL