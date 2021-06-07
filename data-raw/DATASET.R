library(magrittr)

# Lendo os dados

intermed<-purrr::map_df(.f = read.csv2,
                        .x = c("data-raw/2015.csv",
                               "data-raw/2016.csv",
                               "data-raw/2017.csv",
                               "data-raw/2018.csv",
                               "data-raw/2019.csv"))

# Limpando os dados

intermed$dia_semana <- intermed$dia_semana %>% stringr::str_to_lower() %>%
  stringr::str_remove_all(pattern ="-feira") %>%
  forcats::fct_relevel(c("domingo","segunda","terça","quarta","quinta",
                         "sexta","sábado"))


hora<-intermed$horario %>% stringr::str_split(pattern = ":",simplify = TRUE) %>%
  tibble::as_tibble() %>% dplyr::rename("hora"=V1)



intermed$hora<-hora$hora

intermed<-intermed %>% dplyr::arrange(data_inversa)
# Exportar os dados limpos

setwd("R")

intermed %>% saveRDS("dados_limpos.rds")
