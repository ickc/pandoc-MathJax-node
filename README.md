Also see in <https://ickc.github.io/pandoc-MathJax-node/>.

# Test the Use of Mathjax-Node in Pandoc

Testing [mathjax/MathJax-node: Mathjax for Node](https://github.com/mathjax/MathJax-node) with these files:

- [MathJax-node/sample-tex.html at master · mathjax/MathJax-node](https://github.com/mathjax/MathJax-node/blob/master/test-files/sample-tex.html)
- [MathJax/sample.html at master · mathjax/MathJax](https://github.com/mathjax/MathJax/blob/master/test/sample.html)
- [MathJax/sample-eqnum.html at master · mathjax/MathJax](https://github.com/mathjax/MathJax/blob/master/test/sample-eqnum.html)
- [MathJax/sample-eqrefs.html at master · mathjax/MathJax](https://github.com/mathjax/MathJax/blob/master/test/sample-eqrefs.html)

# Dependancy

```bash
npm install pkra/mathjax-node-page
```

# Makefile

The command to use `mjpage` with pandoc is in the makefile.

If you want to make the project, use

```bash
make clean && make -j8
```

# Demo

The followings are the demo, where the `mathjax` output is by the traditional MathJax rendered in browser, and the `mathjax-node-page` output by preprocessing the markdown with `mjpage`. You can compare the later to the former and see what isn't working yet (e.g. `\ref` might have problems).

- <https://ickc.github.io/pandoc-MathJax-node/mathjax/sample-eqnum.html>
- <https://ickc.github.io/pandoc-MathJax-node/mathjax/sample-eqrefs.html>
- <https://ickc.github.io/pandoc-MathJax-node/mathjax/sample-tex.html>
- <https://ickc.github.io/pandoc-MathJax-node/mathjax/sample.html>
- <https://ickc.github.io/pandoc-MathJax-node/mathjax-node-page/sample-eqnum.html>
- <https://ickc.github.io/pandoc-MathJax-node/mathjax-node-page/sample-eqrefs.html>
- <https://ickc.github.io/pandoc-MathJax-node/mathjax-node-page/sample-tex.html>
- <https://ickc.github.io/pandoc-MathJax-node/mathjax-node-page/sample.html>
