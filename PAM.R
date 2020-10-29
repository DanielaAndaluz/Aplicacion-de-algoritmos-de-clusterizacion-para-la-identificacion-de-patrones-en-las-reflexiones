# Compute PAM
library("cluster")
library(purrr)
library(FactoMineR)
library(ggplot2)
library(factoextra)
#-------------bow

#Leemos datos prácticamente limpios
data_pamB<-read.csv("C:/Users/80214178/Documents/X_tfidf.csv")


fviz_nbclust(data_pamB, cluster::pam, method = "wss") +
  geom_vline(xintercept = 4, linetype = 2)+
  labs(subtitle = "Elbow method")


#Corremos PAM
PAM<-pam(data_pamB, 4)

#Graficamos con PCA
model = prcomp(data_pamB, scale=TRUE)

plot_data=data.frame(cbind(model$x[,1:2],PAM$clustering))
colnames(plot_data)=c("PC1","PC2","clus")


ggplot(plot_data, aes(x=PC1, y=PC2, color=as.factor(clus))) +
  geom_point()

