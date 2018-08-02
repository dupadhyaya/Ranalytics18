#set Operations

union()  # set union
intersect()  # Intersection
setdiff()  # set difference
setequal()  # eualt sets
identical()  # exact equality
is.element() # is element
#%in%()  # contains
sort()  # sorting
paste(rep()) # repetition


(first1 = c('Achal','Apoorva','Goldie','Hitesh','Kaustav','Meena','Rashmi','Shruti','Shubham','Vijay','Lalit'))
(second = c('Kumar','Karn','Sahni','Mann','Chatterjee','Srisha','Ranjan','Sinha','Pujan','Singh','Sahni'))
(first2 = c('Achal','Apoorva','Kaustav','Rashmi','Shruti','Vijay','Lalit','Varun','Dhiraj'))

# union -------

union(first1, second)  #nothing
union(first1, first2)

set1 =c('some', 'random', 'words', 'some')
set2 =c('some', 'many', 'none', 'few')
union(set1, set2)

set3 = c('A','B','C','E')
set4 = c('B','D','F','P')
union(set3, set4)  # remove duplicates

#intersect
intersect(first1, first2)  # common names
intersect(set3,set4)

#setdiff
setdiff(set3,set4)
first1 ; first2
setdiff(first1, first2) # check ? what is there in 1st & not in 2
setdiff(first2, first1) # check ? what is there in 2nd & not in 1

# set equal  : same elements
setequal(first1, first1)
setequal(first1, first2)

set4 = c('A','B','C','E')
set5 = c('B','A','E','C')
setequal(set4, set5)
set6 = c('B','A','E','F')
setequal(set4, set6)

# identical : element by element
identical(set4,set5)
set7 = c('A','B','C','E')
identical(set4, set7)

# check if element is contained in ..

is.element('A', set4)
is.element('Dhiraj', first2)
is.element('Varun',  first1)
is.element('Varun',  first2)

'Dhiraj' %in% first2   # %in% operator
'A' %in% set4

# sort
sort(first1)
sort(set5)
sort(first1, decreasing = T)
sort(first1, decreasing = F)


# Repetition

paste(rep('x',4), collapse='')  # xxxx
paste(rep('x',4))  # 'x' 'x' 'x' 'x'
