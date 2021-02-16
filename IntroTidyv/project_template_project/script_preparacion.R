install.packages("here")
library(here)

install.packages("ProjectTemplate")
library(ProjectTemplate)

setwd("IntroTidyv")

create.project(project.name = "health_expenditures",
               template = "minimal")

library(tidyverse)

as_tibble(trees)

install.packages("readx1")
library(readxl)

read_excel(
  readxl_example("deaths.xlsx"),
  range = "arts!A5:F8",
  .name_repair = toupper
)
