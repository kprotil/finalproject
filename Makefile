report: report.Rmd code/04_render_report.R output/casetable.rds output/linreg.png
	Rscript code/04_render_report.R

output/data_clean.rds: code/01_data_cleaning.R data/Covid_Data.csv
	Rscript code/01_data_cleaning.R

output/casetable.rds: code/02_make_table.R output/data_clean.rds
	Rscript code/02_make_table.R
	
output/linreg.png: code/03_make_linreg.R output/data_clean.rds
	Rscript code/03_make_linreg.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html && rm -f output/*.png && rm -f output/casetable.rds && rm -f report/report.html
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt=FALSE)"

#Docker Rules
PROJECTFILES = report.Rmd code/01_data_cleaning.R code/02_make_table.R code/03_make_linreg.R code/04_render_report.R Makefile

project_image: Dockerfile $(PROJECTFILES)
	docker build -t project_image .
	touch $@

docker-run: project_image
	docker run -v "//$$(pwd)"/report:/project/report project_image