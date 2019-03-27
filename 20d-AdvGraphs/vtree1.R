#Vtree
#https://cran.r-project.org/web/packages/vtree/vtree.pdf

library(vtree)
#other packages needed
pack = c('vtree','glue','tibble','purrr','XML','colorspace','stringi', 'lazyeval','Rcpp','V8','DiagrammeRsvg','rsvg')

#Function
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}
ipak(pack)
#packages loaded

FakeData

# A single-level hierarchy
vtree(FakeData,"Severity")
str(FakeData)
# A two-level hierarchy
vtree(FakeData,"Severity Sex")
# A two-level hierarchy with pruning of some values of Severity
vtree(FakeData,"Severity Sex",prune=list("Severity"=c("Moderate","NA")))

# Rename some nodes
vtree(FakeData,"Severity Sex",labelnode=list(Sex=(c("Male"="M","Female"="F"))))
# Rename a variable
vtree(FakeData,"Severity Sex",labelvar=c(Severity="How bad?"))
# Show legend. Put labels on the same line as counts and percentages
vtree(FakeData,"Severity Sex Viral",sameline=TRUE,showlegend=TRUE)
# Using the summary parameter to list ID numbers (truncated to 40 characters) in specific
vtree(FakeData,"Severity Sex",summary="id \nid = %list% %var=Severity% %trunc=40%")


grVizToPNG(g, width = NULL, height = NULL, folder = ".")