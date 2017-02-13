source('../misc/defs.R')
source('../misc/funciones.R')

## install.packages("dplyr")

## library(dplyr)

asignaturas <- read.csv2("../misc/asignaturas.csv")
rownames(asignaturas) <- NULL
#separo las asignaturas segun especialidad de grado
asigIE <- subset(asignaturas,Titulacion=='56IE')
asigIQ <- subset(asignaturas,Titulacion=='56IQ')
asigIA <- subset(asignaturas,Titulacion=='56IA')
asigIM <- subset(asignaturas,Titulacion=='56IM')
asigDD <- subset(asignaturas,Titulacion=='56DD')
asigDM <- subset(asignaturas,Titulacion=='56DM')
asigEE <- subset(asignaturas,Titulacion=='56EE')
#separo segun especialidad de master
asigAA <- subset(asignaturas,Titulacion=='56AA')
asigAB <- subset(asignaturas,Titulacion=='56AB')
asigAC <- subset(asignaturas,Titulacion=='56AC')

cal_examen <- read.csv2("../examenes/examenes finales.csv")
#analizo lo que esta puesto y lo comparo
