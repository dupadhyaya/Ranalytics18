# eapply
# like lapply except that rather than applying a function to 
# every element in a list, it applies a function to every 
# element in an environment. For example if you want to find
# a list of user defined functions in the global environment:


A<-c(1,3,5,7,9)
B<-c(0,3,6,9,12)
C<-list(x=1, y=2)
D<-function(x){x+1}
ls()
lsf.str()

eapply(.GlobalEnv, is.function)
#$D - TRUE being function , $A- FALSE
#if you are building a lot of packages or 
#create a lot of environments it may come in handy.
unlist(eapply(.GlobalEnv, is.vector))
