library(rhandsontable)
library(shiny)
library(shinyjs)

semestre=c('primero','tercero','quinto','septimo')
fechas=c(1,2,3,4,5,6,7,8,9,10)
horas=c('10','16')
especialidad=c('ingenieria electrica','ingeniería electronica industrial y automatica','ingeniería mécanica','ingeniería química','ingeniería de diseño industrial y desarrolo del producto')
electrica=c() #recordatorio! no hace falta ponerlos ahora
electronica=c()
mecanica=c()
quimica=c()
diseño=c()
examenes <- data.frame(duplicado,electrica,electronica,mecanica,quimica,diseño)
duplicado <- expand.grid(horas = horas, fechas = fechas) #duplicar
view(examenes)
