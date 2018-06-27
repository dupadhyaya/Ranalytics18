#R and Google Sheets
#https://cran.r-project.org/web/packages/googlesheets/vignettes/basic-usage.html

library(googlesheets)
library(tidyverse)

#(my_sheets <- gs_ls())
#gs_title(), gs_key(), gs_url(), and gs_gs() return a registered sheet as a googlesheet object, which is the first argument to practically every function in this package. Likewise, almost every function returns a freshly registered googlesheet object, ready to be stored or piped into the next command.

#this will take you to R and require ur approval
(my_sheets <- gs_ls())
my_sheets %>% glimpse()
?gs_ls
gs_ls("googleRdata") #see if the sheet exists
mygs = gs_title("googleRdata") #Register the sheet
mygs  # details of registered sheet
mygs %>% gs_browse()  #go browser and see the online file
mygs %>% gs_browse(ws=2)
mygs %>% gs_browse(ws='test')

# read from online sheet
testdata <- mygs %>%  gs_read(ws = "test")
str(testdata)
head(testdata)

#read only certain cells
mygs %>% gs_read(ws = 2, range = "A1:D8")
mygs %>% gs_read(ws = "test", range = cell_rows(1:4))
mygs %>% gs_read(ws = "test", range = cell_rows(10:15), col_names = FALSE)
mygs %>% gs_read(ws = "test", range = cell_cols(1:4))
mygs %>% gs_read(ws = "test", range = cell_limits(c(1, 4), c(5, NA)))


#Add a new worksheet to an existing Google Sheet
mygs <- mygs %>%  gs_ws_new(ws_title = "mtcars", input = head(mtcars),  trim = TRUE, verbose = FALSE)
mymtcars <- mygs %>% gs_read(ws = 'mtcars')
mymtcars


#Rename or delete worksheets
#gs_ws_delete() and gs_ws_rename() to delete the mtcars worksheet and rename the iris worksheets, respectively:

#re-register sheet / refresh
mygs <- mygs %>% gs_gs()
#be careful 
mygs <- mygs %>%  gs_ws_delete(ws = 'test2') 

#data from R object to google sheets
iris_ss <- mygs %>%   gs_ws_new(ws_title = "iris", input = iris,trim = TRUE, verbose = FALSE)
iris_ss %>% gs_read(ws = 'iris')

#my data
train_ss <- mygs %>%   gs_ws_new(ws_title = "train1", input = data,trim = TRUE, verbose = FALSE)


#Make new Sheets from local delimited files or Excel workbooks
iris %>%  head(5) %>%  write.csv("iris.csv", row.names = FALSE)
iris_ss <- gs_upload("iris.csv")


#New sheet
foo <- gs_new("foo") %>% 
  gs_ws_rename(from = "Sheet1", to = "edit_cells") %>% 
  gs_ws_new("add_row")
#two sheets created one renamed
foo
