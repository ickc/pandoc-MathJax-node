pandocMD := $(wildcard source/*.md)
mathjaxNodePageMD := $(patsubst source/%.md,mjpage/%.md,$(pandocMD))
mathjaxNodePageHTML := $(patsubst source/%.md,docs/mathjax-node-page/%.html,$(pandocMD))
mathjaxHTML := $(patsubst source/%.md,docs/mathjax/%.html,$(pandocMD))

DOCS := docs/index.md

all: $(mathjaxHTML) $(mathjaxNodePageMD) $(mathjaxNodePageHTML) $(DOCS)

# $(mathjaxNodePageMD): mathjax-node-page processed markdown
mjpage/%.md: source/%.md
	mkdir -p mjpage
	mjpage --dollars --format=TeX --eqno=AMS < $< > $@
	sed -i -e 's/<[/]\?html>//g' -e 's/<[/]\?head>//g' -e 's/<[/]\?body>//g' $@

# $(mathjaxNodePageHTML): html from the mathjax-node-page processed markdown
docs/mathjax-node-page/%.html: mjpage/%.md
	mkdir -p docs/mathjax-node-page
	pandoc -S -s -o $@ $<

# $(mathjaxHTML):  html from the original markdown, using mathjax
# This is the reference $(mathjaxNodePageHTML) should compare to
docs/mathjax/%.html: source/%.md
	mkdir -p docs/mathjax
	pandoc --mathjax -S -s -o $@ $<
	sed -i 's/<script/<script type="text\/x-mathjax-config">MathJax.Hub.Config({TeX: {equationNumbers: { autoNumber: "AMS"},}});<\/script><script/' $@

docs/index.md: $(mathjaxHTML) $(mathjaxNodePageHTML)
	printf "%s\n" "---" "..." "" > $@
	find docs -iname '*.html' | sed 's/^docs\/\(.*\)$$/- <https:\/\/ickc\.github\.io\/pandoc-MathJax-node\/\1>/' >> $@

clean:
	rm -f $(mathjaxHTML) $(mathjaxNodePageMD) $(mathjaxNodePageHTML) $(DOCS)
