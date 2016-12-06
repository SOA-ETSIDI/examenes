source('../GitHub/misc/defs.R')
source('../GitHub/misc/funciones.R')

install.packages("dplyr")

asignaturas <- read.csv("~/GitHub/misc/asignaturas.csv", sep=";")
#separo las asignaturas segun especialidad de grado
asigIE <- subset(asignaturas,titulacion=='56IE')
asigIQ <- subset(asignaturas,titulacion=='56IQ')
asigIA <- subset(asignaturas,titulacion=='56IA')
asigIM <- subset(asignaturas,titulacion=='56IM')
asigDD <- subset(asignaturas,titulacion=='56DD')
asigDM <- subset(asignaturas,titulacion=='56DM')
asigEE <- subset(asignaturas,titulacion=='56EE')
#separo segun especialidad de master
asigAA <- subset(asignaturas,titulacion=='56AA')
asigAB <- subset(asignaturas,titulacion=='56AB')
asigAC <- subset(asignaturas,titulacion=='56AC')

#para que la numeracion empiece en 1
rownames(asigIE)=1:length(rownames(asigIE))

