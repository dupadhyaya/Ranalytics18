#Vtree
#https://cran.r-project.org/web/packages/vtree/vtree.pdf

library(vtree)

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