library(DBI)
con <- dbConnect(odbc::odbc(), "ds")
data <- sqlQuery( con , paste ("select * from student"))
dbListTables(con)

# List tables beginning with f
dbListTables(con, table_name = "f%")

# List all fields in the 'flights' database
dbListFields(con, "Students")

Students <- dbReadTable(con, "Students")
Students

library(tibble)
as_tibble(Students)


dbWriteTable(con, "Studentnew", as.data.frame(Students))
