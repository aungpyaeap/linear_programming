# Transportation model

# Exercise 1
library(lpSolveAPI)
lp.model <- make.lp(0,9)
set.objfn(lp.model, c(6,8,10,7,11,11,4,5,12))
add.constraint(lp.model, rep(1,3), indices = c(1,2,3), "<=", 150)
add.constraint(lp.model, rep(1,3), indices = c(4,5,6), "<=", 175)
add.constraint(lp.model, rep(1,3), indices = c(7,8,9), "<=", 275)
add.constraint(lp.model, rep(1,3), indices = c(1,4,7), "=", 200)
add.constraint(lp.model, rep(1,3), indices = c(2,5,8), "=", 100)
add.constraint(lp.model, rep(1,3), indices = c(3,6,9), "=", 300)

lp.control(lp.model, sense='min')
print(lp.model)
solve(lp.model)
get.objective(lp.model)
get.variables(lp.model)

matrix(get.variables(lp.model),nrow = 3,byrow = TRUE, dimnames = list(c("Kansas City","Omaha","Des Monies"),c("Chicago","St. Louis","Cincinnati")))


# Exercise 2
library(lpSolveAPI)
lp.model <- make.lp(0,6)
set.objfn(lp.model, c(10,20,15,12,15,18))
add.constraint(lp.model, rep(1,3), indices = c(1,2,3), "<=", 500)
add.constraint(lp.model, rep(1,3), indices = c(4,5,6), "<=", 400)
add.constraint(lp.model, rep(1,2), indices = c(1,4), "=", 400)
add.constraint(lp.model, rep(1,2), indices = c(2,5), "=", 200)
add.constraint(lp.model, rep(1,2), indices = c(3,6), "=", 300)

lp.control(lp.model, sense='min')
print(lp.model)
solve(lp.model)
get.objective(lp.model)
get.variables(lp.model)

matrix(get.variables(lp.model),nrow = 2,byrow = TRUE, dimnames = list(c("Southern Gas ","Northwest Gas "),c("Hamilton","Butler","Clermont")))


# Network models

# Exercise 1
library(lpSolveAPI)
lp.model <- make.lp(0,10)
set.objfn(lp.model, c(7,5,3,4,8,5,7,5,6,10))
#supply
add.constraint(lp.model, rep(1,2), indices = c(1,2), "<=", 300)
add.constraint(lp.model, rep(1,2), indices = c(3,4), "<=", 100)
#intermediate nodes
add.constraint(lp.model, c(1,1,-1,-1,-1), indices = c(1,3,5,6,7), "=", 0)
add.constraint(lp.model, c(1,1,-1,-1,-1), indices = c(2,4,8,9,10), "=", 0)
#demand
add.constraint(lp.model, rep(1,2), indices = c(5,8), "=", 150)
add.constraint(lp.model, rep(1,2), indices = c(6,9), "=", 100)
add.constraint(lp.model, rep(1,2), indices = c(7,10), "=", 150)

lp.control(lp.model, sense='min')
print(lp.model)
solve(lp.model)
get.objective(lp.model)
get.variables(lp.model)


# Exercise 2
library(lpSolveAPI)
lp.model <- make.lp(0,17)
set.objfn(lp.model, c(4,7,8,5,5,6,7,2,6,4,8,4,2,3,6,7,7))
#supply
add.constraint(lp.model, rep(1,2), indices = c(1,2), "<=", 450)
add.constraint(lp.model, rep(1,2), indices = c(3,4), "<=", 600)
add.constraint(lp.model, rep(1,3), indices = c(5,6,7), "<=", 380)
#intermediate nodes
add.constraint(lp.model, c(1,1,1,-1,-1,-1,-1,-1), indices = c(1,3,5,6,7), "=", 0)
add.constraint(lp.model, c(1,1,1,-1,-1,-1,-1,-1), indices = c(2,4,8,9,10), "=", 0)
#demand
add.constraint(lp.model, rep(1,2), indices = c(9,14), "=", 300)
add.constraint(lp.model, rep(1,2), indices = c(10,15), "=", 300)
add.constraint(lp.model, rep(1,2), indices = c(11,16), "=", 300)
add.constraint(lp.model, rep(1,3), indices = c(12,17,7), "=", 400)

lp.control(lp.model, sense='min')
print(lp.model)
solve(lp.model)
get.objective(lp.model)
get.variables(lp.model)
