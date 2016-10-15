# Test the Use of Mathjax-Node in Pandoc

Testing [mathjax/MathJax-node: Mathjax for Node](https://github.com/mathjax/MathJax-node) with these files:

- [MathJax-node/sample-tex.html at master · mathjax/MathJax-node](https://github.com/mathjax/MathJax-node/blob/master/test-files/sample-tex.html)
- [MathJax/sample.html at master · mathjax/MathJax](https://github.com/mathjax/MathJax/blob/master/test/sample.html)
- [MathJax/sample-eqnum.html at master · mathjax/MathJax](https://github.com/mathjax/MathJax/blob/master/test/sample-eqnum.html)
- [MathJax/sample-eqrefs.html at master · mathjax/MathJax](https://github.com/mathjax/MathJax/blob/master/test/sample-eqrefs.html)

# Preparing the `bin`

Put mathjax-node's bin in the `PATH`

```bash
# mathjax-node bin
export PATH="/usr/local/lib/node_modules/mathjax-node/bin:$PATH"
```

Also see `/usr/local/lib/node_modules/mathjax-node/batik/README.md` on how to install `batik` for `png` output.

# Makefile

The MathJax HTML test files in `MathJax-test/` are manually converted to markdown files in `pandoc-markdown/`.

Then just `make` to produce all `mathjax-node` generated files.
