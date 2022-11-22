# __Maryland COVID-19 Report__

### Karl Protil

## __Project Summary__
This project creates a report on COVID-19 cases in Maryland. The report includes two main components: a table of average covid cases per 100,000 people for each county, and a scatterplot of hospital admissions per 100,000 people and covid cases per 100,000, with each point representing a county in Maryland.

## __Building the Figures and Report__
There are two ways to build any of the figures

### Clean Data
Run the 01_data_cleaning.R code found in the code file

`make output/data_clean.rds` will also create the clean dataset

### Case Table
Run the 02_make_table.R code found in the code file

`make output/casetable.rds` will also create the case table

### Linear Regression
Run the 03_make_linreg.R code found in the code file

`make output/linreg.png` will also create the linear regression figure

### Report Generation
The report can be generated several ways

Knit the report.Rmd file

Run the 04_render_report.R code found in the code file

`make report`

## __Synchonizing Package Repository__
There are two ways to synchronize the package repository

`source("renv/activate.R")` and then `renv::restore()` will synchronize the repository

`make install` will also synchronize the repository

## __Building the Docker Image__
There are two ways to build the docker image

`make project_image` will create the docker image

`docker pull kprotil/finalproject` will download the image from dockerhub

`make pull image` will also download the image from dockerhub

https://hub.docker.com/repository/docker/kprotil/finalproject/general

## __Using Docker to Run the Report__
`make docker-run-pc` will run docker automatically and create the report in the "report" folder, if you are on a pc

`make docker-run-mac` will run docker automatically and create the report in the "report" folder, if you are on a mac