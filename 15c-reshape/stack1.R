# Stack
# 
classA = c(10,14,15)
classB = c(20,25,27)
classC = c(13,15,17)
classmarks = data.frame(classA, classB, classC)
(s1 = stack(classmarks))

(s2= stack(classmarks, select=c("classA", "classC")))
unstack(s2)
