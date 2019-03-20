#install.packages("queueing")
library(queueing)

mm1 <- NewInput.MM1(lambda = 20,mu = 30)
QueueingModel(mm1)
mm1 <- QueueingModel(mm1)
Report(mm1)
summary(mm1)


mm1 <- NewInput.MM1(lambda = 20,mu = 30,n = 10)
QueueingModel(mm1)
mm1 <- QueueingModel(mm1)
Report(mm1)
barplot(Pn(mm1))
1 - sum(Pn(mm1))
summary(mm1)


input <- NewInput.MMC(lambda = 30,mu = 30,c = 2,n = 10)
mm2 = QueueingModel(input)
Report(mm2)
barplot(Pn(mm2))
1 - sum(Pn(mm2))
summary(mm2)

cost <- function(L,waiting_cost,server_cost,c){
  return(L * waiting_cost + c * server_cost)
}
paste("The cost for MM2 is",cost(L(mm2),30,20,2))

for(i in 2:5){
  input = NewInput.MMC(lambda = 40, mu = 30, c = i)
  mm2 = QueueingModel(input)
  print(paste("The cost of MM",i,"is",round(cost(L(mm2),30,20,i),2)))
}