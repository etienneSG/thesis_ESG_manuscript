# Name of the generated pdf
PDF_NAME=thesis_ESG
TEX_NAME=thesis_ESG
OUT_DIR=auxiliary_files

all: pdf change_name

pdf: $(TEX_NAME).tex
	@mkdir -p $(OUT_DIR)
	pdflatex -output-directory=$(OUT_DIR) $(TEX_NAME).tex
	bibtex $(OUT_DIR)/$(TEX_NAME).aux
	pdflatex -output-directory=$(OUT_DIR) $(TEX_NAME).tex
	pdflatex -output-directory=$(OUT_DIR) $(TEX_NAME).tex

change_name:
	@cp $(OUT_DIR)/$(TEX_NAME).pdf $(PDF_NAME).pdf

clean:
	@find . -name '*~' -exec rm '{}' \;
	@rm -r $(OUT_DIR)

