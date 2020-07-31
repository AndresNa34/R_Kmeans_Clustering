
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

#empezamos el kmeans
mycluster<-kmeans(data, 3, nstart=5, iter.max = 30)

#aqui hacemos el elbow, en wss se guarda la suma de withinss
wss<-(nrow(data)-1)*sum(apply(data,2,var))
for(i in 2:20) wss[i]<-sum(kmeans(data,centers=i)$withinss)
wss
plot(1:20, wss, type="b", xlab="Numero de clusters", ylab= "withinss groups")

#del elbow definimos 8 clusters en el video, 10 aqui
mycluster<-kmeans(data, 8, nstart = 5, iter.max = 30)

library(fmsb) #para hacer un grafico radar para observar los clusters
par(mfrow=c(2,4)) #Esta funcion nos permite meter varios graficos en un mismo lienzo mfrow nos dice el numero de filas y columnas

#Creamos un data frame donde ir pegando
dat<-as.data.frame(t(mycluster$centers[1, ]))
dat

#añadir valores minimos y maximos para el primer cluster
dat<-rbind(rep(3,8), rep(-2,8), dat)
# datos<- rbind(rep(maximo, #variables), rep(minimo, #variables), datos)

dat
radarchart(dat)

#segundo cluster
dat<-as.data.frame(t(mycluster$centers[2, ]))
dat
dat<-rbind(rep(3,10), rep(-1.2,10), dat)
dat
radarchart(dat)

#tercer cluster
dat<-as.data.frame(t(mycluster$centers[3, ]))
dat
dat<-rbind(rep(3,10), rep(-1.2,10), dat)
dat
radarchart(dat)

#cuarto cluster
dat<-as.data.frame(t(mycluster$centers[4, ]))
dat
dat<-rbind(rep(3,10), rep(-1.2,10), dat)
dat
radarchart(dat)

#quinto cluster
dat<-as.data.frame(t(mycluster$centers[5, ]))
dat
dat<-rbind(rep(3,10), rep(-1.2,10), dat)
dat
radarchart(dat)

#sexto cluster
dat<-as.data.frame(t(mycluster$centers[6, ]))
dat
dat<-rbind(rep(3,10), rep(-1.2,10), dat)
dat
radarchart(dat)

#setimo cluster
dat<-as.data.frame(t(mycluster$centers[7, ]))
dat
dat<-rbind(rep(3,10), rep(-1.2,10), dat)
dat
radarchart(dat)

#octavo cluster
dat<-as.data.frame(t(mycluster$centers[8, ]))
dat
dat<-rbind(rep(3,10), rep(-1.2,10), dat)
dat
radarchart(dat)