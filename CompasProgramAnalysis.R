# Compas Analysis
# This script aims to provide the reader an easy-to-use 
# procedure that allows the replication of our findings
# regarding the text difficulty of the COMPAS program

################################# 
### INITIALIZING THE ANALYSIS ###
#################################

folder <- setwd("/home/juan/Documents/COMPAS")
sesiones <- dir(folder)

library(koRpus)
ID <- paste("session",1:length(sesiones), sep = "")
results <- vector("list", length(sesiones))
tok <- vector("list", length(sesiones))
Escolaridad <- vector("double", length(sesiones))
Edad <- vector("double", length(sesiones))

for(i in seq_along(sesiones)){
  results[[i]] <- tokenize(sesiones[[i]], lang = "es")
  tok[[i]] <- SMOG(results[[i]])
  Escolaridad[[i]] <- tok[[i]]@SMOG[[2]]
  Edad[[i]] <- tok[[i]]@SMOG[[3]]
}
DifText <- data.frame(ID, sesiones, Escolaridad, Edad)
hist(DifText$Escolaridad, xlab = "Años de Escolaridad", col = "lightblue")
library(ggplot2)
ggplot(DifText, aes(DifText$ID, DifText$Escolaridad)) + geom_bar(stat = "identity", fill="red") + xlab("Session Number") + ylab("Years of Education")
