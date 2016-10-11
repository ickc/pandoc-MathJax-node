original := $(wildcard MathJax-test/*.html)
pandocMD := $(patsubst MathJax-test/%.html,pandoc-markdown/%.md,$(original))
pandocHTML := $(patsubst MathJax-test/%.html,pandoc-html/%.html,$(original))
mathjaxNodepage2html := $(patsubst MathJax-test/%.html,MathJax-node-page2html/%.html,$(original))
mathjaxNodepage2mml := $(patsubst MathJax-test/%.html,MathJax-node-page2mml/%.html,$(original))
# mathjaxNodepage2png := $(patsubst MathJax-test/%.html,MathJax-node-page2png/%.html,$(original))
mathjaxNodepage2svg := $(patsubst MathJax-test/%.html,MathJax-node-page2svg/%.html,$(original))

all: $(pandocMD) $(pandocHTML) $(mathjaxNodepage2html) $(mathjaxNodepage2mml) $(mathjaxNodepage2svg) #$(mathjaxNodepage2png)

pandoc-markdown/%.md: MathJax-test/%.html
	mkdir -p pandoc-markdown
	pandoc -t markdown-raw_html -o $@ $<

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
	rm -f $(pandocMD) $(pandocHTML) $(mathjaxNodepage2html) $(mathjaxNodepage2mml) $(mathjaxNodepage2svg) #$(mathjaxNodepage2png)
