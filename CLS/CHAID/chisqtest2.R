#CHisquare test 
(result = matrix(c(200,150,50,250,300,50), byrow=T, ncol=3))
dimnames(result) = list(gender=c('male','female'),party=c('bjp','cong','aap') )
(ct= chisq.test(result))
summary(ct)
ct$statistic; ct$p.value
ct$observed; ct$expected
addmargins(result,c(1,2),sum)
addmargins(prop.table(result,1),c(2),sum)
addmargins(prop.table(result,2),c(1),sum)

prop.table(result,2)
prop.table(result,1)
