EMACS=emacs
BATCH_EMACS=$(EMACS) --batch -l ~/Dropbox/.emacs.d/init.el
REQUIREMENTS=python
PDFLATEX=pdflatex -shell-escape
LATEX=latex -shell-escape

clean:
	rm -f *.aux *.log *.dvi *.blg *.bbl *.toc *~ *.out *.idx *.ilg *.ind *.lof *.lot *.css *.idv *.lg *.tmp *.xref *.4ct *.4tc

# make hwk hwk=hwk1
hwk:
	echo running with $(hwk)
	rm -f $(hwk).tex $(hwk).pdf $(hwk)_flymake.tex $(hwk).pyg $(hwk)-source.pdf $(hwk)-source.org
	$(BATCH_EMACS)  $(hwk).org \
	                --execute="(setq org-export-exclude-tags '(\"solution\"))"  \
	                -f org-export-as-pdf-and-open \
			-f org-export-as-org
	mv $(hwk).pdf $(hwk)-source.pdf

# make soln hwk=hwk1
soln:
	echo running with $(hwk)
	rm -f $(hwk).tex $(hwk).pdf $(hwk)_flymake.tex $(hwk).pyg $(hwk)-solution.pdf
	$(BATCH_EMACS)  $(hwk).org \
	                -f org-export-as-pdf-and-open
	mv $(hwk).pdf $(hwk)-solution.pdf
