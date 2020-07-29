
setwd("C:/Users/USER/proyectos/R_proyect")
res<-read.csv(file= "res_limpio.csv")
res <- res[, -1]
aspiradoras<-as.data.frame(res)
View(aspiradoras)
