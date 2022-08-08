library(tidyr)
library(dplyr)

# The three conditions of a "tidy" data set
df <- tribble(
       ~country, ~year, ~cases, ~population,
  "Afghanistan",  1999,    745,    19987071,
  "Afghanistan",  2000,   2666,    20595360,
       "Brazil",  1999,  37737,   172006362,
       "Brazil",  2000,  80488,   174504898,
        "China",  1999, 212258,  1272915272,
        "China",  2000, 213766,  1280428583)
df <- df %>% mutate(across(!(country), as.integer))

# Computing cases per year. Compare these two approaches!
(df %>% group_by(year) %>% summarize(n = sum(cases)))
(df %>% count(year, wt = cases))

# `Total Male` and `Total Female` are sample sizes of the respective genders
# from the population size `Total population`
# This is NOT tidy data. There is clearly the need for gender and sample columns
population <- tribble(
~stratum, ~geo_entity, ~`Total Male`, ~`Total Female`, ~`Total population`,
       1,           1,        179798,          145518,              325316,
       1,           2,        574609,          411950,              986558,
       2,           1,         74382,           60900,              135282,
       2,           2,        165032,          123596,              288628,
       4,           1,        126217,          193293,              319510,
       4,           2,        468454,          732914,             1201368,
       3,           1,         68993,           71217,              140210,
       3,           2,        166143,          160136,              326279
)

# This IS tidy data. In fact, the population column could be removed since
# it can easily be calculated from the gender_population
population_tidy <- population %>%
  gather(
    `Total Male`, `Total Female`,
    key = "gender",
    value = "gender_population") %>%
  mutate(gender = ifelse(gender == "Total Male", "Male", "Female"),
         population = `Total population`) %>%
  select(stratum, geo_entity, gender, gender_population, population) %>%
  arrange(stratum, geo_entity, desc(gender))

