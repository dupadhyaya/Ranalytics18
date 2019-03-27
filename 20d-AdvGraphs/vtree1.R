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


#mtcars
vtree(mtcars,"am")
vtree(mtcars,"am gear")
vtree(mtcars,"am gear cyl")

vtree(mtcars,"am", horiz = F)
#vtree(mtcars,"am", summary)

vtree(mtcars,"am gear",horiz=FALSE,plain=TRUE)
vtree(mtcars,"am gear",showlegend=TRUE,shownodelabels=FALSE)

vtree(mtcars,"am gear",sameline=TRUE)
vtree(mtcars,"am gear",sameline=TRUE,showvarnames=FALSE)
vtree(mtcars,"am gear", splitwidth=15, lsplitwidth=8)

vtree(FakeData,"Severity Sex",prune=list(Severity=c("Mild","Moderate")))

vtree(FakeData,"Severity Sex",prunebelow=list(Severity=c("Mild","Moderate")))

vtree(FakeData,"Severity Sex",horiz=T,labelvar=c(Severity="Severity on day 1"),labelnode=list(Sex=c(Male="M",Female="F")))

vtree(FakeData,"Severity",horiz=T,  text=list(Severity=c(Mild="*Includes first-time visits*")))


#Displaying summary statistics in nodes
vtree(FakeData,"Severity",summary="Score %mean%",horiz=T)
vtree(mtcars,"cyl",summary="mpg %mean%",horiz=T)
vtree(mtcars,"cyl am",summary="mpg %mean%",horiz=T)

vtree(FakeData,"Severity",horiz=FALSE,showvarnames=FALSE, summary=c( "Score \nScore: mean (SD)\n %mean% (%SD%)", "Pre \n\nPre: range\n %min%, %max%"))

vtree(mtcars,"cyl",horiz=F,showvarnames=FALSE, summary=c( "mpg \n mpg: mean (SD)\n %mean% (%SD%)", "wt \n\n wt: range\n %min%, %max%"))

vtree(FakeData,"Severity",summary="Viral \nViral %npct%",horiz=T,showvarnames=FALSE)
str(FakeData)
vtree(mtcars,"gear",summary="am \nam %npct%",horiz=FALSE,showvarnames=FALSE)
table(mtcars$am)
table(mtcars$am, mtcars$gear)
#T=1, F=0:TRUE / FALSE

#Venn Diagram
vtree(FakeData,"Ind1 Ind2 Ind3 Ind4",Venn=TRUE)

sequence <- with(FakeData,paste(Ind1,Ind2,Ind3,Ind4))
sequence
vtree(FakeData,"Ind1 Ind2 Ind3 Ind4",Venn=TRUE,seq=TRUE,
     palette=c(Ind1=1,Ind2=2,Ind3=3,Ind4=4))
