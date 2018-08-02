# String Manipulations

?paste
paste (..., sep = " ", collapse = NULL)
paste0(..., collapse = NULL)

#paste
(PI = paste('The Life of ', pi))
# default sep space ' '

(IloveR = paste('I', 'love', 'R', sep='-'))

# different lengths
paste('X', 1:5, sep='.')

# paste with collapse  after each paste what to do ?
paste(1:3, c('!', '?', "+"), sep='', collapse='')
paste(1:3, c('!', '?', "+"), sep='')

paste(1:3, c('!', '?', "+"), sep='%%', collapse='***')
paste(1:3, c('!', '?', "+"), sep='%%')

# after end of each character

paste(1:3,c('a','b','c'), c('A','B','C'))
# explore with sep & collapse

# handle NA  - use as character
(evalue = paste(" The value of 'e' is ", exp(1), NA))

# paste0
#eq of paste(..., sep="", collapse)
paste0('lets', 'collapse', 'all', 'these', 'words')
paste('lets', 'collapse', 'all', 'these', 'words')
paste('lets', 'collapse', 'all', 'these', 'words', collapse='') # check this

paste('lets', 'collapse', 'all', 'these', 'words', sep='-', collapse='*') # check this

