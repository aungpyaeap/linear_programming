library(projmanr)
library(plyr)
library(lazyeval)

data <- data.frame(id = LETTERS[1:8],
                   name = LETTERS[1:8], duration = c(3,3,2,3,7,3,6,2),
                   pred = c("","A","A","B","C","B","C","D","E","C"))
gantt(data, start_date =  as.Date("2018-01-01"))
res = critical_path(data, gantt = TRUE, network = TRUE,
                    start_date = as.Date("2018-01-01"))
res


# using ProjectManagement library
library(ProjectManagement)
precedence = matrix(0,8,8)
precedence[1,2] = precedence[1,3] = 1
precedence[2,4] = precedence[2,6] = 1
precedence[3,5] = precedence[3,6] = 1
precedence[3,8] = 1
precedence[4,7] = precedence[5,7] = 1
dimnames(precedence) = list(c(LETTERS[1:9]), c(LETTERS[1:9]))
precedence

duration = c(3,3,2,3,7,3,6,2)
schedule.pert(duration, precedence)