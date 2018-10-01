#lpassign - Case
#https://stackoverflow.com/questions/21149134/assignment-algorthms-in-r-lp-assign

#matrix m below where each row is a student and each column is a job and 1 means the student's top choice, 2 means the second choice and so on. 9 means the student did not rank the job. There were 3 students and 4 tasks so we added a dummy student, U, of all 9s for the last row so that the number of students and tasks are the same. We assume the objective is to minimize the sum of the ranks. Below we see that the best assignment is to assign student 1 to job C, student 2 to job D, student 3 to job A and the unassigned row slurps up job B

library(lpSolve)

m <- matrix(c(3, 2, 1, 9, 2, 3, 2, 9, 1, 9, 3, 9, 9, 1, 9, 9), 4,  dimnames = list(c(1, 2, 3, "U"), c("A", "B", "C", "D")))
m
fm <- lp.assign(m)

#fm$solution contains the solution, a matrix of the same dimensions as m with 0 and 1 entries.
fm$solution

student <- rownames(m)
ix <- round(fm$solution %*% seq_len(ncol(m)))
job <- colnames(m)[ifelse(ix == 0, NA, ix)]
data.frame(student, job)
