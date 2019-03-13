# goal programming test
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


# Exercise 1
library(lpSolve)
library(goalprog)
coefficient <- matrix(c(7,6,
                        2,3,
                        6,5,
                        0,1), nrow = 4, byrow = TRUE)
target <- c(30,12,30,7)
goals <- data.frame(matrix(c(1,1,0,1,
                             2,2,1,1,
                             3,3,1,0,
                             2,4,0,1), nrow = 4, byrow = TRUE))
names(goals) <- c("objective","priority","positive","negative")
solution <- llgp(coefficient, target, goals)
llgpout(solution$tab, coefficient, target)


#Exercise 1 anothe way
library(lpSolve)
library(goalprog)

coef <- matrix(c(7,6,2,3,6,5,0,1), nrow = 4, byrow = TRUE)
target <- c(30,12,30,7)
goals <- data.frame("objective"=c(1,2,3,4),"priority"=c(1,2,3,4),"positive"=c(0,1,1,0),"negative"=c(1,1,0,1))
#names(goals) <- c("objective","priority","Potisive","Negative")
solution <- llgp(coef, target, goals)
llgpout(solution$tab, coef, target)

