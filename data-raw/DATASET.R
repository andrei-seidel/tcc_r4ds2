library(magrittr)

# Lendo os dados

intermed<-purrr::map_df(.f = read.csv2,
                        .x = c("data-raw/2015.csv",
                               "data-raw/2016.csv",
                               "data-raw/2017.csv",
                               "data-raw/2018.csv",
                               "data-raw/2019.csv"))



usethis::use_data(DATASET, overwrite = TRUE)
