library(tidyverse)
library(readr)
library(dplyr)
library("irr")

df <- read_csv("./data/IRR.csv")

types <- df[c("TDTYPErater1","TDTYPErater2")]

types <- types %>% drop_na()

View(types)

types <- types %>%
  mutate('TDTYPErater1'=case_when(
    .$TDTYPErater1=="architecture" ~ 1,
    .$TDTYPErater1=="design" ~ 2,
    .$TDTYPErater1=="versioning" ~ 3,
    .$TDTYPErater1=="test" ~ 4,
    .$TDTYPErater1=="requirements" ~ 5,
    .$TDTYPErater1=="infrastructure" ~ 6,
    .$TDTYPErater1=="documentation" ~ 7,
    .$TDTYPErater1=="build" ~ 8,
    .$TDTYPErater1=="code" ~ 9
  ))

types <- types%>%
  mutate('TDTYPErater2'=case_when(
    .$TDTYPErater2=="architecture" ~ 1,
    .$TDTYPErater2=="design" ~ 2,
    .$TDTYPErater2=="versioning" ~ 3,
    .$TDTYPErater2=="test" ~ 4,
    .$TDTYPErater2=="requirements" ~ 5,
    .$TDTYPErater2=="infrastructure" ~ 6,
    .$TDTYPErater2=="documentation" ~ 7,
    .$TDTYPErater2=="build" ~ 8,
    .$TDTYPErater2=="code" ~ 9
  ))

print(kappa2(types, weight="unweighted", sort.levels="FALSE"))

TDR <- df[c("TDRrater1","TDRrater2")]
print(kappa2(TDR, weight="unweighted", sort.levels="FALSE"))

urgency <- df[c("URGENCYrater1","URGENCYrater2")]
print(kappa2(urgency, weight="unweighted", sort.levels="FALSE"))
