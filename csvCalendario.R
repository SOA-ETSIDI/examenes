library(data.table)

source('../misc/funciones.R')
source('../misc/defs.R')
semestres <- c("Septiembre-Enero", "Febrero-Junio")

semestreActual <- 1
cursoActual <- '2016-17'

examfinal <- '../examenes/examenes_finales/'

## Lee y escribe horarios en CSV
leeHorario <- examfinal

escribeHorario <- function(df, grupo, semestre)
{
  ##Aqui como solo es un archivo y no una union de muchos archivos, ¿Cómo habría que cambiarlo?
  file <- paste('examenes_finales/',
                 '.csv')
  write.csv2(df, file, row.names = FALSE)
}


## Devuelve character H.M (con punto  en lugar de :,  porque así está definida la plantilla de LaTeX)
formatHora2 <- function(x)
{
  format(as.POSIXct(x, format='%H:%M'),
         format = '%H.%M')
}
## Horas posibles en selector
horas <- hhSeq(h1 = "09:00", h2 = "21:00", by = "240 min")

join <- function(x, collapse = ' \\\\ ')
{
  x <- unique(x)
  ## Descarto elementos vacíos
  x <- x[x != ""]
  N <- length(x)
  if (N > 1) x <- shorten(x, 20)
  paste(x, collapse = collapse)
}
shorten <- function(x, width)
{
  x <- as.character(x)
  ifelse(nchar(x) > width, 
         {
           long <- c("Ingeniería", "Ingenieriles",
                     "Técnicas", "Operaciones",
                     "Aplicaciones", "Aplicados", "Aplicadas", "Aplicado", "Aplicada",
                     "Propiedades", "Conocimiento",
                     "Transformación",
                     "Sistemas",
                     "Eléctricos", "Electrónicos",
                     "Informáticos",
                     "Industriales", "Industrial")
           longTo <- c("Ing.", "Ing.",
                       "Téc.", "Op.",
                       "Apl.", "Apl.", "Apl.", "Apl.", "Apl.",
                       "Prop.", "Con.",
                       "Trans.",
                       "Sis.",
                       "Elec.", "Elec.",
                       "Inf.",
                       "Ind.", "Ind.")
           short <- c(" de ", " y ", " en ", " a ", " o ",
                      " los ", " las ", " el ", " la ")
           from <- c(long, short)
           to <- c(longTo, rep(" ", length(short)))
           for (i in seq_along(from))
           {
             x <- gsub(from[i], to[i], x)
           }
           trimws(strtrim(x, width))
         }, trimws(x))
}

## Genera un timetable en PDF a partir de un CSV
template <- readLines("timetable.tex")
csv2tt <- function(examfinal, nombre, semestre,
                   colorByTipo = TRUE,
                   dest = tempdir(),
                   preamble = template,
                   semString = semestres)
{
  examfinal <- as.data.table(examfinal)
  ## Recorto el nombre de la asignatura según el espacio disponible
  examfinal[,
     width := findInterval(dh,
                           seq(1, 8, .5),
                           right = TRUE) * 21
     ]
  ## Según el tipo uso un formato u otro (definidos en timetable.tex)
  if (isTRUE(colorByTipo))
  {
    examfinal[, formato := Tipo]
    examfinal[!(formato %in% sTipos),
       formato := "misc"]
  } else
  {## color definido por asignatura
    examfinal <- examfinal[, .(Tipo,
                 Dia,
                 HoraInicio, HoraFinal,
                 Aula,
                 width,
                 formato = LETTERS[.GRP]),
             by = Asignatura]
  }
  ## Cabecera del documento, después del preambulo
  header <- c("\\begin{document}",
              "\\begin{center}",
              paste('Convocatoria: EXTRAORDINARIO JULIO'),
              "\\begin{timetable}{9}{21}")
  
  ending <- c("\\end{timetable}",
              "\\end{center}",
              "\\end{document}")
  ## Logos
  file.copy(paste0('../misc/',
                   c('LogoETSIDI.pdf', 'LogoUPM.pdf')),
            dest)
  old <- setwd(dest)
  on.exit(setwd(old))
  texFile <- paste0(nombre, itinerario, "_", semestre, ".tex")
  writeLines(c(preamble, header, tuthTex, comida, htex, ending),
             con = texFile)
  system2('pdflatex', texFile)
  files2clean <- list.files('.', "(tex|log|aux)")
  file.remove(files2clean)
  ##    file.remove(c('LogoETSIDI.pdf', 'LogoUPM.pdf'))
}

