
setwd("C:/Users/USER/proyectos/R_proyect")
res<-read.csv(file= "res_limpio.csv")
res <- res[, -1]
aspiradoras<-as.data.frame(res)
View(aspiradoras)

#Procesado de peso

aspiradoras$`Peso del producto`<-as.character(aspiradoras$`Peso del producto`)
aspiradoras$`Peso del producto`<-gsub(" Kg", "", aspiradoras$`Peso del producto`)
aspiradoras$`Peso del producto`<-gsub(",", ".", aspiradoras$`Peso del producto`)
aspiradoras$`Peso del producto`<-gsub("-1",NA, aspiradoras$`Peso del producto`)
aspiradoras$`Peso del producto`<-as.numeric(aspiradoras$`Peso del producto`)
pesomedio<-mean(aspiradoras$`Peso del producto`, na.rm=TRUE)
pesomedio
aspiradoras$`Peso del producto`[is.na(aspiradoras$`Peso del producto`)]<-pesomedio

hist(aspiradoras$`Peso del producto`)
summary(aspiradoras$`Peso del producto`)