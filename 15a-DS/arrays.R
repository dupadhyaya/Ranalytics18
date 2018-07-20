# Arrays
# 2 states ; Each State has 3 districts : Each District has 4 cities
state = c('state1', 'state2')
district = c('district1','district2', 'district3')
city = c('city1', 'city2', 'city3', 'city4')
pincode = 101:124
citylist = array(pincode, c(4,3,2) , dimnames = list(city, district ,state))
citylist
colnames(citylist)
rownames(citylist)
dimnames(citylist)
length(citylist)
nrow(citylist)
ncol(citylist)
dim(citylist)
class(citylist)

citylist[3,2,1]
citylist[1,1,1] # city1, district1, state1, 
citylist[1,,] # city1 of all states & district
citylist[,,1] # State1

apply(citylist, c(1), sum)  # citywise
apply(citylist, c(2), sum)  # districtwise
apply(citylist, c(3), sum) # statewise
apply(citylist, c(2,3), sum) # all cities - district & statewise
apply(citylist, c(1,2,3), length) # statewise

