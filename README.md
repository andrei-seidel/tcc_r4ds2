---
title: "Aspectos temporais dos acidentes de trânsito ocorridos em rodovias federais nos anos de 2015 a 2019"
author: "por Andrei Seidel"
date: "02 de junho de 2021"
---

### 1. INTRODUÇÃO

O Brasil é um dos paíes mais violentos no trânsito. Anualmente, milhares de acidentes e vítimas são noticiado, seja na imprensa escrita ou videosonora, principalmente em épocas de feriado. O fato de sermos um país continental, baseado principalmente em transporte rodoviário, a infraestrutura precária das rodovias, a imprudência no trânsito, além do mal planejamento de ocupação do território (cidades e estados), facilitam a ocorrência de acidentes. 
O presente traballho tem como objetivo verificar como os acidentes, em rodovias federais, ocorrem ao longo do horário do dia, do dia da semana, dos meses e dos anos. O período estudado compreende os anos de 2015 a 2019. A base de dados utilizada é disponibilizada pela Polícia Rodoviária Federal em seu [site - seção de dados abertos (acidentes agrupados por ocorrência)](https://portal.prf.gov.br/dados-abertos-acidentes). A base é composta por 444.828 observações e por 32 variáveis. Cada observação corresponde a um acidente e cada coluna representa uma característica associada ao acidente.
As variáveis de interesse do trabalho são: data_inversa, dia_semana e horario. 


```{r echo=FALSE, message=FALSE, warning=FALSE, paged.print=FALSE, fig.align='center'}

dados_limpos<-readRDS("R/dados_limpos.rds")
dplyr::glimpse(dados_limpos)
  
```

### 2. ANÁLISE

#### 2.1 Acidentes por ano (2015 a 2019)

dados_limpos %>% dplyr::group_by(lubridate::year(data_inversa)) %>% 
  ggplot2::ggplot() + ggplot2::geom_bar(ggplot2::aes(x=lubridate::year(data_inversa)))


#### 2.2 Acidentes no ano ao longo dos meses

dados_limpos_split<-dados_limpos %>% 
  dplyr::group_split(lubridate::year(data_inversa))

dados_limpos_split[[1]] %>% ggplot2::ggplot() +
  ggplot2::geom_bar(ggplot2::aes(x=data_inversa))+
  ggplot2::labs(x="data",y="numero_acidentes")
dados_limpos_split[[2]] %>% ggplot2::ggplot() +
  ggplot2::geom_bar(ggplot2::aes(x=data_inversa))+
  ggplot2::labs(x="data",y="numero_acidentes")
dados_limpos_split[[3]] %>% ggplot2::ggplot() +
  ggplot2::geom_bar(ggplot2::aes(x=data_inversa))+
  ggplot2::labs(x="data",y="numero_acidentes")
dados_limpos_split[[4]] %>% ggplot2::ggplot() +
  ggplot2::geom_bar(ggplot2::aes(x=data_inversa))+
  ggplot2::labs(x="data",y="numero_acidentes")
dados_limpos_split[[5]] %>% ggplot2::ggplot() +
  ggplot2::geom_bar(ggplot2::aes(x=data_inversa))+
  ggplot2::labs(x="data",y="numero_acidentes")


#### 2.3 Acidentes ao longo do dia e ao longo do dia por dia da semana

hora %>% dplyr::group_by(V1)%>% 
  ggplot2::ggplot() + ggplot2::geom_bar(ggplot2::aes(x=V1))+
  ggplot2::labs(x="hora",y="numero_acidentes")

hora %>% dplyr::group_by(dia_semana)%>% 
  ggplot2::ggplot() + ggplot2::geom_bar(ggplot2::aes(x=V1)) +
  ggplot2::facet_grid(dia_semana~.)+ggplot2::labs(x="hora",y="numero_acidentes")

### 3. CONCLUSÃO

### 4. REFERÊNCIA

Site da PRF: https://www.gov.br/prf/pt-br




