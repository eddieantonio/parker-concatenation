all: parker.pdf parker

%: %.lhs
	ghc $<

%.pdf: %.lhs
	xelatex -halt-on-error -interaction=nonstopmode $<
