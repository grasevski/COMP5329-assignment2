STUDENTIDS = 500395897_500710654

$(STUDENTIDS).zip: assignment2.py Predicted_labels.txt report/report.pdf
	mkdir -p $(STUDENTIDS)/code/{algorithm,input,output}
	cp assignment2.py  $(STUDENTIDS)/code/algorithm
	cp Predicted_labels.txt $(STUDENTIDS)/code/output
	cp $< $(STUDENTIDS)
	cd $(STUDENTIDS) && zip -r ../$@ *
	rm -r $(STUDENTIDS)

report/report.pdf: report/report.tex report/references.bib results figures
	cd report && pdflatex --synctex=1 report.tex && biber report && pdflatex --synctex=1 report.tex && pdflatex --synctex=1 report.tex

test:
	./assignment2.py

lint:
	yapf -d assignment2.py && pycodestyle assignment2.py

fix:
	yapf -i assignment2.py
