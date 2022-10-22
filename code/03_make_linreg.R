here::i_am("code/02_make_table.R")
data <- readRDS(file="output/data_clean.Rds")

library(dplyr)
library(ggplot2)

linreg <- ggplot(data, aes(cases, covid_hospital_admissions_per_100k)) +
  geom_point() +
  geom_smooth(method="lm") +
  xlab("Covid Cases (Per 100,000)") +
  ylab("Hospital Admissions (Per 100,000)")

ggsave(
  "output/linreg.png",
  plot = linreg,
  device = "png"
)