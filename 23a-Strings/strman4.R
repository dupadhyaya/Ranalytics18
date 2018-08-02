# Set Operations


union()# set union
intersect() #intersection
setdiff() #set difference
setequal() #equal sets
identical() #exact equality
is.element() #is element
#%in%() #contains
sort() #sorting
paste(rep()) #repetition

# Union  total, no repeats
set1 = c('A', 'B', 'C', 'D')
set2 = c('A', 'C', 'F' , 'G')

union(set1,set2)  # no repeats

#intersect  common
intersect(set1, set2)
intersect(set2, set1)

# setdiff wrt to each other
setdiff(set1, set2)  # set1 not in set2
setdiff(set2, set1)   # set2 not in set1

#setequal

setequal(set1, set2)
set3 = set1
setequal(set1, set3)

#identical
set1
set4 = c('B','C', 'D', 'A') # same as set1 but in different order
identical(set1, set2)
identical(set1, set3)
identical(set1, set4) # not same element by element
setequal(set1, set4) # but same elements present

#is.element
# three vectors
set10 = c("some", "stuff", "to", "play", "with")
elem1 = "play"
elem2 = "crazy"

is.element(elem1, set10)
is.element('A', set1)
is.element('P', set1)


# %in% operator
elem1 %in% set10
'A' %in% set1
'P' %in% set1

# sort
sort(set10)
set4
sort(set4)
sort(set4, decreasing=T)

set12 = c("today", "produced", "example", "beautiful", "1", "nicely")
sort(set12) # alpha - numbers first
sort(set12, decreasing=T)

# rep()

paste(rep('x', 4), collapse='')
paste(rep('x', 4))

