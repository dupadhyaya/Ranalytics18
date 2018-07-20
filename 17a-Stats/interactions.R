# Margin Tables 

# Election Results
parties1 = c('bjp', 'congress', 'sp', 'aap')
states1 = c('up', 'delhi','haryana', 'punjab','uk')

# Factor interactions
(comb = interaction(parties, states))
comb
mps = ceiling(runif(16,30,50))
cbind(comb, mps)

?gl
parties2= gl(n=4, k=1, length=4, labels=parties1 )
states2= gl(n=5, k=1, length=4, labels=states1 )
# Longer object to multiple of shorter object length : keep length=4
# order not reqed, only once k=1, 
(gl(n=4, k=2, length=8, labels=parties ))  # random order, twice rep

comb2= interaction(parties2, states2, sep='-')
df1 = data.frame(comb2, mps)
str(df1)
df1  # some combination may be missing

# not very good
parties3= gl(n=4, k=5, length=20, labels=parties1 )
states3= gl(n=5, k=4, length=20, labels=states1 )
cbind(parties3, states3)
(df2 = data.frame(parties3, states3))
table(df2)
