# Exercise 1
library(lpSolveAPI)
lp.model = make.lp(0,2)
set.objfn(lp.model, c(6,5))
add.constraint(lp.model, c(1,1), "<=", 5)
add.constraint(lp.model, c(3,2), "<=", 12)

lp.control(lp.model, sense='max')
print(lp.model)
solve(lp.model)
get.objective(lp.model)
get.variables(lp.model)

#plot visual presentation
plot(0,0, xlim = c(0,7), ylim = c(0,7), xlab = "Unit B", ylab = "Unit A", main = "Number of units produced for A and B")
polygon(c(0,5,0), c(5,0,0), col = "skyblue", density = 30)
polygon(c(0,6,0), c(4,0,0), col = "red", density = 20)
abline(h=2, v=3)


# Exercise 2
library(lpSolveAPI)
lp.model = make.lp(0,2)
set.objfn(lp.model, c(50,120))
add.constraint(lp.model, c(100,200), "<=", 10000)
add.constraint(lp.model, c(10,30), "<=", 1200)
add.constraint(lp.model, c(1,1), "<=", 110)

lp.control(lp.model, sense='max')
print(lp.model)
solve(lp.model)
get.objective(lp.model)
get.variables(lp.model)

#plot visual presentation
plot(0,0, xlim = c(0,120), ylim = c(0,120), xlab = "Wheat", ylab = "Barley", main = "Wheat vs Barley")
polygon(c(0,110,0), c(110,0,0), col = "green", density = 30)
polygon(c(0,100,0), c(50,0,0), col = "skyblue", density = 30)
polygon(c(0,120,0), c(40,0,0), col = "red", density = 20)
abline(h=20, v=60)


# Exercise 3
library(lpSolveAPI)
lp.model = make.lp(0,2)
set.objfn(lp.model, c(10,15))
add.constraint(lp.model, c(1,1), "<=", 16)
add.constraint(lp.model, c(3,6), "<=", 60)

lp.control(lp.model, sense='max')
print(lp.model)
solve(lp.model)
get.objective(lp.model)
get.variables(lp.model)

#plot
plot(0,0, xlim = c(0,20), ylim = c(0,20), xlab = "Type B", ylab = "Type A", main = "Type A vs Type B")
polygon(c(0,16,0), c(16,0,0), col = "green", density = 30)
polygon(c(0,10,0), c(20,0,0), col = "red", density = 20)
abline(h=12, v=4)


# Exercise 4
library(lpSolveAPI)
lp.model = make.lp(0,2)
set.objfn(lp.model, c(3000,5000))
add.constraint(lp.model, c(1,0), "<=", 4)
add.constraint(lp.model, c(0,2), "<=", 12)
add.constraint(lp.model, c(3,2), "<=", 18)

lp.control(lp.model, sense='max')
print(lp.model)
solve(lp.model)
get.objective(lp.model)
get.variables(lp.model)


# Exercise 5
library(lpSolveAPI)
lp.model = make.lp(0,4)
set.objfn(lp.model, c(0.5,0.2,0.3,0.8))
add.constraint(lp.model, c(400,200,150,500), ">=", 500)
add.constraint(lp.model, c(3,2,0,0), ">=", 6)
add.constraint(lp.model, c(3,2,4,4), ">=", 10)
add.constraint(lp.model.c(2,4,1,5), ">=", 8)

lp.control(lp.model, sense='min')
print(lp.model)
solve(lp.model)
get.objective(lp.model)
get.variables(lp.model)