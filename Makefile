all:
	pdflatex programme.tex
	pdflatex programme.tex
clean:
	rm *.aux *.log *.out *.idx
veryclean:
	rm *.aux *.log *.out *.idx programme.pdf
