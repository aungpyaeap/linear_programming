# goal programming
library(lpSolve)
library(goalprog)

coefficient <- matrix(c(12,9,15,
                        5, 3, 4,
                        5, 7, 8), nrow = 3, byrow = TRUE)

target <- c(125,40,55)
goals <- data.frame(matrix(c(1,1,0,1,
                             2,2,0,1,
                             3,3,1,0,
                             2,4,1,0), nrow = 4, byrow = TRUE))

names(goals) <- c("objective","priority","p","n")
solution <- llgp(coefficient, target, goals)
llgpout(solution$tab, coefficient, target)

