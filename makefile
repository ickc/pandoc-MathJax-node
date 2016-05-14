all: MathJax-node/sample-eqnum.html MathJax-node/sample-eqrefs.html MathJax-node/sample.html MathJax-node/sample-tex.html

pandoc-markdown/%.md: MathJax-test/%.html
	mkdir -p pandoc-markdown
	pandoc -t markdown-raw_html -s -o $@ $<

pandoc-html/%.html: pandoc-markdown/%.md
	mkdir -p pandoc-html
	pandoc -s -R -o $@ $<

MathJax-node/%.html: pandoc-html/%.html
	mkdir -p MathJax-node
	page2html --eqno=AMS < $< > $@