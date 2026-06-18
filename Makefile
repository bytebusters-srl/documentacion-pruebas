# Atajos para compilar el documento LaTeX (Documento V&V)

DOCNAME = main
BUILDDIR = build

.PHONY: all clean watch prepare

prepare:
	mkdir -p $(BUILDDIR)/sections/front
	mkdir -p $(BUILDDIR)/sections/cap01
	mkdir -p $(BUILDDIR)/sections/cap02
	mkdir -p $(BUILDDIR)/sections/cap03
	mkdir -p $(BUILDDIR)/sections/cap04
	mkdir -p $(BUILDDIR)/sections/cap05
	mkdir -p $(BUILDDIR)/sections/cap06
	mkdir -p $(BUILDDIR)/sections/cap07

PDFLATEX = pdflatex -interaction=nonstopmode -synctex=1 -shell-escape -output-directory=$(BUILDDIR)

all: prepare
	-$(PDFLATEX) $(DOCNAME).tex
	-$(PDFLATEX) $(DOCNAME).tex
	-$(PDFLATEX) $(DOCNAME).tex
	-$(PDFLATEX) $(DOCNAME).tex
	-$(PDFLATEX) $(DOCNAME).tex
	@echo "PDF generado en $(BUILDDIR)/$(DOCNAME).pdf"

clean:
	latexmk -c
	rm -rf $(BUILDDIR)/*

watch: prepare
	latexmk -pvc $(DOCNAME).tex
