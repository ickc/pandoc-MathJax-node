pandocMD := $(wildcard pandoc-markdown/*.md)
pandocHTML := $(patsubst pandoc-markdown/%.md,pandoc-html/%.html,$(pandocMD))
mathjaxNodepage2html := $(patsubst pandoc-markdown/%.md,MathJax-node-page2html/%.html,$(pandocMD))
mathjaxNodepage2mml := $(patsubst pandoc-markdown/%.md,MathJax-node-page2mml/%.html,$(pandocMD))
# mathjaxNodepage2png := $(patsubst pandoc-markdown/%.md,MathJax-node-page2png/%.html,$(pandocMD))
mathjaxNodepage2svg := $(patsubst pandoc-markdown/%.md,MathJax-node-page2svg/%.html,$(pandocMD))

all: $(pandocHTML) $(mathjaxNodepage2html) $(mathjaxNodepage2mml) $(mathjaxNodepage2svg) #$(mathjaxNodepage2png)

pandoc-html/%.html: pandoc-markdown/%.md
	mkdir -p pandoc-html
	pandoc -s -o $@ $<

MathJax-node-page2html/%.html: pandoc-html/%.html
	mkdir -p MathJax-node-page2html
	page2html --eqno=AMS < $< > $@

MathJax-node-page2mml/%.html: pandoc-html/%.html
	mkdir -p MathJax-node-page2mml
	page2mml --eqno=AMS < $< > $@

# MathJax-node-page2png/%.html: pandoc-html/%.html
# 	mkdir -p MathJax-node-page2png
# 	page2png --eqno=AMS < $< > $@

MathJax-node-page2svg/%.html: pandoc-html/%.html
	mkdir -p MathJax-node-page2svg
	page2svg --eqno=AMS < $< > $@

clean:
	rm -f $(pandocHTML) $(mathjaxNodepage2html) $(mathjaxNodepage2mml) $(mathjaxNodepage2svg) #$(mathjaxNodepage2png)
