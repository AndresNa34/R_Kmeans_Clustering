
setwd("C:/Users/USER/proyectos/R_proyect/")
data<-read.csv(file= "res_limpio.csv")
data<-data[, -1]
data<-data[,-1]
View(data)

#Quitando los NA de ancho y profundidad

#ancho
anchomedio<-mean(data$ancho, na.rm=TRUE)
anchomedio
data$ancho[is.na(data$ancho)]<-anchomedio

#profundidad
profundidadmedio<-mean(data$profundidad, na.rm=TRUE)
profundidadmedio
data$profundidad[is.na(data$profundidad)]<-profundidadmedio
View(data)
data<-scale(data)