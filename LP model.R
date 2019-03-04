library("lpSolve")
cost = matrix(c(6,8,10,7,11,11,4,5,12),nrow = 3, byrow=TRUE)
#cost

row.signs = rep("<=",3)
row.this = c(150,175,275)
col.signs = rep("=",3)
col.this = c(200,100,300)

model = lp.transport(cost, "min", row.signs, row.this, col.signs, col.this)$solution
matrix(model,3,3,dimnames = list(c("KC","Omaha","DM"), c("Chicago","SL","Cincinnati")), byrow = TRUE)

#new problem
library(lpSolveAPI)
lps.model=make.lp(0,12)
set.objfn(lps.model,c(50,36,16,28,30,18,35,32,20,25,25,14))
add.constraint(lps.model,rep(1,3),indices = c(1,2,3),"<=",1)
add.constraint(lps.model,rep(1,3),indices = c(4,5,6),"<=",1)
add.constraint(lps.model,rep(1,3),indices = c(7,8,9),"<=",1)
add.constraint(lps.model,rep(1,3),indices = c(10,11,12),"<=",1)
add.constraint(lps.model,rep(1,4),indices = c(1,4,7,10),"=",1)
add.constraint(lps.model,rep(1,4),indices = c(2,5,8,11),"=",1)
add.constraint(lps.model,rep(1,4),indices = c(3,6,9,12),"=",1)

print(lps.model)
solve(lps.model)
get.objective(lps.model)
matrix(get.variables(lps.model),nrow = 4,byrow = TRUE, dimnames = list(c("S1","S2","S3","S4"),c("P1","P2","P3")))

#new problem

library(lpSolveAPI)
rm(lps.model)
lps.model=make.lp(0,10)#empty framework with 10 decision variables
set.objfn(lps.model,c(5,8,7,4,1,5,8,3,4,4))
#supply constraints
add.constraint(lps.model,c(1,1),indices = c(1,2),"<=",75)
add.constraint(lps.model,c(1,1),indices = c(3,4),"<=",75)
#intermediate variables
add.constraint(lps.model,c(rep(1,2),rep(-1,3)),indices = c(1,3,5:7),"=",0)
add.constraint(lps.model,c(rep(1,2),rep(-1,3)),indices = c(2,4,8:10),"=",0)
#demand variables
add.constraint(lps.model,c(1,1),indices = c(5,8),"=",50)
add.constraint(lps.model,c(1,1),indices = c(6,9),"=",60)
add.constraint(lps.model,c(1,1),indices = c(7,10),"=",40)

lp.control(lps.model,sense="min")
print(lps.model)
solve(lps.model)
get.variables(lps.model)
matrix(get.variables(lps.model)[1:4],nrow = 2,dimnames = list(c("Arnold","Supershelf"),c("Thomas","Washburn")))
matrix(get.variables(lps.model)[5:10],nrow = 2,dimnames = list(c("Thomas","Washburn"),c("Zrox","Hewes","Rockwright")))


#transportation problem
library(lpSolveAPI)
lps.model=make.lp(0,15)
set.objfn(lps.model,c())