# org-mode-tikz-preview
Emacs org-mode is great, I love it, but every love story can't be perfect. However, it's not Emacs' fault, so... :heart:

# The issue
When previewing LaTeX code created with TikZ (!) in org-mode, it couldn't be displayed. The reason is very simple and lies in how previewing works:

1. Org takes the LaTeX strings from the buffer and inserts each of them in a corresponding .tex file with a preformatted preamble.

1. The variable `org-preview-latex-default-process` tells Org what process it should use. The list of processes is in the variable `org-preview-latex-process-alist`.

1. Default process is `dvipng`, telling Org to compile the .tex file with `latex`, returning a .dvi file. This is a problem because .dvi files can't display pictures created with TikZ.

1. One could avoid the problem by choosing `imagemagick` process, telling Org to compile with `pdflatex`. However this might still give some problems depending on which version of ImageMagick is installed. Long story short, it was found a [vulnerability in GhostScript](https://www.kb.cert.org/vuls/id/332928/) and, consequently, it was added to ImageMagick a security policy (still there in ImageMagick 6.9.10-23) in `/etc/ImageMagick-6/policy.xml` blocking operations on .pdf files:

```xml
  <!-- disable ghostscript format types -->
  <policy domain="coder" rights="none" pattern="PS" />
  <policy domain="coder" rights="none" pattern="PS2" />
  <policy domain="coder" rights="none" pattern="PS3" />
  <policy domain="coder" rights="none" pattern="EPS" />
  <policy domain="coder" rights="none" pattern="PDF" />
  <policy domain="coder" rights="none" pattern="XPS" />
```

# A solution
One could simply comment out the line in `/etc/ImageMagick-6/policy.xml` for .pdf files, but I didn't know whether it could face me to potential risks.

So I simply added a new process to `org-preview-latex-process-alist` using [GraphicsMagick](http://www.graphicsmagick.org/). To do it, see [`solution.el`](solution.el), it's just a couple of Emacs commands.

## How to install GraphicsMagick
For Ubuntu 19.10:

`$ sudo apt install graphicsmagick`
