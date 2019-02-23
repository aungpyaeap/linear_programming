# A farmer in Iowa owns 450 acres of land. He is going to plant each acre with wheat or corn.
# Each acre planted with wheat yields $2000 profit, requires three workers, and requires two tons of fertilizer.
# Each acre planted with corn yields $3000 profit, requires two workers, and requires four tons of fertilizer.
# There are currently 1000 workers and 1200 tons of fertilizer available. 
# a. Use Solver to help the farmer maximize the profit from his land.
# b. Confirm graphically that the solution from part a maximizes the farmer’s profit from his land.
# c. Use SolverTable to see what happens to the decision variables and the total profit when the availability of fertilizer varies from 200 tons to 2200 tons in 100-ton increments.
# When does the farmer discontinue producing wheat? When does he discontinue producing corn? How does the profit change for each 10-ton increment?

#answer
library(lpSolve)
library(tidyverse)
library(magrittr)
library(formattable)

objective.in <- c(2000,3000) #wheat,corn
const.mat <- matrix(c(3,2,2,4),nrow = 2,byrow = TRUE)
const.dir <- rep('<=',2)
const.rhs <- c(1000,1200)
const.mat %>%
  cbind(const.dir) %>%
  cbind(const.rhs) %>%
  rbind(c(objective.in,'<---','max fun to left'),.) %>%
  noquote

solution <-
  lp(
    direction = 'max',
    objective.in = objective.in,
    const.mat = const.mat,
    const.dir = const.dir,
    const.rhs = const.rhs
  )

objective.in %*% solution$solution %>%
  currency()

#set x1 and x2 for the different equations to 0 and to solve to find their respective intercepts.
plot(0,0, xlim = c(0,600), ylim = c(0,600), xlab = "Wheat", ylab = "Corn", main = "Wheat vs Corn")

polygon(c(0,1000/3,0), c(500,0,0), col = "skyblue", density = 30)
polygon(c(0,1200/2,0), c(1200/4,0,0), col = "red", density = 20)

abline(h=200, v=200)

for(profit in 1:10*100000){
  curve(((profit)-2000*x)/3000, add = TRUE)
}
