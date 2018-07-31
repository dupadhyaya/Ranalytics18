# Value Generation with seq

#seq
seq(from = 1, to = 1, by = ((to - from)/(length.out - 1)),
    length.out = NULL, along.with = NULL)
#by - number: increment of the sequence.
#length.out - desired length of the sequence. A non-negative number, which for seq and seq.int will be rounded up if fractional.
# along.with - take the length from the length of this argument.
(v1 = c(8,9,10))
seq(1, 50, by=3)
seq(1, by=3, along.with=v1)
seq(from=0, to=50, length.out=5) #divide range 0 to 50 into 5 equal parts



#seq_along : no in seq as per another vector
(a <- c(8, 9, 10))
(b <- c(9, 10))
(c <- 10)

#seq_along----
seq_along(a)
# [1] 1 2 3
seq_along(b)
# [1] 1 2
seq_along(c)
# [1] 1

x= c(8,9,10)
#seq_along(x) takes a vector for x, and it creates a sequence upto the count of elements in the vector.
#seq_along(x) is the same as seq_len(length(x))
seq_along(x)
seq_len(length(x))

#seq_len----
#seq_len(y) takes numeric for y, it creates a sequence upto the number y

#seq_len(x) is the same as seq_len(x[1])
seq_len(x)
seq_len(x[1])  #no in seq upto first position of vector
#When using seq_len, it will give you:
#A warning, if x has more than 1 element.
#An error, if x[1] is not numeric.
#An error, if x is a frame.




#sample

#months

#alphabets
