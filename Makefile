.PHONY: clean

clean:
		rm -rf figures
		rm -rf derived_data

report.html: Prison_Data.Rmd
		R -e "rmarkdown::render('Prison_Data.Rmd', output_format='html_document')"

Project.html: Prison_Data.Rmd Admissions\ by\ Race\ box\ plot.png Total\ admit\ and\ release.png Heat\ map\ by\ race.png Admit\ and\ release\ trends\ by\ state.png
		R -e "rmarkdown::render('Prison_Data.Rmd', output_format='html_document')"

admissions_releases_states.csv: admissions_releases_states.csv
		Rscript admissions_releases_states.R

Admissions\ by\ Race\ box\ plot.png: admissions_releases_states.csv AdminBox.R
		Rscript AdminBox.R

Total\ admit\ and\ release.png: admissions_releases_states.csv AdminRelease.R
		Rscript AdminRelease.R

Heat\ map\ by\ race.png: admissions_releases_states.csv HeatMap.R
		Rscript HeatMap.R

Admit\ and\ release\ trends\ by\ state.png: admissions_releases_states.csv StateTrends.R
		Rscript StateTrends.R
