here::i_am("code/01_data_cleaning.R")

coviddata <- read.csv(file=here::here("data/Covid_Data.csv"))

coviddata$asdate <- as.Date(coviddata$date_updated)
coviddata$asnum <- as.numeric(coviddata$asdate)

max <- max(coviddata$asnum)
datemax <- as.Date(max, origin='1970-01-01')

cleaned <- coviddata[coviddata$asdate==datemax & coviddata$state=="Maryland",]
cleaned$cases <- as.numeric(as.character(cleaned$covid_cases_per_100k))

saveRDS(
  cleaned,
  file= here::here("output/data_clean.rds")
)