FROM rocker/r-ubuntu

RUN Rscript -e "install.packages('here')"
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('ggplot2')"

RUN apt-get update && apt-get install -y pandoc

RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libfontconfig1-dev
RUN apt-get install -y libssl-dev
RUN Rscript -e "install.packages('kableExtra')"

RUN mkdir project
workdir /project

COPY Makefile .
COPY report.Rmd .

RUN mkdir code
RUN mkdir output
RUN mkdir data
RUN mkdir report

COPY code/01_data_cleaning.R code
COPY code/02_make_table.R code
COPY code/03_make_linreg.R code
COPY code/04_render_report.R code

COPY data/Covid_Data.csv data

CMD make && mv report.html report