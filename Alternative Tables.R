Data frame
```{r, echo=FALSE, eval=FALSE}
knitr::kable(data_frame)
#gt(data_frame)
```


```{r,echo=FALSE, eval=FALSE}
library(knitr)
library(kableExtra)

tex2markdown <- function(texstring) {
  writeLines(text = texstring,
             con = myfile <- tempfile(fileext = ".tex"))
  texfile <- pandoc(input = myfile, format = "html")
  cat(readLines(texfile), sep = "\n")
  unlink(c(myfile, texfile))
}


textable <- "
\\begin{table}[]
\\begin{tabular}{|l|l|c|l|l|l|l|c|r|}
\\hline
\\begin{table}[]
\\centering
\\caption{Food order}
\\begin{tabular}{| l | l |}
\\hline
 Hamburgers & 3 \\\\ 
 Hot dogs & 2 \\\\ \\hline
\\end{tabular}
\\end{table}
"


tex2markdown(textable)
```

Text format




+---------+----------+--------+--------------------+--------------------+---------------------------------------------+------------------+------+---------------------+
  | Genero  | Especies | Riesgo | Variacion espacial | Variacion temporal | ltencia Metodos de estimacion de paramatros | Historia de vida | Otro |                 Ref |
  +---------+----------+--------+--------------------+--------------------+---------------------------------------------+------------------+------+---------------------+
  | Aspasia | p        |    X   |                    |                    |                                             |                  |   X  | @zotz2006population |
  +---------+----------+--------+--------------------+--------------------+---------------------------------------------+------------------+------+---------------------+
  | A       | C        |    F   |                    |                    |                                             |                  |   X  |                     |
  +---------+----------+--------+--------------------+--------------------+---------------------------------------------+------------------+------+---------------------+
  | A       | D        |    D   |                    |                    |                                             |                  |   X  |                   x |
  +---------+----------+--------+--------------------+--------------------+---------------------------------------------+------------------+------+---------------------+
  
  
  
  
  
  
  Markdown Format




| Genero  | Especies | Riesgo | Variacion espacial | Variacion temporal | ltencia Metodos de estimacion de paramatros | Historia de vida | Otro |                 Ref |
  |---------|----------|:------:|--------------------|--------------------|---------------------------------------------|------------------|:----:|--------------------:|
  | Aspasia | p        |    X   |                    |                    |                                             |                  |   X  | @zotz2006population |
  | A       | C        |    F   |                    |                    |                                             |                  |   X  |                     |
  | A       | D        |    D   |                    |                    |                                             |                  |   X  |                   x |
  
  
  
  
  ```{r, echo=FALSE,eval=FALSE}

library(flextable)
library(ftExtra)


d=dplyr::tribble(
  ~study_id, ~lead_author, ~sample_ze, ~refs,
  1, "Guan, Ni", 1099, "[@conde2019data]",
  2, "Guan, Liang", 1590, "[@fenner2017ecology]"
)

d %>%
  flextable() %>%
  colformat_md() %>%
  autofit()
```





```{r, echo=FALSE, eval=FALSE}
library(easypackages)
packages(
  "tidyverse",
  "flextable",
  "ftExtra"
)
library(flextable)
library(ftExtra)
knitr::opts_chunk$set(echo = FALSE)
knitr::opts_chunk$set(fig.retina = 3, warning = FALSE, message = FALSE)
```