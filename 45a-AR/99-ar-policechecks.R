# AR - Police Checks
#http://michael.hahsler.net/research/arules_RUG_2015/demo/#slides-code-and-about-the-author

if(!file.exists("./data/SQF 2012.csv")) {
  download.file("http://michael.hahsler.net/research/arules_RUG_2015/demo/Stop-and-Frisk-2012.zip","./data/Stop-and-Frisk-2012.zip")
  unzip("./data/Stop-and-Frisk-2012.zip")
}

dat <- read.csv("./data/SQF 2012.csv")
dim(dat)


data <- list(
  c("a","b","c"),
  c("a","b"),
  c("a","b","d"),
  c("b","e"),
  c("b","c","e"),
  c("a","d","e"),
  c("a","c"),
  c("a","b","d"),
  c("c","e"),
  c("a","b","d","e")
)

t <- as(data, "transactions")
t
## Mine itemsets with tidLists.
f <- eclat(data, parameter = list(support = 0, tidLists = TRUE))

?tidLists
f
tidLists(f)
## Get dimensions of the tidLists.
dim(tidLists(f))

## Coerce tidLists to list.
as(tidLists(f), "list")

## Inspect visually.
image(tidLists(f))

##Show the Frequent itemsets and respectives supports
inspect(f)
