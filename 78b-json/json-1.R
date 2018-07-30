

install.packages("rjson")
install.packages("RJSONIO")
install.packages("(RCurl")


{ 
  "ID":["1","2","3","4","5","6","7","8" ],
  "Name":["Rick","Dan","Michelle","Ryan","Gary","Nina","Simon","Guru" ],
  "Salary":["623.3","515.2","611","729","843.25","578","632.8","722.5" ],
  "StartDate":[ "1/1/2012","9/23/2013","11/15/2014","5/11/2014","3/27/2015","5/21/2013", "7/30/2013","6/17/2014"],
  "Dept":[ "IT","Operations","IT","HR","Finance","IT","Operations","Finance"]
}

# Load the package required to read JSON files.
library("rjson")

# Give the input file name to the function.
result <- fromJSON(file = "input.json")


library(RJSONIO)
library(RCurl)
json_file = getURL("https://raw.githubusercontent.com/isrini/SI_IS607/master/books.json")
json_file2 = RJSONIO::fromJSON(json_file)
head(json_file2)
# Print the result.
print(json_file2)
df <- as.data.frame(json_file2)
df
str(df)

#--------------------------

Token <- "245432532532"
source <- "http://......."
header_type <- "applcation/json"
full_token <- paste0("Bearer ", Token)
response <- GET(n_source, add_headers(Authorization = full_token, Accept = h_type), timeout(120), verbose())
text_json <- content(response, type = 'text', encoding = "UTF-8")
jfile <- fromJSON(text_json)
df <- as.data.frame(jfile)


data(Adult)
Adult
## select first 10 transactions
Adult[1:10]
## select first 10 items for first 100 transactions
Adult[1:100, 1:10]
## select the first 100 transactions for the items containing
## "income" or "age=Young" in their labels
Adult[1:100, c("income=small", "income=large" ,"age=Young")]


library("rjson")

{
  "TemperatureRegionID" : 419,
  "StartDate" : "07/23/2018 01:55:45 PM",
  "StopDate" : "07/23/2018 09:55:45 PM",
  "Interval" : "Minute",
}


#http://adminapi.fat.test.fleetmode.io/temperature-regions/get-history/

library(jsonlite)
library(httr)

req <- POST("http://api.scb.se/OV0104/v1/doris/sv/ssd/START/PR/PR0101/PR0101A/KPIFastM2", body = '{ "query": [], "response": { "format": "json" } }')
http://adminapi.fat.test.fleetmode.io/temperature-regions/get-history/
  req <- POST("http://adminapi.fat.test.fleetmode.io/temperature-regions/get-history/", body = '{ "query": [], "response": { "format": "json" } }')

req  

stop_for_status(req)
json <- content(req, "text")


# JSON starts with an invalid character:
validate(json)
json <- substring(json, 2)
validate(json)

# Now we can parse
object <- jsonlite::fromJSON(json)
print(objects)


library(jsonlite)

library(httr)

pc_json <- list{(
  'TemperatureRegionID' : 419,
  'StartDate' : '07/23/2018 01:55:45 PM',
  'StopDate' : '07/23/2018 09:55:45 PM',
  'Interval' : 'Minute',
)}


res <- POST("https://api.postcodes.io/postcodes"
            , body = pc_json
            , encode = "json")
appData <- content(res)

library(jsonlite)

# A JSON array of primitives
json <- '["Mario", "Peach", null, "Bowser"]'
json

# Simplifies into an atomic vector
fromJSON(json)

# No simplification:
fromJSON(json, simplifyVector = FALSE)

# to Df
# No simplification:
json <-
  '[
{"Name" : "Mario", "Age" : 32, "Occupation" : "Plumber"}, 
{"Name" : "Peach", "Age" : 21, "Occupation" : "Princess"},
{},
{"Name" : "Bowser", "Occupation" : "Koopa"}
]'
mydf <- fromJSON(json, simplifyDataFrame = TRUE)
mydf
str(mydf)

#----

json <-
  '[
{"Name" : "Mario", "Age" : 32, "Occupation" : "Plumber"}, 
{"Name" : "Peach", "Age" : 21, "Occupation" : "Princess"},
{},
{"Name" : "Bowser", "Occupation" : "Koopa"}
]'

{
  "TemperatureRegionID" : 419,
  "StartDate" : "07/23/2018 01:55:45 PM",
  "StopDate" : "07/23/2018 09:55:45 PM",
  "Interval" : "Minute",
}
