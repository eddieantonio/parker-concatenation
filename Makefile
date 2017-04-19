all: parker.pdf parker

%: %.lhs
	ghc $<

%.pdf: %.lhs
	latexmk -xelatex -halt-on-error -interaction=nonstopmode $<
