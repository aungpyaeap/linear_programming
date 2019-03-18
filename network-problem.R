library(optrees)

nodes <- 1:7
arcs <- matrix(c(1,2,5,
                 1,5,8,
                 2,5,10,
                 2,3,16,
                 2,4,3,
                 4,5,2,
                 5,6,18,
                 4,6,12,
                 3,4,30,
                 3,7,26,
                 6,7,4,
                 4,7,14), ncol = 3, byrow = TRUE)
reGraph(nodes, arcs)
getShortestPathTree(nodes,arcs, algorithm = "Dijkstra", source.node=1, directed=FALSE)

getMinimumSpanningTree(nodes,arcs, algorithm = "Prim", start.node = 1)

getMinimumSpanningTree(nodes,arcs, algorithm = "Kruskal")

getMinimumSpanningTree(nodes,arcs, algorithm = "Boruvka", start.node = 1)
