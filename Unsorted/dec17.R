paste("a", "b", se = ":")
x= 1:5
y= NULL
is.null(x)
f <- function(a, b) a^2
f(2)
paste("a", "b", sep = ":")
paste("a", "b", se = ":")
Sys.Date()
class(as.Date('1970-01-02'))

x = 1:5
apply(x, FUN=sqrt)
?apply
data(package = .packages(all.available = TRUE))
paste('Data', 'Science', 'from', 'MUIT', sep='-')

month.abb[1:12]
(sd = paste('01',month.abb[1:6],2016,sep='-'))
sd1 = as.Date(sd,'%d-%b-%Y')
saledate = rep(sd1,times=4)
saledate
dept = rep(c('Dept1','Dept2'), each=12)
(dept = factor(dept, ordered=T, levels=c('Dept2', 'Dept1')))
(city = rep(c('Delhi','Noida'), times=2, each=6))
set.seed(1234)
saleamt = ceiling(runif(24, 100, 200))
set.seed(1234)
advamt = ceiling(runif(24, 25,40))
df = data.frame(saledate, dept=as.factor(dept), city=as.factor(city), saleamt, advamt)
df
with(df, boxplot(saleamt ~ dept))
with(df, boxplot(saleamt ~ dept + city))

agdeptcity = aggregate(df$saleamt, by=list(dept, city), mean)
pie(agdeptcity$x, labels=paste(agdeptcity$Group.1, agdeptcity$Group.2, sep='-'))


(t1 = xtabs(saleamt ~ dept + city, data=df))
margin.table(t1,c(2))
addmargins(t1,c(1,2), FUN=list(list(sd,mean), sum))
prop.table(t1)*100

(df2= subset(df, city='noida', select=c(dept, saleamt,advamt)))

plot(y=df2$saleamt, x=df2$advamt)
abline(lm(df2$saleamt ~ df2$advamt))
cor(df2$saleamt, df2$advamt)
df2
df2[order(saleamt, -advamt),]
with(df2,plot(x=dept, y=saleamt))
within(df2, profit <- saleamt - advamt)
df2
(mat2 = as.matrix(df2[2:3]))
sweep(df2[2:3],2,1,'+')

reshape2::melt(df2, id='dept')



matrix1 = as.matrix(airquality)

matrix1
colSums(is.na(matrix1))
mean(matrix1[,1],na.rm=T)

colSums(is.na(matrix1))

sapply(matrix1, function(x)all(is.na(x)))

which(is.na(matrix1))
matrix1[which(is.na(matrix1[,1])),1]
length(matrix1[which(is.na(matrix1[,1])),1])
matrix1[which(is.na(matrix1[,2])),2]
length(matrix1[which(is.na(matrix1[,2])),2])

length(matrix1[which(is.na(matrix1[,1]))])
length(matrix1[which(is.na(matrix1[,2]))])
matrix1[which(is.na(matrix1[,2]))]
which(is.na(matrix1[,2]))
which(is.na(matrix1[,2]))


ceiling(mean(matrix1[,1],na.rm=T))
ceiling(mean(matrix1[,2],na.rm=T))
matrix1[which(is.na(matrix1[,1])),1] = ceiling(mean(matrix1[,1],na.rm=T))
matrix1[which(is.na(matrix1[,2])),2] = ceiling(mean(matrix1[,2],na.rm=T))
colSums(is.na(matrix1))

matrix1[which(is.na(matrix1[,2])),2]
matrix1[c(5,6,11,27,96,98)]
which(is.na(matrix1[,2]))

apply(matrix1, 2, mean)
sapply(matrix1[1:10], log)
matrix1
apply(matrix1[1:10], 2, log)
?lapply



# List
(myList = list(nostudents = 1:10, school = 'Data Science', 
              course=c('PG','MSc')))
length(myList$course)

#myArray
set.seed(1234)
(x=ceiling(rnorm(2*3*5*4,50,10)))

depts=c('D1','D2')
courses=c('C1','C2','C3')
students=c('S1','S2','S3','S4','S5')
subjects=c('Sb1', 'Sb2', 'Sb3', 'Sb4')
myArray = array(x, dim = c(5,4,3,2), dimnames = list(students, subjects, courses,depts))


myArray

sum(myArray)
lapply(myArray,c(4), mean)
?apply
apply(myArray, c(2), function(x) max(x))
apply(myArray, c(4), function(x) mean(x))
apply(myArray, c(1,3,4), function(x) sum(x))
apply(myArray, c(2), function(x) sd(x))


(myList = list(rollno = 100:120, school = 'Data Science', 
               course=c('PG','MSc')))

length(myList$rollno)

x = 11:20
for (i in c(5,2,7)) {
  print(x[i]^2)
}

func1 = function(x) sqrt(x)
func1(x)
