EMACS=emacs
BATCH_EMACS=$(EMACS) --batch -l ~/Dropbox/.emacs.d/init.el 
REQUIREMENTS=python
PDFLATEX=pdflatex -shell-escape
LATEX=latex -shell-escape

org:
	emacs surfaces.org &

tex: surfaces.org surfaces.bib
	$(BATCH_EMACS) --visit=surfaces.org --funcall org-export-as-latex

pdf: tex $(PDFIMAGES)
	# note I do not use the org-export-as-pdf function here. I do not
	# remember why. Maybe to avoid the problem with enabling
	# -shell-escape globally? maybe because export to pdf in org-mode
	# is too forgiving, and overlooks many errors that this seems to
	# catch.
	pdflatex -shell-escape surfaces
	bibtex surfaces
	pdflatex -shell-escape surfaces
	#makeindex surfaces
	pdflatex -shell-escape surfaces

clean:
	rm -f *.aux *.log *.dvi *.blg *.bbl *.toc *~ *.out *.idx *.ilg *.ind *.lof *.lot *.css *.idv *.lg *.tmp *.xref *.4ct *.4tc

