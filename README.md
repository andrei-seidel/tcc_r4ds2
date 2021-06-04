---
title: "Aspectos temporais dos acidentes de trânsito ocorridos em rodovias federais nos anos de 2015 a 2019"
author: "por Andrei Seidel"
date: "02 de junho de 2021"
header-includes:
- \newcommand{\bcenter}{\begin{center}}
- \newcommand{\ecenter}{\end{center}}
output:
  prettydoc::html_pretty:
    theme: architect
    highlight: github
---

### 1. INTRODUÇÃO

O Brasil é um dos paíes mais violentos no trânsito. Anualmente, milhares de acidentes e vítimas são noticiado, seja na imprensa escrita ou videosonora, principalmente em épocas de feriado. O fato de sermos um país continental, baseado principalmente em transporte rodoviário, a infraestrutura precária das rodovias, a imprudência no trânsito, além do mal planejamento de ocupação do território (cidades e estados), facilitam a ocorrência de acidentes. 
O presente traballho tem como objetivo verificar como os acidentes, em rodovias federais, ocorrem ao longo do horário do dia, do dia da semana, dos meses e dos anos. O período estudado compreende os anos de 2015 a 2019. A base de dados utilizada é disponibilizada pela Polícia Rodoviária Federal em seu [site - seção de dados abertos (acidentes agrupados por ocorrência)](https://portal.prf.gov.br/dados-abertos-acidentes). A base é composta por 444.828 observações e por 31 variáveis.


```{r echo=FALSE, message=FALSE, warning=FALSE, paged.print=FALSE, fig.align='center'}

dplyr::glimpse
  
```





