# __Maryland COVID-19 Report__

### Karl Protil

## __Project Summary__
This project creates a report on COVID-19 cases in Maryland. The report includes two main components: a table of average covid cases per 100,000 people for each county, and a scatterplot of hospital admissions per 100,000 people and covid cases per 100,000, with each point representing a county in Maryland.

## __Instructions__
The table can be generated from the 02_make_table.R code found in the code file, or by making output/casetable.rds

The scatterplot can be generated from the 03_make_linreg.R code found in the code file, or by making output/linreg.png

The report can be generated several ways. The report.Rmd file can be knitted, the 04_render_report.R code (found in the code file) can be run, or you can make report

To synchronize your package repository, use the following commands in the console in order:

`source("renv/activate.R")`
`renv::restor()`

Together, these will install the needed packages and update the versions. This may take several minutes.
