here::i_am("code/02_make_table.R")
data <- readRDS(file="output/data_clean.rds")

table <- aggregate(data$cases,list(data$health_service_area),mean)
tablesorted <- table[order(table$x),]
rownames(tablesorted) <- NULL
colnames(tablesorted) <- c("Health Service Area", "Average Covid Cases (Per 100,000)")

saveRDS(
  tablesorted,
  file = here::here("output/casetable.rds")
)