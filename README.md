---
title: "Aspectos temporais dos acidentes de trânsito ocorridos em rodovias federais nos anos de 2015 a 2019"
author: "por Andrei Seidel"
date: "02 de junho de 2021"
---

### 1. INTRODUÇÃO

O Brasil é um dos paíes mais violentos no trânsito. Anualmente, milhares de acidentes e vítimas são noticiado, seja na imprensa escrita ou videosonora, principalmente em épocas de feriado. O fato de sermos um país continental, baseado principalmente em transporte rodoviário, a infraestrutura precária das rodovias, a imprudência no trânsito, além do mal planejamento de ocupação do território (cidades e estados), facilitam a ocorrência de acidentes. 
O presente traballho tem como objetivo verificar como os acidentes, em rodovias federais, ocorrem ao longo do horário do dia, do dia da semana, dos meses e dos anos. O período estudado compreende os anos de 2015 a 2019. A base de dados utilizada é disponibilizada pela Polícia Rodoviária Federal em seu [site - seção de dados abertos (acidentes agrupados por ocorrência)](https://portal.prf.gov.br/dados-abertos-acidentes). A base é composta por 444.828 observações e por 32 variáveis. Cada observação corresponde a um acidente e cada coluna representa uma característica associada ao acidente.
As variáveis de interesse do trabalho são: data_inversa, dia_semana e horario. 
```{r}
library(magrittr)
dados_limpos<-readRDS("R/dados_limpos.rds")
dplyr::glimpse(dados_limpos)
```
### 2. ANÁLISE

#### 2.1 Acidentes por ano (2015 a 2019)

No gráfico 1 percebe-se que desde 2015 o número de acidentes vêm caindo. Em 2015 eram quase 125 mil acidentes, que caem para menos de 75 mil em 2019.
```{r}
dados_limpos %>% dplyr::group_by(lubridate::year(data_inversa)) %>% 
  ggplot2::ggplot() + ggplot2::geom_bar(ggplot2::aes(x=lubridate::year(data_inversa)))+
  ggplot2::labs(x="ano",y="numero_acidentes",title="Gráfico 1")
```
#### 2.2 Acidentes no ano ao longo dos meses

O ano de 2015 é um ano atípico, porque, como já dito antes, possui o número de acidentes bem acima dos outros anos. Além disso, os acidentes estão concentrados de janeiro a julho, com brusca redução após. 
Percebe-se também que os acidentes, de 2015 a 2019, concentram-se nos sábados e domingos, com picos a cada 7 dias.
```{r}
dados_limpos_split<-dados_limpos %>% 
  dplyr::group_split(lubridate::year(data_inversa))
plot1<-dados_limpos_split[[1]] %>% ggplot2::ggplot() +
  ggplot2::geom_bar(ggplot2::aes(x=as.Date(data_inversa)))+
  ggplot2::labs(x="dia",y="numero_acidentes",title="2015")+
    ggplot2::scale_x_date(date_breaks = "1 month")
plot2<-dados_limpos_split[[2]] %>% ggplot2::ggplot() +
  ggplot2::geom_bar(ggplot2::aes(x=as.Date(data_inversa)))+
  ggplot2::labs(x="dia",y="numero_acidentes",title="2016")+
    ggplot2::scale_x_date(date_breaks = "1 month")
plot3<-dados_limpos_split[[3]] %>% ggplot2::ggplot() +
  ggplot2::geom_bar(ggplot2::aes(x=as.Date(data_inversa)))+
  ggplot2::labs(x="dia",y="numero_acidentes",title="2017")+
    ggplot2::scale_x_date(date_breaks = "1 month")
plot4<-dados_limpos_split[[4]] %>% ggplot2::ggplot() +
  ggplot2::geom_bar(ggplot2::aes(x=as.Date(data_inversa)))+
  ggplot2::labs(x="dia",y="numero_acidentes",title="2018")+
    ggplot2::scale_x_date(date_breaks = "1 month")
plot5<-dados_limpos_split[[5]] %>% ggplot2::ggplot() +
  ggplot2::geom_bar(ggplot2::aes(x=as.Date(data_inversa)))+
  ggplot2::labs(x="dia",y="numero_acidentes", title="2019")+
    ggplot2::scale_x_date(date_breaks = "1 month")
isso<-list(plot1,plot2,plot3,plot4,plot5)
gridExtra::marrangeGrob(grobs=isso,
nrow=5,ncol=1)
```
#### 2.3 Acidentes ao longo do dia e ao longo do dia por dia da semana

Ao longo do dia, o número de acidentes cresce até às 7 horas, quando atinge o pico, descrescendo até o meio-dia. A partir daí começa a crescer até às 18 horas, quando atinge o pico e começa a decrescer. Percebe-se que são horários típicos de pessoas que estão indo e voltando do trabalho.
Quando o horário é observado de acordo com o dia da semana, o padrão é o mesmo. Somente nos sábados e domingos há uma mudança de magnitude, pois nos domingos, às 18 horas, há um maior número de acidentes, e nos sábados, às 7 horas, não há um pico acentudado.
```{r}
dados_limpos %>% dplyr::group_by(hora)%>% 
  ggplot2::ggplot() + ggplot2::geom_bar(ggplot2::aes(x=hora))+
  ggplot2::labs(x="hora",y="numero_acidentes", title="acidentes x hora")

dados_limpos %>% dplyr::group_by(dia_semana)%>% 
  ggplot2::ggplot() + ggplot2::geom_bar(ggplot2::aes(x=hora)) +
  ggplot2::facet_grid(dia_semana~.)+ggplot2::labs(x="hora",y="numero_acidentes")
```
### 3. REFERÊNCIA

Site da PRF: https://www.gov.br/prf/pt-br




