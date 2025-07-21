all: preprepo book.md book.pdf book.epub

.PHONY: preprepo
preprepo:
	-rm CONTRIBUTING.md
	-rm LICENSE.md
	-rm README.md
	cp docs/CONTRIBUTING.md CONTRIBUTING.md
	cp docs/LICENSE.md LICENSE.md
	cp docs/index.md README.md

.PHONY: book.md
book.md:
	cat pre.md > book.md
	cat docs/index.md >> book.md
	cat docs/CONTRIBUTING.md >> book.md
	cat $(shell find docs -name '[0-9]*' | sort | tr '\n' ' ') >> book.md
	cat docs/Ancillaries/*.md >> book.md
	cat docs/LICENSE.md >> book.md

book.pdf: book.md
	cp book.md docs/
	cd docs && pandoc book.md -o book.pdf

book.epub: book.md
	cp book.md docs/
	cd docs && pandoc book.md -o book.epub
