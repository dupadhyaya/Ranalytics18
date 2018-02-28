# Student Data Prepare
# Split into train and test of Student 
student = read.csv('data/student1.csv')
str(student)
student$dob = as.Date(student$dob, format = "%d-%b-%y")
str(student)
student$age = round(as.numeric((Sys.Date() - student$dob)/365 ))
head(student)

## 75% of the sample size as train Data
smp_size <- floor(0.80 * nrow(student))
smp_size
## set the seed to make your partition reproductible
set.seed(123)
train_ind <- sample(seq_len(nrow(student)), size = smp_size)
train_ind
train1 <- student[train_ind, ]
head(train1)
str(train1)
test1 <- student[-train_ind, ] # rest of the data use as test
head(test1)
str(test1)
nrow(train1);nrow(test1)
# want to train the data on basis of age, class10, sem1 marks

x_train = train1[,c('age','class10','sem1')]
head(x_train)
y_train = train1$btechmarks
head(y_train)
x_test = train1[,c('age','class10','sem1')]
head(x_test)
