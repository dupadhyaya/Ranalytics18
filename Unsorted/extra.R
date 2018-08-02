

#1
sales = c(10000, 13000, 12000, 15000)
names(sales) = paste('Q',1:4,sep='')
sales
barplot(sales)
barplot(sales, horiz=T)
pie(sales)
sales[sales > 11000]
sales[ names(sales) == 'Q3']

# 1
# Attendance
attnd05Sep17 = sample(c('A','P'), size=30, replace=T, prob = c(0.3,0.7)) 
table(attnd05Sep17)

# Cricket Players
set.seed(1000)
(p1 = ceiling(runif(10,50,100)))
set.seed(1100)
(p2 = ceiling(runif(10,50,100)))
set.seed(1200)
(p3 = ceiling(runif(10,50,100)))
set.seed(1300)
(p4 = ceiling(runif(10,50,100)))
set.seed(1400)
(p5 = ceiling(runif(10,50,100)))
scores = matrix(c(p1,p2,p3,p4,p5), byrow=F,ncol=5,
                dimnames=list(paste('M',1:10,sep=''),paste('P',1:5,sep='')))
scores
colMeans(scores)
rowMeans(scores)


#2 


# 
guests =c('Achal','Apoorva', 'Lalit', 'Goldie')
hosts = data.frame(course=c('BSc','LLB','MSc'), 
                   school=c('Animation', 'Law','DS'),
                   nos =c(50, 20, 24))
hosts$male = round(hosts$nos * .8)
hosts$female = hosts$nos - hosts$male
hosts
bills = matrix(c(100,300, 400, 500, 230,
                 500,200,150, 400, 700),
               nrow=2, byrow=T,
               dimnames=list(c('decoration','food'),
                             paste('B',1:5,sep='')))
bills               
freshers=list(guests=guests, hosts=hosts, bills=bills)
freshers
sum(freshers$bills[1,])
sum(freshers$bills[2,])
freshers$hosts$male
freshers$hosts$female
length(freshers$guests)
