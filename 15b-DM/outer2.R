#Outer
#
?outer
outer(1:4, 4:6)
1:4 %o% 4:6
outer(1:4, 4:6, FUN=paste)
x=1:4 ; y=4:6 ; z=c(10,11,12)
x;y;z
outer(x,y, FUN='*')
outer(x,y, FUN=paste)
outer(x,y, FUN='+')
outer(x,y, FUN='-')
#(Y= matrix(-y,ncol=3,nrow=4,dimnames=list(NULL,c('y1','y2','y3'))))
#(X=matrix(x,ncol=3,nrow=4,byrow=F,dimnames=list(NULL,c('x1','x2','x3'))))
x;y
#cbind(Y,X) 
outer(x,-y, FUN=paste)
outer(x,y, FUN='-')
outer(x,y, FUN='^')
outer(x,rep('^',3),y, FUN=paste0)

outer(x,y, FUN='/')  # what is this
z = 
