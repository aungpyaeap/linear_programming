# Question 1
library(lpSolveAPI)
rm(lps.model)
lps.model=make.lp(0,2)
set.type(lps.model, 1:2,"binary")
set.objfn(lps.model,c(10000,8000))

add.constraint(lps.model,c(0,1),">=",8)
add.constraint(lps.model,c(1,0),"<=",10)
add.constraint(lps.model,c(1,1),">=",25)
add.constraint(lps.model,c(3,2),"<=",168)

lp.control(lps.model,sense='min')
print(lps.model)
solve(lps.model)
get.variables(lps.model)
get.objective(lps.model)


# Question 2
library(lpSolveAPI)
rm(lps.model)
lps.model=make.lp(0,6)
set.type(lps.model, 1:6,"binary")
set.objfn(lps.model,c(1,1,1,1,1,1))

add.constraint(lps.model,c(1,1,1),">=",1)
add.constraint(lps.model,c(1,1),">=",1)
add.constraint(lps.model,c(1,1),">=",1)
add.constraint(lps.model,c(1,1),">=",1)
add.constraint(lps.model,c(1,1,1),">=",1)
add.constraint(lps.model,c(1,1,1,1,1),">=",1)
add.constraint(lps.model,c(1,1),">=",1)
add.constraint(lps.model,c(1,1),">=",1)

lp.control(lps.model,sense='min')
print(lps.model)
solve(lps.model)
get.variables(lps.model)
get.objective(lps.model)


# Question 3
library(lpSolveAPI)
lp.model <- make.lp(0,14)
set.objfn(lp.model, c(1000,3000,3000,3000,2000,3000,3000,2000,2000,3000,4000,2000,2000,4000))
#supply
add.constraint(lp.model, rep(1,4), indices = c(1,2,3,4), "<=", 10000)
add.constraint(lp.model, rep(1,4), indices = c(5,6,7,8), "<=", 10000)
#intermediate nodes
add.constraint(lp.model, c(1,1,-1,-1,-1), indices = c(2,5,1,9,10), "=", 0)
add.constraint(lp.model, c(1,1,-1,-1), indices = c(3,6,11,12), "=", 0)
add.constraint(lp.model, c(1,1,-1,-1), indices = c(4,7,13,14), "=", 0)
#demand
add.constraint(lp.model, rep(1,2), indices = c(1,9), "=", 3000)
add.constraint(lp.model, rep(1,2), indices = c(10,11), "=", 7000)
add.constraint(lp.model, rep(1,2), indices = c(11,12), "=", 4000)
add.constraint(lp.model, rep(1,3), indices = c(14,8), "=", 6000)

lp.control(lp.model, sense='min')
print(lp.model)
solve(lp.model)
get.objective(lp.model)
get.variables(lp.model)