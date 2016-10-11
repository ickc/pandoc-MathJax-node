original := $(wildcard MathJax-test/*.html)
pandocMD := $(patsubst MathJax-test/%.html,pandoc-markdown/%.md,$(original))
pandocHTML := $(patsubst MathJax-test/%.html,pandoc-html/%.html,$(original))
mathjaxOutput := $(patsubst MathJax-test/%.html,MathJax-node/%.html,$(original))

all: $(mathjaxOutput) $(pandocHTML) $(pandocMD)

pandoc-markdown/%.md: MathJax-test/%.html
	mkdir -p pandoc-markdown
	pandoc -t markdown-raw_html -s -o $@ $<

pandoc-html/%.html: pandoc-markdown/%.md
	mkdir -p pandoc-html
	pandoc -s -R -o $@ $<

MathJax-node/%.html: pandoc-html/%.html
	mkdir -p MathJax-node
	page2html --eqno=AMS < $< > $@

clean:
	rm -f $(mathjaxOutput) $(pandocHTML) $(pandocMD)
