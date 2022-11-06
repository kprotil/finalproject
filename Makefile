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
	rm -f output/*.Rds && rm -f report.html && rm -f output/*.png && rm -f output/casetable.rds
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt=FALSE)"