# Compute PAM
library("cluster")
library(purrr)
library(FactoMineR)
library(ggplot2)

#Leemos datos prácticamente limpios
data_fanny<-read.csv("C:/Users/80214178/Documents/Tesis/X.csv")

# Funcion para calcular la silueta promedio
wss <- function(k) {
  return(fanny(data_fanny, k)$silinfo$avg.width)
}

#Generamos las siluetas promedio
wss_values <- map(2:10, wss)

#Graficamos
plot(2:10, wss_values,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Silhouette")


#El número óptimo es 5

#Corremos PAM
FANNY<-fanny(data_fanny, 4)

#Graficamos con PCA
model = prcomp(data_fanny, scale=TRUE)

plot_data=data.frame(cbind(model$x[,1:2],FANNY$clustering))
colnames(plot_data)=c("PC1","PC2","clus")


ggplot(plot_data, aes(x=PC1, y=PC2, color=as.factor(clus))) +
  geom_point()
