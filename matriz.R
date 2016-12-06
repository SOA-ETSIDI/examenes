library(rhandsontable)
library(shiny)
library(shinyjs)

#llamo las funciones de misc con los nombres de los grados
source('~/GitHub/misc/defs.R')
source('../misc/funciones.R')
#no me las detecta

dias_examen <- c("1", "2", "3","4")
horas <- c("10" , "16")

#llamo las titulaciones directamente
grados <- paste0(56, c('IA', 'IE', 'IM', 'IQ', 'DD'))
names(grados) <- paste('Grado en Ingeniería',
                       c('Electrónica Industrial y Automática',
                         'Eléctrica',
                         'Mecánica',
                         'Química',
                         'en Diseño Industrial y Desarrollo de Producto')
)
dias_examen <- n
#creo una matriz con tantas filas como dias_examen y tantas columnas como titulaciones
n<-8
A <- matrix (1:n , nrow = length(dias_examen))
dimnames (A)= list (dias_examen,names(grados))
#me salta este error (Error in dimnames(A) = list(dias_examen, names(grados)) : 
#length of 'dimnames' [2] not equal to array extent)
