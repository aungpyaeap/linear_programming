# Integer Linear Programming
# Produces only 1 or 0 value
# Max problems

#Problem 1
library(lpSolveAPI)
rm(lps.model)
lps.model=make.lp(0,4)
set.type(lps.model,1:4,"binary") #make lps model
set.objfn(lps.model,c(90000,40000,10000,37000))

add.constraint(lps.model,c(15000,10000,10000,15000),"<=",40000)
add.constraint(lps.model,c(20000,15000,10000,15000),"<=",50000)
add.constraint(lps.model,c(20000,20000,0,10000),"<=",40000)
add.constraint(lps.model,c(15000,5000,4000,10000),"<=",35000)

lp.control(lps.model,sense='max')
print(lps.model)
solve(lps.model)

get.variables(lps.model)
get.objective(lps.model)


#Problem 2
library(lpSolveAPI)
rm(lps.model)
lps.model=make.lp(0,10)
set.type(lps.model, 1:10,"binary")
set.objfn(lps.model,c(127,83,165,96,112,88,135,141,117,94))

add.constraint(lps.model,rep(1,2), indices = c(1,3),"=",1)
add.constraint(lps.model,rep(1,3), indices = c(1,2,4),"=",1)
add.constraint(lps.model,rep(1,3), indices = c(4,5,6),"=",1)
add.constraint(lps.model,rep(1,3), indices = c(6,7,8),"=",1)
add.constraint(lps.model,rep(1,2), indices = c(6,9),"=",1)
add.constraint(lps.model,rep(1,2), indices = c(8,10),"=",1)
add.constraint(lps.model,rep(1,2), indices = c(9,10),"=",1)

lp.control(lps.model,sense='max')
print(lps.model)
solve(lps.model)

get.variables(lps.model)
get.objective(lps.model)
