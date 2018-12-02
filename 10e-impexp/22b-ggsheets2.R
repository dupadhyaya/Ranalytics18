#https://googlesheets4.tidyverse.org/


#install.packages("devtools")
library(devtools)
devtools::install_github("tidyverse/googlesheets4")
library(googledrive)
library(googlesheets4)
#give authorisations
(qsthe <- drive_get("AccreditionQSTHE"))
qsthe
sheets_get(qsthe)
sheet1 = sheets_get("1M-sAZqHHyuzzwW7vUwXoCw2JVwUiWki7LdFCgAyOccc")
sheet1$spreadsheet_id
sheet1$sheets
sheet2 = read_sheet("1M-sAZqHHyuzzwW7vUwXoCw2JVwUiWki7LdFCgAyOccc", sheet = 2)
sheet2
str(sheet2)
(df <- sheets_cells("1M-sAZqHHyuzzwW7vUwXoCw2JVwUiWki7LdFCgAyOccc", range = "A1:E7"))
