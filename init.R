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

##Tambien se puede suponer que examenes finales es un excel
# instalo paquete que lea excell
# install.packages("xlsx")

# Verifico si esta bien instalado
#any(grepl("xlsx",installed.packages()))
# cargo la libreria xlsx
#library("xlsx")
#library("rJava")


#exam <- read.xlsx("../examenes/examenes finales.xlsx", sheetIndex = 1)
#print(data)

#Tengo que extraer las columnas de cada grado

attach(cal_examen)
attach(exam)
search()

#ingeniería electrica
#ingenieria electrica industrial y automatica
#ingeniería mécanica
#ingeniería química
#ingeniería diseño industrial y desarrollo del producto

examIE <- ingeniería electrica
examIQ <- ingeniería química
examIA <- ingenieria electrica industrial y automatica
examIM <- ingeniería mécanica
examDD <- ingeniería diseño industrial y desarrollo del producto
#examDM <- subset(exam,Titulacion=='56DM')
#examEE <- subset(exam,Titulacion=='56EE')

